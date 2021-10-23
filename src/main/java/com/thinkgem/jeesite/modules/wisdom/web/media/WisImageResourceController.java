package com.thinkgem.jeesite.modules.wisdom.web.media;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.thinkgem.jeesite.modules.base.util.FileUtil;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wisdom.dao.media.WisImageResourceDao;
import com.thinkgem.jeesite.modules.wisdom.entity.media.WisImageResource;
import com.thinkgem.jeesite.modules.wisdom.service.media.WisImageResourceService;
import com.thinkgem.jeesite.modules.wisdom.service.media.WisImageTypeService;

import net.sf.json.JSONObject;

/**
 * 图片资源管理Controller
 * @author weekly
 * @version 2019-09-18
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/media/wisImageResource")
public class WisImageResourceController extends BaseCrudController<WisImageResourceService, WisImageResourceDao, WisImageResource> {

	// 图片类型信息
	@Autowired
	private WisImageTypeService wisImageTypeService;
	
	String list = "modules/wisdom/media/wisImageResourceList";	// 表格页面
	String form = "modules/wisdom/media/wisImageResourceForm";	// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisImageResource wisImageResource = new WisImageResource();
		model.addAttribute("rootUrl", "/wisdom/media/wisImageResource"); // rootUrl 访问路径
		model.addAttribute("tableName", wisImageResource.getTableName()); // tableName 表名
		model.addAttribute("wisImageTypeList", wisImageTypeService.getAllList()); // tableName 表名
		
		model.addAttribute("interfacePath", interfacePath); // 上传图片接口地址
		model.addAttribute("imgServerPath", imgServerPath); // 上传图片接口地址
		
	}
	
	// JSON对象字符串封装为对象
	public WisImageResource repJson(String json) { 
		return (WisImageResource) JSONObject.toBean(toJsonObject(json), WisImageResource.class);
	}
	
	@ModelAttribute
	public WisImageResource get(@RequestParam(required=false) String id) {
		WisImageResource entity = null;
		if (StringUtils.isNotBlank(id)){ entity = entityService.get(id); }
		if (entity == null){ entity = new WisImageResource(); }
		return entity;
	}
	
	// 跳转到表格页面
	@RequestMapping(value = { "show", "" })
	public String list(Model model) {
		model(model); // 通用model
		return list;
	}

	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<WisImageResource>> findAllList(WisImageResource wisImageResource) {
		return findList(wisImageResource);
	}

	// 跳转到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 当前model方法
		modelType(type, model);
		logger.debug("type:"+type);
		if (id != null && !"".equals(id)) { model.addAttribute("wisImageResource", entityService.get(id));  }
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		String officeId = UserUtils.getUser().getOffice().getId();	//当前登录机构
		WisImageResource entity = repJson(json);
		entity.setCreateOrg(officeId);
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(entity, tableName)));
	}
	
	// 图片上传
	@RequestMapping(value = "/upImage", method = RequestMethod.POST)
	@ResponseBody
	public void upImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request) throws IOException {
		WisImageResource wisImageResource = new WisImageResource();
		String path = request.getSession().getServletContext().getRealPath("/") + "upload/image/";
		path = path.replaceAll("\\\\", "/");
		logger.debug("服务器地址path:"+path);
        
		String originalFileName = file.getOriginalFilename();
        String pfx = originalFileName.substring(originalFileName.lastIndexOf("."));
        String fileName = UUID.randomUUID().toString().replaceAll("-", "");
        String sourceImg = path + File.separator + fileName + pfx;
        File file1 = new File(sourceImg);
        if (!file1.getParentFile().exists()) { file1.getParentFile().mkdirs(); }  // 判断路径是否存在,没有则新建
        file.transferTo(file1);
		
		String resStr = FileUtil.fileUploadRes(sourceImg, file1, path);				// 上传图片回文
		resStr = FileUtil.jsonRes(resStr);											// 回调结果路径
        logger.debug("图片路径-resStr:"+resStr);
		
		String fileNames = file1.getName();											// 获取原始文件名
		String fileTypes = FileUtil.getTempContentType(path + fileNames);			// 根据原始文件名获取其文件类型
		logger.debug("原始文件名fileNames:"+fileNames);
        logger.debug("文件类型-fileTypes:"+fileTypes);
		
		try {
			BufferedImage bufferedImage = ImageIO.read(file1); 						// 读取文件获取图片流
			int imgWidth = bufferedImage.getWidth(); 								// 通过图片流获取图片宽度
	        int imgHeight = bufferedImage.getHeight(); 								// 通过图片流获取图片高度
	        logger.debug("图片宽度-imgWidth:"+imgWidth);
	        logger.debug("图片高度-imgHeight:"+imgHeight);
	        
	        // 设置图片信息
	        wisImageResource.setImgWidth(imgWidth+"");		
	        wisImageResource.setImgHeight(imgHeight+"");
	        wisImageResource.setImgFormat(fileTypes);
	        wisImageResource.setImgUrl(resStr);
	        
			result.setCode(1);
			result.setData(wisImageResource);
			result.setMsg("上传图片成功");
		} catch (Exception e) {
			result.setCode(-1);
			result.setData(null);
			result.setMsg("上传图片异常");
		}
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
    }
	
}