package com.thinkgem.jeesite.common.crud;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.api.util.ExcelImport;
import com.thinkgem.jeesite.api.util.ExcelUtil;
import com.thinkgem.jeesite.common.utils.CodeMsg;
import com.thinkgem.jeesite.common.utils.ResultPage;
import com.thinkgem.jeesite.common.utils.SelectNUtil;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.base.service.BaseGroupTableService;
import com.thinkgem.jeesite.modules.base.util.GetOrgUtil;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;
import com.thinkgem.jeesite.modules.card.utils.Result;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataFieldMapping;
import com.thinkgem.jeesite.modules.wisdom.entity.base.WisDataImportTab;
import com.thinkgem.jeesite.modules.wisdom.service.base.SysBaseAreaCodeService;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisDataFieldMappingService;
import com.thinkgem.jeesite.modules.wisdom.service.base.WisDataImportTabService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 基础CTUD-CONTROLLER层
 * @tit
 * @author weekly
 * @version V19.08.19
 *
 * @param <S>	SERVICE层
 * @param <D>	DAO层
 * @param <T>	持久层
 */
public abstract class BaseCrudController<S extends BaseCrudService<D, T>, D extends BaseCrudDao<T>, T extends BaseCrudEntity> extends BaseController {
	
	// 读取图片服务器地址
	public final String interfacePath = GetOrgUtil.getUrlValue("interfacePath"); 
	
	// 上传图片服务器地址
	public final String imgServerPath = GetOrgUtil.getUrlValue("imgServerPath"); 
	
	// 基础CRUD信息
	@Autowired
	public S entityService;
	
	// 通用消息处理工具类
	public Result result = new Result();
	
	// 通用Excel导出工具类
	public ExcelUtil excelUtil = new ExcelUtil();
	
	// 实例化工具类
	public ExcelImport<T> ex = new ExcelImport<T>();
	
	// 定义下拉框多选组件 拓展工具类
	public SelectNUtil selectNutil = new SelectNUtil();
	
	// 通用组件
	@Autowired
	public BaseGroupTableService baseGroupTableService;
	
	// 导入映射关系
	@Autowired
	public WisDataFieldMappingService wisDataFieldMappingService;
	
	// 导入配置管理
	@Autowired
	public WisDataImportTabService wisDataImportTabService;
	
	// 行政区划信息
	@Autowired
	public SysBaseAreaCodeService sysBaseAreaCodeService;
	
	/**
	 * 分页信息
	 * @param entity	持久层对象
	 * @return
	 */
	public ResultPage<List<T>> findList(T entity) {
		try {
			entity.setPage((entity.getPage() - 1) * entity.getLimit());
			List<T> list = entityService.findList(entity);

			if (null != list && list.size() > 0) {
				return ResultPage.success(entityService.getCountPage(entity), list);
			} else {
				return ResultPage.error(CodeMsg.NOT_FIND_DATA);
			}
		} catch (Exception e) {
			logger.error("BaseCrudController.list error:", e);
			return ResultPage.error(CodeMsg.SERVER_EXCEPTION);
		}
	}
	
	/**
	 * 修改
	 * @param entity	持久层对象
	 * @return
	 */
	public boolean update(T entity) {
		return entityService.update(entity);
	}
	
	/**
	 * 新增
	 * @param entity	持久层对象
	 * @param tableName	表名
	 * @return
	 */
	public boolean insert(T entity, String tableName) {
		return entityService.insert(entity, tableName);
	}
	
	/**
	 * 新增-业务
	 * @param entity	持久层对象
	 * @param tableName 表名
	 * @return
	 */
	public boolean insertService(T entity, String tableName) {
		return entityService.insertService(entity, tableName);
	}
	
	/**
	 * 新增-业务
	 * @param entity	持久层对象
	 * @param tableName 表名
	 * @return
	 */
	public boolean insertServiceTree(T entity, String tableName) {
		return entityService.insertServiceTree(entity, tableName);
	}
	
	/**
	 * 通用连续新增-Type设置
	 * @param type
	 * @param model
	 */
	public void nextModelType(String type, Model model) {
		if ("edit".equals(type)) {
			model.addAttribute("is", "edit");
		} else if ("show".equals(type)) {
			model.addAttribute("is", "show");
		} else {
			model.addAttribute("is", "add");
		}
	}
	
	/**
	 * 通用新增-Type设置
	 * @param type
	 * @param model
	 */
	public void modelType(String type, Model model ) {
		if (type.equals("edit") == true) {
			model.addAttribute("is", "edit");
		} else if (type.equals("show") == true) {
			model.addAttribute("is", "show");
		}
	}
	
	/**
	 * JSON字符串转为JSON对象
	 * @param json
	 */
	public JSONObject toJsonObject(String json) {
		json = json.replaceAll("&quot;", "\""); // 把&quot转换为\
		JSONObject jsonObject = JSONObject.fromObject(json);// 转json
		return jsonObject;
	}
	
	/**
	 * 获取业务层全部对象集合
	 * @return
	 */
	public List<T> getAllList () {
		return entityService.getAllList();
	}
	
	/**
	 * 传递主键数组获取持久化对象集合
	 * @param ids
	 * @return
	 */
	public List<T> getByBatchId(String[] ids) {
		return entityService.getByBatchId(excelUtil.getIdList(ids));
	}
	
	// 获取格式化时间
	public String getNowTime() {
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}
	
	// 返回result
	public Result getResult(Result result, int code, String msg) {
		result.setCode(code); 
		result.setMsg(msg);
		return result;
	}
	
	/**
	 * 添加/修改方法
	 * @param entity	持久层对象
	 * @param tableName 表名
	 * @return
	 */
	public Result save(T entity, String tableName) {
		if (entity.getId() != null && entity.getId().length() > 0) {
			if (update(entity)) {  getResult(result,2,"修改成功");
			} else { getResult(result,-2, "修改失败" ); }
		} else {
			if ( insert(entity, tableName)) { getResult(result,1,"新增成功"); 
			} else { getResult(result,-1,"新增失败"); }
		}
		return result;
	}
	
	/**
	 * 添加/修改方法-服务方法
	 * @param entity		持久层对象
	 * @param tableName		表名
	 * @return
	 */
	public Result saveService(T entity, String tableName) {
		if (entity.getId() != null && entity.getId().length() > 0) {
			if (update(entity)) {  getResult(result,2,"修改成功");
			} else { getResult(result,-2, "修改失败" ); }
		} else {
			if ( insertService(entity, tableName)) { getResult(result,1,"新增成功"); 
			} else { getResult(result,-1,"新增失败"); }
		}
		return result;
	}
	
	/**
	 * 添加/修改方法-服务方法
	 * @param entity		持久层对象
	 * @param tableName		表名
	 * @return
	 */
	public Result saveServiceTree(T entity, String tableName) {
		if (entity.getId() != null && entity.getId().length() > 0) {
			if (update(entity)) {  getResult(result,2,"修改成功");
			} else { getResult(result,-2, "修改失败" ); }
		} else {
			if ( insertServiceTree(entity, tableName)) { getResult(result,1,"新增成功"); 
			} else { getResult(result,-1,"新增失败"); }
		}
		return result;
	}
	
	// 格式化导出对象
	public void getExcel(T entity) {}
	
	/**
	 * 判断传递的主键数组是否有值，有值为批量导出/无值则默认全部导出
	 * 
	 * @param ids			主键数组集合
	 * @param title			EXCEL标题
	 * @param colum			EXCEL值列名
	 * @param fileName		EXCEL文件名
	 * @param excelName		EXCEL标题名称
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void export(String[] ids,String[] title,String[] colum,String fileName,String excelName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (ids == null) {
			List<T> list = getAllList();						// 全部持久化信息
			for (T entity : list ) { getExcel(entity); }	
			ex.export(request, response, title, colum, list, fileName, excelName);	
		} else {
			List<T> list = getByBatchId(ids);					// 批量持久化信息
			for (T entity : list ) { getExcel(entity); }	
			ex.export(request, response, title, colum, list, fileName, excelName);	
		}
	}
	
	/**
	 * 通用表格修改方法
	 * @param entity	持久层对象
	 * @return
	 */
	public Result tableEdit(T entity) {
		if (update(entity)) {  getResult(result,1,"修改成功"); 
		} else {  getResult(result,-1,"修改失败"); }
		return result;
	}
	
	/**
	 * 跳转复制新增页面传递持久层对象信息
	 * @param id			主键
	 * @param entityName	持久层名称
	 * @param model
	 */
	public void copyServiceModel(String id, String entityName, Model model ) {
		if (id != null && !"".equals(id)) { // 传递设置最大值排序号的计量单位对象
			T entity = entityService.get(id);
			entity.setId(null);
			model.addAttribute(entityName, entity); 
		}
	}
	
	/**
	 * MultipartFile转File 20190604加入
	 * @param file
	 * @return
	 */
	public File multipartFileToFile(MultipartFile file) {
        File f = null;
        try {
            InputStream is = file.getInputStream();
            f = new File(file.getOriginalFilename());
            OutputStream os = new FileOutputStream(f);

            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return f;
    }
	
	/**
     * 实现java 中 list集合中有几十万条数据,每100条为一组取出
     * @param list 可穿入几十万条数据的List
     * @return map 每一Kye中有100条数据的List
     */
	public Map<String, List<T>> groupList(List<T> list) {
		int listSize = list.size();
		int toIndex = 100;
		Map<String, List<T>> map = new HashMap<String, List<T>>(); // 用map存起来新的分组后数据
		int keyToken = 0;
		for (int i = 0; i < list.size(); i += 100) {
			if (i + 100 > listSize) { // 作用为toIndex最后没有100条数据则剩余几条newList中就装几条
				toIndex = listSize - i;
			}
			List<T> newList = list.subList(i, i + toIndex);
			map.put("keyName" + keyToken, newList);
			keyToken++;
		}
		return map;
	}
	
	/**
	 * 跳转复制新增页面传递持久层对象信息
	 * @param id			主键
	 * @param entityName	持久层名称
	 * @param entity		持久层对象
	 * @param model			
	 */
	public void copyModel(String id, String entityName, T entity, Model model ) {
		if (id != null && !"".equals(id)) { // 传递设置最大值排序号的计量单位对象
			model.addAttribute(entityName, copyEntity(id, entity.getTableName()));	
		}
	}
	
	/**
	 * 连续新增返回对象
	 * @param id			主键
	 * @param tableName		表名
	 * @return
	 */
	public T copyEntity(String id, String tableName) {
		T cEntity = entityService.get(id);
		cEntity.setId(null);
		cEntity.setOrderNo(baseGroupTableService.getMaxOrderNo(tableName));	// 传递最大值排序号+1
		return cEntity;
	}
	
	/**
	 * 传递文件和表名获取集总行数，总列数，标题内容信息 - HSSF
	 * 
	 * @param file			文件
	 * @param tableName		表名
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public Map<String, Object> getHSSFExcel(File file, String tableName) {
		Map<String, Object> map = new HashMap<String,Object>();
		
		try {
			HSSFWorkbook work = new HSSFWorkbook(new FileInputStream(file));							// 表格信息
			HSSFSheet sheet = work.getSheetAt(0); 														// 得到第一个sheet
			int rowNo = sheet.getLastRowNum(); 															// 总行数
			int coloumNum=sheet.getRow(0).getPhysicalNumberOfCells();									// 总列数
			List<String> headTitle = getExcelHeadTitle(AESUtil.AESDncode("pulsation", tableName));		// 获取标题内容
			
			map.put("work", work);				// work
			map.put("sheet", sheet);			// sheet
			map.put("rowNo", rowNo);			// 总行数
			map.put("colNo", coloumNum);		// 总列数
			map.put("headTitle", headTitle);	// 标题内容
			return map;
		} catch (FileNotFoundException e) {
			logger.debug("找不到文件...");
			logger.debug(e.toString());
		} catch (IOException e) {
			logger.debug("IO流异常");
			logger.debug(e.toString());
		}
		return map;
	}
	
	/**
	 * 传递表名获取映射关系头部表头信息
	 * @param tableName
	 * @return
	 */
	public List<String> getExcelHeadTitle(String tableName) {
		
		List<WisDataFieldMapping> sSysmgrDataFieldMappingList = wisDataFieldMappingService.findExcelList(tableName); 	// 解析表名
		
		// 获取标题内容
		List<String> headTitle = new ArrayList<String>();
		
		Map<String,String> excelMap = new HashMap<String, String>();
		
		for (int i = 0; i < sSysmgrDataFieldMappingList.size(); i++) {
			excelMap.put(sSysmgrDataFieldMappingList.get(i).getExcelColumnNo(), sSysmgrDataFieldMappingList.get(i).getFieldName());
		}

		for (int i = 1; i <= excelMap.size(); i++) {
			headTitle.add(excelMap.get(i+""));
		}
		
		return headTitle;
	}
	
	/**
	 * 通用HSSF反射机制，将信息设置给实体对象
	 * @param colNo			总列数
	 * @param headList		标题内容
	 * @param row			行信息
	 * @param entity		实体对象
	 */
	@SuppressWarnings("rawtypes")
	public void HSSFTmpReflect(int colNo, List<String> headList, HSSFRow row, T entity) {
		for (int j = 0; j < colNo; j++) {
			String target = headList.get(j);
			
			if(row.getCell(j)!=null){
				
				for (int k = 0; k < headList.size(); k++) {
					if (headList.get(k).equals(headList.get(j))) {
						target = target.toLowerCase().replaceAll("_", "");
						
						Class appInsenterCls = (Class) entity.getClass();
						Field[] fs = appInsenterCls.getDeclaredFields();
						for (int l = 0; l < fs.length; l++) {
							Field f = fs[l];
							f.setAccessible(true); //设置些属性是可以访问的
							
							if (f.getName().toLowerCase().equals(target)) {
				        	   try {
				        		   f.set(entity, row.getCell(j) + "");
				        	   } catch (IllegalArgumentException e) {
				        		   logger.debug("非法数据异常...");
				        		   logger.debug(e.toString());
				        	   } catch (IllegalAccessException e) {
				        		   logger.debug("访问权限异常...");
				        		   logger.debug(e.toString());
				        	   }
							}
						}
					}
				}
			}
		}
	}
	
	/**
	 * 传递文件和表名获取集总行数，总列数，标题内容信息 - XSSF
	 * 
	 * @param file			文件
	 * @param tableName		表名
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public Map<String, Object> getXSSFExcel(File file, String tableName) {
		Map<String, Object> map = new HashMap<String,Object>();
		
		try {
			XSSFWorkbook work = new XSSFWorkbook(new FileInputStream(file));							// 表格信息
			XSSFSheet sheet = work.getSheetAt(0); 														// 得到第一个sheet
			int rowNo = sheet.getLastRowNum(); 															// 总行数
			int coloumNum=sheet.getRow(0).getPhysicalNumberOfCells();									// 总列数
			List<String> headTitle = getExcelHeadTitle(AESUtil.AESDncode("pulsation", tableName));		// 获取标题内容
			
			map.put("work", work);				// work
			map.put("sheet", sheet);			// sheet
			map.put("rowNo", rowNo);			// 总行数
			map.put("colNo", coloumNum);		// 总列数
			map.put("headTitle", headTitle);	// 标题内容
			return map;
		} catch (FileNotFoundException e) {
			logger.debug("找不到文件...");
			logger.debug(e.toString());
		} catch (IOException e) {
			logger.debug("IO流异常");
			logger.debug(e.toString());
		}
		return map;
	}
	
	/**
	 * 通用XSSF反射机制，将信息设置给实体对象
	 * @param colNo			总列数
	 * @param headList		标题内容
	 * @param row			行信息
	 * @param entity		实体对象
	 */
	@SuppressWarnings("rawtypes")
	public void XSSFTmpReflect(int colNo, List<String> headList, XSSFRow row, T entity) {
		for (int j = 0; j < colNo; j++) {
			String target = headList.get(j);
			
			if(row.getCell(j)!=null){
				
				for (int k = 0; k < headList.size(); k++) {
					if (headList.get(k).equals(headList.get(j))) {
						target = target.toLowerCase();
						
						Class appInsenterCls = (Class) entity.getClass();
						Field[] fs = appInsenterCls.getDeclaredFields();
						for (int l = 0; l < fs.length; l++) {
							Field f = fs[l];
							f.setAccessible(true); //设置些属性是可以访问的
							if (f.getName().toLowerCase().equals(target)) {
				        	   try {
				        		   f.set(entity, row.getCell(j) + "");
				        	   } catch (IllegalArgumentException e) {
				        		   logger.debug("非法数据异常...");
				        		   logger.debug(e.toString());
				        	   } catch (IllegalAccessException e) {
				        		   logger.debug("访问权限异常...");
				        		   logger.debug(e.toString());
				        	   }
							}
						}
					}
				}
			}
		}
	}
	
	/**
	 * 通用获取EXCEL-Map信息
	 * @param keyName		主键名称-区分主键设置
	 * @return
	 */
	public Map<String, T> getExcelMap(String keyName) {
		Map<String, T> map = new HashMap<String, T>();			// 定义主体Map
		List<T> list = entityService.getAllList();	// EXCEL信息
		
		// 设置Map集合
		if (list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				if ("name".equals(keyName)) {
					map.put(list.get(i).getName(), list.get(i));
				}
				if ("appName".equals(keyName)) {
					map.put(list.get(i).getAppName(), list.get(i));
				}
			}
		}
		
		return map;
	}
	
	/**
	 * 检查文件长度是否正确
	 * 
	 * @param suffix	后缀名
	 * @param sSysmgrDataImportTab	导入映射表信息
	 * @param excelFile	excel文件
	 * @return
	 */
	public boolean checkExcelLength(String suffix, WisDataImportTab entity, File excelFile) {
		if ("xls".equals(suffix)) {
			try {
				HSSFWorkbook work = new HSSFWorkbook(new FileInputStream(excelFile));
				HSSFSheet sheet = work.getSheetAt(0); //得到第一个sheet-标题内容
				int coloumNum = sheet.getRow(0).getPhysicalNumberOfCells(); // 总列数
				
				String headerUrl = entity.getExcelHeader();
				JSONArray jsonArr = JSONArray.fromObject(headerUrl); // 首先把字符串转成 JSONArray  对象
				int jsonArrLength = jsonArr.size();
				
				if (coloumNum >= jsonArrLength) {
					return true;
				}
				
			} catch (FileNotFoundException e) {
				logger.debug("找不到文件异常......");
				logger.debug(e.toString());
			} catch (IOException e) {
				logger.debug("IO流异常......");
				logger.debug(e.toString());
			}
			
		} else if ("xlsx".equals(suffix)) {
			try {
				XSSFWorkbook work = new XSSFWorkbook(new FileInputStream(excelFile));
				XSSFSheet sheet = work.getSheetAt(0); //得到第一个sheet-标题内容
				int coloumNum = sheet.getRow(0).getPhysicalNumberOfCells(); // 总列数
				
				String headerUrl = entity.getExcelHeader();
				JSONArray jsonArr = JSONArray.fromObject(headerUrl); // 首先把字符串转成 JSONArray  对象
				int jsonArrLength = jsonArr.size();
				
				logger.debug("coloumNum:"+coloumNum);
				logger.debug("jsonArrLength:"+jsonArrLength);
				
				if (coloumNum >= jsonArrLength) {
					return true;
				}
				
			} catch (FileNotFoundException e) {
				logger.debug("找不到文件异常......");
				logger.debug(e.toString());
			} catch (IOException e) {
				logger.debug("IO流异常......");
				logger.debug(e.toString());
			}
		}
		
		return false;
	}
	
	/**
	 * 移除已存在的信息
	 * @param keyName	键值
	 * @param list		对象集合
	 * @param map		对象map
	 * @return
	 */
	public List<T> getExcelList(String keyName, List<T> list, Map<String, T> map) {
		
		// 移除已存在的信息
		if ("name".equals(keyName)) {
			for (int i = list.size()-1; i > -1; i--) { 
				if (map.containsKey(list.get(i).getName())) { 
					list.remove(list.get(i)); 
				}
			}
		}
		
		// 移除已存在的信息
		if ("appName".equals(keyName)) {
			for (int i = list.size()-1; i > -1; i--) { 
				if (map.containsKey(list.get(i).getAppName())) { 
					list.remove(list.get(i)); 
				}
			}
		}
		
		return list;
	}
	
	/**
	 * excel循环新增
	 * @param excelList 新增对象集合
	 * @return
	 */
	public int excelInsert(List<T> excelList) {
		Map<String, List<T>> listMap = groupList(excelList);
		int count = 0;
		
		Collection<List<T>> collection = listMap.values(); //通过values方法得到包含所有值Collection视图
		Iterator<List<T>> it = collection.iterator();	
		while(it.hasNext())
		{
			List<T> clist = null;
			int insertCount = 0;
			
			clist = it.next();
			insertCount = entityService.insertLead(clist);
			count = count + insertCount;
		}
		
		return count;
	}
	
	
	/**
	 * 标准校验加新增修改通用方法结果集
	 * @param entity	提交对象
	 * @param tab		校验对象
	 * @param tableName	表名
	 * @return
	 */
	public Result resSaveTmp(T entity, T tab, String tableName) {
		String code = tab.getCheckCodeFlag();
		String name = tab.getCheckNameFlag();
		String orderNo = tab.getCheckOrderNoFlag();
		String content = tab.getCheckContentFlag();
		String title = tab.getCheckTitleFlag();
		String flag = tab.getCheckFlag();
		
		if ("1".equals(code)) {
			result.setCode(40003);
			result.setMsg("当前编码已存在");
		} else if ("1".equals(name)) {
			result.setCode(40004);
			result.setMsg("当前名称已存在");
		} else if ("1".equals(orderNo)) {
			result.setCode(40005);
			result.setMsg("当前排序号已存在");
		} else if ("1".equals(content)) {
			result.setCode(40006);
			result.setMsg("当前内容已存在");
		} else if ("1".equals(title)) {
			result.setCode(40007);
			result.setMsg("当前标题已存在");
		} else if ("1".equals(flag)) {
			result.setCode(40008);
			result.setMsg("当前信息已存在");
		} else {
			saveTmp(entity, tableName);
		}
		
		return result;
	}
	
	/**
	 * 添加/修改方法
	 * @param entity	持久层对象
	 * @param tableName 表名
	 * @return
	 */
	public Result saveTmp(T entity, String tableName) {
		if (entity.getId() != null && entity.getId().length() > 0) {
			if (update(entity)) {  getResult(result,10002,"修改成功");
			} else { getResult(result,40002, "修改失败" ); }
		} else {
			if ( insert(entity, tableName)) { getResult(result,10001,"新增成功"); 
			} else { getResult(result,40001,"新增失败"); }
		}
		return result;
	}
	
}

