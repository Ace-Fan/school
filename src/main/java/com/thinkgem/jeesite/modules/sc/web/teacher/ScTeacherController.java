package com.thinkgem.jeesite.modules.sc.web.teacher;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.crud.BaseCrudController;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.ResultPage;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.Token;
import com.thinkgem.jeesite.modules.sc.entity.teacher.ScTeacher;
import com.thinkgem.jeesite.modules.sc.service.teacher.ScTeacherService;
import com.thinkgem.jeesite.modules.wisdom.service.base.SysBaseDictService;
import com.thinkgem.jeesite.modules.wisdom.util.base.StringUtil;
import com.thinkgem.jeesite.modules.wisdom.util.base.UeditorUtil;
import com.thinkgem.jeesite.modules.base.util.FileUtil;
import com.thinkgem.jeesite.modules.sc.dao.teacher.ScTeacherDao;

import net.sf.json.JSONObject;

/**
 * @title 教师信息表控制层
 * @author wufan
 * @version 2019-12-21
 */
@Controller
@RequestMapping(value = "${adminPath}/sc/teacher/scTeacher")
public class ScTeacherController extends BaseCrudController<ScTeacherService, ScTeacherDao, ScTeacher> {

	@Autowired
	private SysBaseDictService sysBaseDictService;
	private ScTeacherService scTeacherService;

	String list = "modules/sc/teacher/scTeacherList"; // 表格页面
	String form = "modules/sc/teacher/scTeacherForm"; // 表单页面
	String tableName = new ScTeacher().getTableName(); // 数据表名

	// 通用model
	public void model(Model model) {
		model.addAttribute("rootUrl", "/sc/teacher/scTeacher"); // rootUrl 访问路径
		model.addAttribute("tableName", tableName); // tableName 表名
		model.addAttribute("dictList", sysBaseDictService.getAllList());
		model.addAttribute("interfacePath", interfacePath); // 上传接口地址
		model.addAttribute("imgServerPath", imgServerPath); // 原图片地址
	}

	// JSON对象字符串封装为对象
	public ScTeacher repJson(String json) {
		return (ScTeacher) JSONObject.toBean(toJsonObject(json), ScTeacher.class);
	}

	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<ScTeacher>> findAllList(ScTeacher entity) {
		return super.findList(entity);
	}

	// 根据主键获取模板信息
	@ModelAttribute
	public ScTeacher get(@RequestParam(required = false) String id, Model model) {
		ScTeacher entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = super.entityService.get(id);
		}
		if (entity == null) {
			entity = new ScTeacher();
		}
		model.addAttribute("teacherImageList", ResultPage.imgsList(entity.getTeachCert()));
		return entity;
	}

	// 根据教师编码获取评分信息
	@RequestMapping(value = "/getByCode", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public boolean getByCode(@RequestBody ScTeacher scTeacher) {
		String code = scTeacher.getCode();
		ScTeacher entity = scTeacherService.getByCode(code);
		if (entity == null) {
			return true;
		} else {
			return false;
		}
	}

	// 跳转到表格页面
	@RequestMapping(value = { "show", "" })
	public String list(String localStoragePage, Model model) {
		model(model); // 通用model
		return list;
	}

	// 跳转到复制添加页面
	@RequestMapping(value = "getCopyForm")
	public String copyform(String id, Model model) {
		model(model); // 通用model方法
		model.addAttribute("is", "edit");
		ScTeacher entity = new ScTeacher(); // 持久层对象
		copyModel(id, "scTeacher", entity, model);
		return form;
	}

	// 调整到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 通用model方法
		modelType(type, model);
		logger.debug("type:" + type);
		if (id != null && !"".equals(id)) {
			model.addAttribute("scTeacher", entityService.get(id));
		}
		return form;
	}

	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(String json, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String projectPath = request.getSession().getServletContext().getRealPath("/"); // 当前项目路径
		projectPath = projectPath.substring(0, projectPath.length() - 1); // 去掉最后一位
		projectPath = projectPath.replaceAll("\\\\", "/");
		projectPath = StringUtil.getLastIndexOf(projectPath, "/");

		// 转义JSON转义的前端字符
		ScTeacher entity = repJson(json);
		JSONObject teacher = toJsonObject(json);
		if ("".equals(teacher.get("glBirthday"))) {
			entity.setGlBirthday(null);
		}
		if ("".equals(teacher.get("nlBirthday"))) {
			entity.setNlBirthday(null);
		}
		if ("请选择省".equals(teacher.get("province"))) {
			entity.setProvince(null);
		}
		if ("请选择市".equals(teacher.get("city"))) {
			entity.setCity(null);
		}
		if ("请选择区县".equals(teacher.get("county"))) {
			entity.setCounty(null);
		}
		String updateLog = StringEscapeUtils.unescapeHtml4(entity.getTeachBiref());
		String content = UeditorUtil.getUploadFileRes(updateLog, projectPath); // 需要修改的内容字段
		String image = ResultPage.imgsString(entity.getTeachCert());
		entity.setTeachCert(image);
		entity.setTeachBiref(content);
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(entity, tableName)));
	}

	// 图片上传
	@RequestMapping(value = "/upImage", method = RequestMethod.POST)
	@ResponseBody
	public void upImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		ScTeacher scTeacher = new ScTeacher();
		String path = request.getSession().getServletContext().getRealPath("/") + "upload/image/";
		path = path.replaceAll("\\\\", "/");
		logger.debug("服务器地址path:" + path);

		String originalFileName = file.getOriginalFilename();
		String pfx = originalFileName.substring(originalFileName.lastIndexOf("."));
		String fileName = UUID.randomUUID().toString().replaceAll("-", "");
		String sourceImg = path + File.separator + fileName + pfx;
		File file1 = new File(sourceImg);
		if (!file1.getParentFile().exists()) {
			file1.getParentFile().mkdirs();
		} // 判断路径是否存在,没有则新建
		file.transferTo(file1);

		String resStr = FileUtil.fileUploadRes(sourceImg, file1, path); // 上传图片回文
		resStr = FileUtil.jsonRes(resStr); // 回调结果路径
		logger.debug("图片路径-resStr:" + resStr);

		String fileNames = file1.getName(); // 获取原始文件名
		String fileTypes = FileUtil.getTempContentType(path + fileNames); // 根据原始文件名获取其文件类型
		logger.debug("原始文件名fileNames:" + fileNames);
		logger.debug("文件类型-fileTypes:" + fileTypes);

		try {
			BufferedImage bufferedImage = ImageIO.read(file1); // 读取文件获取图片流
			int imgWidth = bufferedImage.getWidth(); // 通过图片流获取图片宽度
			int imgHeight = bufferedImage.getHeight(); // 通过图片流获取图片高度
			logger.debug("图片宽度-imgWidth:" + imgWidth);
			logger.debug("图片高度-imgHeight:" + imgHeight);

			// 设置图片信息
			scTeacher.setImgWidth(imgWidth + "");
			scTeacher.setImgHeight(imgHeight + "");
			scTeacher.setImgFormat(fileTypes);
			scTeacher.setImgUrl(resStr);

			result.setCode(1);
			result.setData(scTeacher);
			result.setMsg("上传图片成功");
		} catch (Exception e) {
			result.setCode(-1);
			result.setData(null);
			result.setMsg("上传图片异常");
		}
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
	}

	// Excel 导出
	@RequestMapping(value = "export")
	public void export(String[] ids, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] title = { "教师编码", "教师姓名", "性别", "年龄", "民族", "政治面貌", "手机号码", "所在省", "所在市", "所在区县", "常住地址", "创建时间" }; // EXCEL标题
		String[] colum = { "Code", "Name", "Sex", "Age", "MzId", "ZzmmId", "Phone", "Province", "City", "County",
				"Address", "CreateDate" }; // EXCEL值列名
		String fileName = "教师信息表" + getNowTime() + ".xls"; // EXCEL文件名
		String excelName = "教师信息表"; // EXCEL标题名称
		export(ids, title, colum, fileName, excelName, request, response); // EXCEL通用导出方法
	}

}