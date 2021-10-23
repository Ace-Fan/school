package com.thinkgem.jeesite.modules.wisdom.web.base;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
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
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisAppVerDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisAppVer;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataImportTab;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisAppVerService;

import net.sf.json.JSONObject;

/**
 * @title 版本信息控制层
 * @author weekly
 * @version 2019-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/wisAppVer")
public class WisAppVerController extends BaseCrudController<WisAppVerService, WisAppVerDao, WisAppVer> {

	String list = "modules/wisdom/base/wisAppVerList";		// 表格页面
	String form = "modules/wisdom/base/wisAppVerForm";		// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisAppVer entity = new WisAppVer();
		model.addAttribute("rootUrl", "/wisdom/base/wisAppVer"); 			// rootUrl 访问路径
		model.addAttribute("tableName", entity.getTableName()); // tableName 表名
	}
	
	// JSON对象字符串封装为对象
	public WisAppVer repJson(String json) { 
		return (WisAppVer) JSONObject.toBean(toJsonObject(json), WisAppVer.class);
	}
	
	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<WisAppVer>> findAllList(WisAppVer entity) {
		return super.findList(entity);
	}
	
	// 根据主键获取模板信息
	@ModelAttribute
	public WisAppVer get(@RequestParam(required = false) String id) {
		WisAppVer entity = null;
		if (StringUtils.isNotBlank(id)) { entity = super.entityService.get(id); }
		if (entity == null) { entity = new WisAppVer(); }
		return entity;
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
		WisAppVer entity = new WisAppVer(); // 持久层对象
		copyModel(id, "wisAppVer", entity, model);
		return form;
	}
	
	// 调整到修改或者查看页面
	@RequestMapping(value = "getShow")
	public String form(String id, String type, Model model) {
		model(model); // 通用model方法
		modelType(type, model);
		return form;
	}
	
	// 添加或修改信息
	@RequestMapping(value = "save")
	@ResponseBody
	public void save(String json, String tableName, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.getWriter().write(JsonMapper.getInstance().toJson(save(repJson(json), tableName)));
	}
	
	/**
	 * excel 导出
	 * @param ids
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "export")
	public void export(String[] ids, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] title = { "应用名称", "应用类型", "版本号", "文件名称" };				// EXCEL标题
		String[] colum = {  "AppName","AppType", "AppVer", "FileName" };		// EXCEL值列名
		String fileName = "版本信息" + getNowTime() + ".xls";						// EXCEL文件名
		String excelName = "版本信息";											// EXCEL标题名称
		export(ids, title, colum, fileName, excelName, request, response);		// EXCEL通用导出方法
	}

	// EXCEL导入方法
	@RequestMapping(value = "/upApk", method = RequestMethod.POST)
	@ResponseBody
	public void upImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request) throws IOException {
		// 获取当前服务器下目录
		String path = request.getSession().getServletContext().getRealPath("/") + "upload/apk/";
		path = path.replaceAll("\\\\", "/");
		// 回调字符串
		String resStr = FileUtil.singleFileUpload(file, path);
		
		WisAppVer entity = new WisAppVer();
		
		// 回调字符串转JSON对象
		JSONObject json = JSONObject.fromObject(resStr);
		// 取回调编码
		String code = json.getString("code");
		// 取回调结果
		String resultStr = json.getString("result");
		int pos = resultStr.lastIndexOf("/");
		// 设置回调结果中文件名称信息
		entity.setFileName(resultStr.substring(pos+1));
		// 设置回调结果路径信息
		entity.setFileUrl(resultStr);
		
		if ("200".equals(code)) {
			result.setCode(10005);
			result.setData(entity);
			result.setMsg("上传文件成功");
		} else {
			result.setCode(40005);
			result.setData(null);
			result.setMsg("上传文件失败");
		}
		
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
    }
	
	/**
	 * 传递文件名,返回对象集合-HSSF
	 * @param file
	 * @return
	 * @throws ParseException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 */
	@SuppressWarnings("unchecked")
	public List<WisAppVer> getHSSFExcelList(File file) {
		List<WisAppVer> list = new ArrayList<WisAppVer>();
		
		// 获取HSSF-excel返回信息
		Map<String,Object> map = getHSSFExcel(file, new WisAppVer().getTableName());
		int rowNo = (int) map.get("rowNo");
		HSSFSheet sheet = (HSSFSheet) map.get("sheet");
		int colNo = (int) map.get("colNo");
		List<String> headList = (List<String>) map.get("headTitle");
		
		for (int i = 1; i <= rowNo; i++) {
			HSSFRow row = sheet.getRow(i);
			WisAppVer entity = new WisAppVer();
			HSSFTmpReflect(colNo, headList, row, entity);			// 通用反射机制
			list.add(entity);
		}
		
		return list;
	}
	
	/**
	 * 传递文件名,返回对象集合-XSSF
	 * @param file
	 * @return
	 * @throws ParseException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 */
	@SuppressWarnings("unchecked")
	public List<WisAppVer> getXSSFExcelList(File file) {
		List<WisAppVer> list = new ArrayList<WisAppVer>();
		
		// 获取HSSF-excel返回信息
		Map<String,Object> map = getXSSFExcel(file, new WisAppVer().getTableName());
		int rowNo = (int) map.get("rowNo");
		XSSFSheet sheet = (XSSFSheet) map.get("sheet");
		int colNo = (int) map.get("colNo");
		List<String> headList = (List<String>) map.get("headTitle");
		
		for (int i = 1; i <= rowNo; i++) {
			XSSFRow row = sheet.getRow(i);
			WisAppVer entity = new WisAppVer();
			XSSFTmpReflect(colNo, headList, row, entity);			// 通用反射机制
			list.add(entity);
		}
		
		return list;
	}
	
	/**
	 * EXCEL导入
	 * @param file
	 * @param tableName
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/excelFileLead", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject uploadFileExcel(MultipartFile file, String tableName, HttpServletRequest request) {
		
		JSONObject resObj = new JSONObject();						// 定义返回结果集
		List<WisAppVer> excelList = new ArrayList<WisAppVer>(); // 定义EXCEL集合
		
		// 定义结果Map信息
		Map<String, WisAppVer> map = getExcelMap("appName");
		
		WisDataImportTab entity = wisDataImportTabService.getExcelFileUrlByTabCode("wis_app_ver");
		
		if (entity != null) {
			File excelFile = multipartFileToFile(file);		// excel文件
			String fileName = excelFile.getName();		// 获取原始文件名
			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);	// 文件后缀名
			
			boolean bool = checkExcelLength(suffix, entity, excelFile);
			
			if (bool) {
				
				try {
					if ("xls".equals(suffix)) {
						excelList = getHSSFExcelList(excelFile);
					} else if ("xlsx".equals(suffix)) {
						excelList = getXSSFExcelList(excelFile);
					}
				} catch (IndexOutOfBoundsException e) {
					resObj.put("code", "-1");
					resObj.put("msg", "当前模块导入未配置或未启用！");
					return resObj;
				}
				
				if (excelList != null) {
					
					excelList = getExcelList("appName", excelList, map);	// 处理集合信息
					
					if (excelList.size()>0) {
						
						int count = excelInsert(excelList);
						
						if (count > 0) {
							resObj.put("code", "1");
							resObj.put("msg", "成功导入"+count+"条记录");
							return resObj;
						} else if (count == 0) {
							resObj.put("code", "1");
							resObj.put("msg", "当前ECXEL表格数据已存在");
							return resObj;
						}
						
					} else {
						resObj.put("code", "1");
						resObj.put("msg", "当前ECXEL表格数据已存在");
						return resObj;
					}
				
				} else {
					resObj.put("code", "-5");
					resObj.put("msg", "当前ECXEL表格数据格式不正确");
					return resObj;
				}
				
			} else {
				resObj.put("code", "-4");
				resObj.put("msg", "当前列数不够！");
				return resObj;
			}
					
		} else {
			resObj.put("code", "-1");
			resObj.put("msg", "当前模块导入未启用！");
			return resObj;
		}
		
		return resObj;
    }
}