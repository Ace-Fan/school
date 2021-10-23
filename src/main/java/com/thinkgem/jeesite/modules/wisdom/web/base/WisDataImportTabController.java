package com.thinkgem.jeesite.modules.wisdom.web.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import com.thinkgem.jeesite.modules.wisdom.dao.base.WisDataImportTabDao;
import com.thinkgem.jeesite.modules.wisdom.entity.base.BaseGenTable;
import com.thinkgem.jeesite.modules.wisdom.entity.base.Columns;
import com.thinkgem.jeesite.modules.wisdom.entity.base.ExcelTable;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataImportTab;
import com.thinkgem.jeesite.modules.wisdom.service.base.BaseGenTableService;
import com.thinkgem.jeesite.modules.wisdom.service.base.ColumnsService;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisDataImportTabService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @title 数据导入配置控制层
 * @author weekly
 * @version 2019-10-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wisdom/base/wisDataImportTab")
public class WisDataImportTabController extends BaseCrudController<WisDataImportTabService, WisDataImportTabDao, WisDataImportTab> {

	// 字段信息
	@Autowired
	private ColumnsService columnsService;
	
	// 表格信息
	@Autowired
	private BaseGenTableService genTableService;
	
	String list = "modules/wisdom/base/wisDataImportTabList";		// 表格页面
	String form = "modules/wisdom/base/wisDataImportTabForm";		// 表单页面
	
	// 通用model
	public void model(Model model) {
		WisDataImportTab entity = new WisDataImportTab();
		model.addAttribute("rootUrl", "/wisdom/base/wisDataImportTab"); 		// rootUrl 访问路径
		model.addAttribute("tableName", entity.getTableName()); 				// tableName 表名
		
		List<BaseGenTable> genTableList = genTableService.getAllList();
		model.addAttribute("genTableList", genTableList); 	
	}
	
	// JSON对象字符串封装为对象
	public WisDataImportTab repJson(String json) { 
		return (WisDataImportTab) JSONObject.toBean(toJsonObject(json), WisDataImportTab.class);
	}
	
	// 获取模板分页信息
	@RequestMapping(value = "/list")
	@ResponseBody
	@Token(save = true)
	public ResultPage<List<WisDataImportTab>> findAllList(WisDataImportTab entity) {
		return super.findList(entity);
	}
	
	// 根据主键获取模板信息
	@ModelAttribute
	public WisDataImportTab get(@RequestParam(required = false) String id) {
		WisDataImportTab entity = null;
		if (StringUtils.isNotBlank(id)) { entity = super.entityService.get(id); }
		if (entity == null) { entity = new WisDataImportTab(); }
		return entity;
	}
	
	// 跳转到表格页面
	@RequestMapping(value = { "show", "" })
	public String list(String localStoragePage, Model model) {
		model(model); // 通用model
		return list;
	}
	
	/**
	 * 传递表名获取数据表格信息
	 * @param tableName
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/getList", method = {RequestMethod.POST})
	@ResponseBody
	public void findList(String id, String tableName, HttpServletResponse response)throws Exception {
		List<ExcelTable> excelTableList = new ArrayList<ExcelTable>();
		List<String> idList = new ArrayList<String>();					// 声明主键集合
		List<String> nameList = new ArrayList<String>();				// 声明名称集合
			
		// 通过传递的主键，获取主表数据，并将获取的JSON字符串转JSON遍历获取主键集合、名称集合
		WisDataImportTab entity = entityService.get(id);
		String excelHead = entity.getExcelHeader();
		JSONArray jsonArray = JSONArray.fromObject(excelHead);
		for (int i = 0; i < jsonArray.size(); i++) {
			String[] str = (jsonArray.get(i)+"").split(",");
			idList.add(str[0]);
			nameList.add(str[1]);
		}
		
		// 数据库表格信息
		List<Columns> colList = columnsService.findList(tableName);
		
		// logger.debug("colList:=============="+colList.toString());
		
		// 设置回调信息
		for (int i = 0; i < colList.size(); i++) {
			ExcelTable excelTable = new ExcelTable();							// 声明EXCEL回调结果集
			excelTable.setFieldName(colList.get(i).getFieldName());				// 字段名称（英文）
			excelTable.setFieldComment(colList.get(i).getFieldComment());		// 字段说明(字段注释)-- 中文名
			excelTable.setFieldType(colList.get(i).getFieldType()); 			// 字段类型（默认1）
			excelTable.setDefaultVal(colList.get(i).getDefaultVal()); 			// 设置默认值
			
			// 是否为空（yes,no）
			String isNullableStr = colList.get(i).getIsNullable();
			if ("0".equals(isNullableStr)) {
				excelTable.setIsNullable("no"); 									
			} else if ("1".equals(isNullableStr)) {
				excelTable.setIsNullable("yes"); 								
			}
			
			excelTable.setIsImport("1");										// 是否导入（0：不需导入；1：需导入）  初始需导入 1
			excelTable.setExcelColumnNo(idList);								// EXCEL列号（List<String>）下拉框
			excelTable.setExcelColumnName(nameList);							// EXCEL列名（List<String>）下拉框
			
			excelTable.setDataTabId(entity.getId());				// 所属数据表id(对应主表ID)  传递的主键信息
			excelTable.setDataTabName(entity.getFileName());		// 所属数据表id(对应主表ID)  传递的主键名称
			excelTableList.add(excelTable);
		}
		
		// logger.debug("excelTableList:-------------------"+excelTableList.toString());
		
		result.setCode(1);
		result.setMsg("查询成功");
		result.setSuccess(true);
		result.setData(excelTableList);
		response.getWriter().write(JsonMapper.toJsonString(result));
	}
	
	// 跳转到复制添加页面
	@RequestMapping(value = "getCopyForm")
	public String copyform(String id, Model model) {
		model(model); // 通用model方法
		model.addAttribute("is", "edit");
		WisDataImportTab entity = new WisDataImportTab(); // 持久层对象
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
	public void save(HttpServletResponse response, String json,String tableName) throws Exception {
		WisDataImportTab entity = repJson(json);
		
		int length = entity.getExcelHeader().length();
		
		if (length <= 1) {
			entity.setExcelHeader(null);
		}
		
		response.getWriter().write(JsonMapper.getInstance().toJson(saveService(entity, tableName)));
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
		String[] title = { "数据表名称", "数据表编码", "EXCEL文件名" };				// EXCEL标题
		String[] colum = {  "TabName", "TableCode", "FileName" };		// EXCEL值列名
		String fileName = "数据导入配置信息" + getNowTime() + ".xls";						// EXCEL文件名
		String excelName = "数据导入配置信息";											// EXCEL标题名称
		export(ids, title, colum, fileName, excelName, request, response);		// EXCEL通用导出方法
	}
	
	// EXCEL导入方法
	@RequestMapping(value = "/upExcel", method = RequestMethod.POST)
	@ResponseBody
	public void upImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request) throws IOException {
		WisDataImportTab entity = new WisDataImportTab();
		File excelFile = multipartFileToFile(file);	// 上传图片
		
		// 获取当前服务器下目录
		String path = request.getSession().getServletContext().getRealPath("/") + "upload/excel/";
		path = path.replaceAll("\\\\", "/");
		String uploadPath = request.getContextPath() + "/upload/excel/";
		
		String fileName = excelFile.getName();		// 获取原始文件名
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);	// 文件后缀名
		String fullName = uploadPath + fileName;	// 真实图片路径
		File files = new File(path, fileName);		// 限制文件上传格式
		
		if (suffix.equals("xls")) {
			// 获取EXCEL表头部分
			HSSFWorkbook work = new HSSFWorkbook(new FileInputStream(excelFile)); // 得到这个excel表格对象
			HSSFSheet sheet = work.getSheetAt(0); //得到第一个sheet
			int coloumNum=sheet.getRow(0).getPhysicalNumberOfCells(); // 总列数
			HSSFRow row = sheet.getRow(0);	// 标题部分
			
			List<String> headList = new ArrayList<String>();
			
			for (int i = 0; i < coloumNum; i++) {
				String value = row.getCell(i) + ""; // 标题部分 
				int count = i+1;
				logger.debug("value:"+value);
				value = count + "," + value;		// 标题拼接字符串
				logger.debug("value:"+value);
				headList.add(value);
			}
			
			JSONArray strJson = JSONArray.fromObject(headList);
			String excelHeader = strJson.toString();
	        logger.debug("excelHeader:"+excelHeader);
			
			try {
		        logger.debug("服务器地址path:"+path);
		        logger.debug("项目路径uploadPath:"+uploadPath);
		        logger.debug("原始文件名fileName:"+fileName);
				
		        // 设置APK文件信息
		        entity.setFileName(fileName);		
		        entity.setFileUrl(fullName);
		        entity.setExcelHeader(excelHeader);
		        
				if (!files.getParentFile().exists()) { files.getParentFile().mkdirs(); }  // 判断路径是否存在
				file.transferTo(files); // 完成上传
				
				result.setCode(1);
				result.setData(entity);
				result.setMsg("上传EXCEL成功");
			} catch (Exception e) {
				result.setCode(-1);
				result.setData(null);
				result.setMsg("上传EXCEL异常");
			}
			
		} else if (suffix.equals("xlsx")) {
			
			XSSFWorkbook work = new XSSFWorkbook(new FileInputStream(excelFile)); // 得到这个excel表格对象
			XSSFSheet sheet = work.getSheetAt(0); //得到第一个sheet
			int coloumNum=sheet.getRow(0).getPhysicalNumberOfCells(); // 总列数
			XSSFRow row = sheet.getRow(0);	// 标题部分
			
			List<String> headList = new ArrayList<String>();
			
			for (int i = 0; i < coloumNum; i++) {
				String value = row.getCell(i) + ""; // 标题部分 
				int count = i+1;
				logger.debug("value:"+value);
				value = count + "," + value;		// 标题拼接字符串
				logger.debug("value:"+value);
				headList.add(value);
			}
			
			JSONArray strJson = JSONArray.fromObject(headList);
			String excelHeader = strJson.toString();
	        logger.debug("excelHeader:"+excelHeader);
			
			try {
		        logger.debug("服务器地址path:"+path);
		        logger.debug("项目路径uploadPath:"+uploadPath);
		        logger.debug("原始文件名fileName:"+fileName);
				
		        // 设置APK文件信息
		        entity.setFileName(fileName);		
		        entity.setFileUrl(fullName);
		        entity.setExcelHeader(excelHeader);
		        
				if (!files.getParentFile().exists()) { files.getParentFile().mkdirs(); }  // 判断路径是否存在
				file.transferTo(files); // 完成上传
				
				result.setCode(1);
				result.setData(entity);
				result.setMsg("上传EXCEL成功");
			} catch (Exception e) {
				result.setCode(-1);
				result.setData(null);
				result.setMsg("上传EXCEL异常");
			}
			
		} else {
			result.setCode(1);
			result.setData(null);
			result.setMsg("当前文件格式不支持");
		}
		
		response.getWriter().write(JsonMapper.getInstance().toJson(result));
    }

}