package com.thinkgem.jeesite.api.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


/**
 * excel 导出工具类（样式设置）
 * @author Administrator
 *
 */
//@SuppressWarnings("deprecation")
public class ExcelUtil {

    /**
     * 导出Excel
     * @param sheetName sheet名称
     * @param title 标题
     * @param values 内容
     * @param wb HSSFWorkbook对象
     * @return
     */
    public static HSSFWorkbook getHSSFWorkbook(String sheetTitleName,String sheetName,String[] title,String [][]values, HSSFWorkbook wb){

        // 第一步：创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }
        // 第二步：在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步：设置EXCEL基本样式
        // 3.1 创建标题样式
//        HSSFCellStyle headerStyle = (HSSFCellStyle) wb.createCellStyle();
//        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中        
//        headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直对齐居中        
//        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);//下边框        
//        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框        
//        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框        
//        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
//        HSSFFont header_Font = (HSSFFont) wb.createFont(); //创建标题字体样式
//        header_Font.setFontName("微软雅黑");//字体型号
//        header_Font.setFontHeightInPoints((short) 15);//字体大小
//        headerStyle.setFont(header_Font); //设置标题字体样式
        
        // 3.2 创建单元表头样式       
        HSSFCellStyle cell_Style = (HSSFCellStyle) wb.createCellStyle();
        cell_Style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cell_Style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直对齐居中        
        cell_Style.setBorderBottom(HSSFCellStyle.BORDER_THIN);//下边框        
        cell_Style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框        
        cell_Style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框        
        cell_Style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框        
        cell_Style.setWrapText(true); // 设置为自动换行        
        HSSFFont cell_Font = (HSSFFont) wb.createFont(); //创建单元格字体样式
        cell_Font.setFontName("微软雅黑");//字体型号
        cell_Font.setFontHeightInPoints((short) 12);//字体大小
        cell_Style.setFont(cell_Font);//设置标题字体样式
        
        // 3.3 创建单元格样式
        HSSFCellStyle cell_value_Style = (HSSFCellStyle) wb.createCellStyle();
        cell_value_Style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cell_value_Style.setVerticalAlignment(HSSFCellStyle.ALIGN_LEFT);// 垂直居左对齐        
        cell_value_Style.setBorderBottom(HSSFCellStyle.BORDER_THIN);//下边框        
        cell_value_Style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框        
        cell_value_Style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框        
        cell_value_Style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框        
        HSSFFont cell_value_Font = (HSSFFont) wb.createFont();//创建单元格字体样式
        cell_value_Font.setFontName("微软雅黑");//字体型号
        cell_value_Font.setFontHeightInPoints((short) 10);//字体大小
        cell_value_Style.setFont(cell_value_Font);//设置标题字体样式
        
        //第四步：创建excel单元格信息
        //4.1 创建合并单元格对象
        //4.1.1 头部 标题信息
//        CellRangeAddress callRangeAddress = new CellRangeAddress(0,0,0,title.length-1);//起始行,结束行,起始列,结束列
        
        //4.2 创建头标题行;并且设置头标题
//        HSSFRow row = sheet.createRow(0);
//        HSSFCell cell = row.createCell(0);
        //4.2.1 加载单元格样式
//        cell.setCellStyle(headerStyle);
//        cell.setCellValue(sheetTitleName);
//        sheet.addMergedRegion(callRangeAddress);
        
        //4.3 创建第二行
        HSSFRow row1 = sheet.createRow(0);
        //4.3.1 声明列对象
        HSSFCell cell_1 = null;
        
        //4.3.2 创建标题对象
        for(int i=0;i<title.length;i++){
        	cell_1 = row1.createCell(i);
        	int titleLength = title[i].length();
        	if(titleLength<3) { // 4.3.2.1 根据标题的长度设置宽度和样式
        		sheet.setColumnWidth(i, 3500); 
        		cell_1.setCellValue(title[i]);
            	cell_1.setCellStyle(cell_Style);
        	} else {
        		sheet.setColumnWidth(i, 7000);
        		cell_1.setCellValue(title[i]);
            	cell_1.setCellStyle(cell_Style);
        	}
        }
        
        //4.3.3 创建内容
        for(int i=0;i<values.length;i++){
            row1 = sheet.createRow(i + 1);

            for(int j=0;j<values[i].length;j++){
            	HSSFCell cell1 = row1.createCell(j);//4.3.3.1 将内容按顺序赋给对应的列对象
            	
            	cell1.setCellStyle(cell_value_Style);
            	cell1.setCellValue(values[i][j]);
            }
        }
        return wb;
    }

    /**
     * 数据格式化 - 认证
     * 根据传递来的审核信息 返回格式化后的审核信息
     * @param audit 审核状态
     * @updatgeData	2019-07-11
     * @author 周永 
     * @return	1-认证中 0-认证失败 2-认证通过
     */
    public String getIsAuths(String auth) {
    	if(auth.equals("1")) {
    		auth = "认证中";
    		return auth;
		} else if (auth.equals("0")) {
			auth = "认证失败";
			return auth;
		} else if (auth.equals("2")) {
			auth = "认证成功";
			return auth;
		} else {
			auth = "";
			return auth;
		}
    }
    
    /**
     * 数据格式化 - 审核
     * 根据传递来的审核信息 返回格式化后的审核信息
     * @param audit 审核状态
     * @return	1-发布中 0-未审核 2-审核通过
     */
    public String getAuditStatus(String audit) {
    	if(audit.equals("1")) {
    		audit = "发布中";
    		return audit;
		} else if (audit.equals("0")) {
			audit = "未审核";
			return audit;
		} else if (audit.equals("2")) {
			audit = "审核通过";
			return audit;
		} else {
			audit = "";
			return audit;
		}
    }
    
    /**
     * 数据格式化 - 带锤经验
     * 根据传递来的带锤经验 返回格式化后的带锤经验信息
     * @param daiChui 带锤经验
     * @return 1-带过锤 0-没带过锤
     */
    public String getDaiChui(String daiChui) {
    	if(daiChui.equals("1")) {
    		daiChui = "带过锤";
    		return daiChui;
		} else if (daiChui.equals("0")) {
			daiChui = "没带过锤";
			return daiChui;
		} else {
			daiChui = "";
			return daiChui;
		}
    }
    
    /**
     * 数据格式化 - 证件要求
     * 根据传递来的证件要求 返回格式化后的证件要求信息
     * @param cert 证件要求
     * @return 1-有 0-无
     */
    public String getCert(String cert) {
    	if(cert.equals("1")) {
    		cert = "有";
    		return cert;
		} else if (cert.equals("0")) {
			cert = "无";
			return cert;
		} else {
			cert = "";
			return cert;
		}
    }
    
    /**
     * 数据格式化 - 工作类型
     * 根据传递来的工作类型 返回格式化后的工作类型
     * @param jobType 工作类型
     * @return 1-台班 2-长期
     */
    public String getJobType(String jobType) {
    	if(jobType.equals("1")) {
			jobType = "台班";
			return jobType;
		} else if (jobType.equals("2")) {
			jobType = "长期";
			return jobType;
		} else {
			jobType = "";
			return jobType;
		}
    }
    
    /**
     * 数据格式化 - 求职状态
     * 根据传递来的求职状态 返回格式化后的求职状态
     * @param jobStatu 求职状态
     * @return 1-求职中 2-在职中
     */
    public String getJobStatu(String jobStatu) {
    	if(jobStatu.equals("1")) {
			jobStatu = "求职中";
			return jobStatu;
		} else if (jobStatu.equals("0")) {
			jobStatu = "在职中";
			return jobStatu;
		} else {
			jobStatu = "";
			return jobStatu;
		}
    }
    
    /**
     * 数据格式化 - 管理设备
     * 根据传递来的管理设备 返回格式化后的管理设备
     * @param isManageDevice 管理设备
     * @return 1-能管理 0-不能管理
     */
    public String getIsManageDevice(String isManageDevice) {
    	if(isManageDevice.equals("1")) {
			isManageDevice = "能管理";
			return isManageDevice;
		} else if (isManageDevice.equals("0")) {
			isManageDevice = "不能管理";
			return isManageDevice;
		} else {
			isManageDevice = "";
			return isManageDevice;
		}
    }
    
    /**
     * 数据格式化 - 管理工地
     * 根据传递来的管理工地 返回格式化后的管理工地
     * @param isManageProject 管理工地
     * @return 1-能管理 0-不能管理
     */
    public String getIsManageProject(String isManageProject) {
    	if(isManageProject.equals("1")) {
			isManageProject = "能管理";
			return isManageProject;
		} else if (isManageProject.equals("0")) {
			isManageProject = "不能管理";
			return isManageProject;
		} else {
			isManageProject = "";
			return isManageProject;
		}
    }
    
    /**
     * 数据格式化 - 驾驶路面
     * 根据传递来的管理工地 返回格式化后的管理工地
     * @param isDriveGround 驾驶路面
     * @return 1-能驾驶 0-不能驾驶
     */
    public String getIsDriveGround(String isDriveGround) {
    	if(isDriveGround.equals("1")) {
			isDriveGround = "能驾驶";
			return isDriveGround;
		} else if (isDriveGround.equals("0")) {
			isDriveGround = "不能驾驶";
			return isDriveGround;
		} else {
			isDriveGround = "";
			return isDriveGround;
		}
    }
    
    /**
     * 数据格式化 - 数据来源
     * 根据传递来的数据来源  返回格式化后的数据来源
     * @param dataSource 数据来源
     * @return 1-公众号端 2-android端 3-ios端 4-PC前端 5-PC后台
     */
    public String getDataSource(String dataSource) {
    	if(dataSource.equals("1")) {
			dataSource = "公众号端";
			return dataSource;
		} else if (dataSource.equals("2")) {
			dataSource = "android端";
			return dataSource;
		} else if (dataSource.equals("3")) {
			dataSource = "ios端";
			return dataSource;
		} else if (dataSource.equals("4")) {
			dataSource = "PC前端";
			return dataSource;
		} else if (dataSource.equals("5")) {
			dataSource = "PC后台";
			return dataSource;
		} else {
			dataSource = "";
			return dataSource;
		}
    }
    
    /**
     * 数据格式化 - 启用状态
     * 根据传递来的启用状态  返回格式化后的启用状态
     * @param isEnable 启用状态
     * @return 1-启用 0-未启用
     */
    public String getIsEnable(String isEnable) {
    	if(isEnable.equals("1")) {
			isEnable = "启用";
			return isEnable;
		} else if (isEnable.equals("0")) {
			isEnable = "未启用";
			return isEnable;
		} else {
			isEnable = "";
			return isEnable;
		}
    }
    
    /**
     * 数据格式化 - 属性类别
     * 根据传递来的属性类别  返回格式化后的属性类别
     * @param isEnable 属性类别
     * @return 1-销售属性 2-展示属性
     */
    public String getAttrType(String attrType) {
    	if(attrType.equals("1")) {
    		attrType = "销售属性";
			return attrType;
		} else if (attrType.equals("2")) {
			attrType = "展示属性";
			return attrType;
		} else {
			attrType = "";
			return attrType;
		}
    }
    
    /**
     * 数据格式化 - 是否必填
     * 根据传递来的是否必填  返回格式化后的是否必填
     * @param isEnable 是否必填
     * @return 0-否 1-是
     */
    public String getIsRequired(String isRequired) {
    	if(isRequired.equals("0")) {
    		isRequired = "否";
			return isRequired;
		} else if (isRequired.equals("1")) {
			isRequired = "是";
			return isRequired;
		} else {
			isRequired = "";
			return isRequired;
		}
    }
    
    /**
     * 数据格式化 - 是否显示
     * 根据传递来的是否显示  返回格式化后的是否显示
     * @param isEnable 是否显示
     * @return 0-否 1-是
     */
    public String getIsShow(String isShow) {
    	if(isShow.equals("0")) {
    		isShow = "否";
			return isShow;
		} else if (isShow.equals("1")) {
			isShow = "是";
			return isShow;
		} else {
			isShow = "";
			return isShow;
		}
    }
    
    /**
     * 数据格式化 - 是否搜索
     * 根据传递来的是否搜索  返回格式化后的是否搜索
     * @param isEnable 是否搜索
     * @return 0-否 1-是
     */
    public String getIsSearch(String isSearch) {
    	if(isSearch.equals("0")) {
    		isSearch = "否";
			return isSearch;
		} else if (isSearch.equals("1")) {
			isSearch = "是";
			return isSearch;
		} else {
			isSearch = "";
			return isSearch;
		}
    }
    
    /**
     * 数据格式化 - 是否为图片
     * 根据传递来的是否为图片  返回格式化后的是否为图片
     * @param isEnable 是否为图片
     * @return 0-否 1-是
     */
    public String getIsImages(String isImages) {
    	if(isImages.equals("0")) {
    		isImages = "否";
			return isImages;
		} else if (isImages.equals("1")) {
			isImages = "是";
			return isImages;
		} else {
			isImages = "";
			return isImages;
		}
    }
    
    /**
     * 数据格式化 - 是否使用图片
     * 根据传递来的是否使用图片  返回格式化后的是否使用图片
     * @param isEnable 是否使用图片
     * @return 0-否 1-是
     */
    public String getIsUseDefaultIamge(String isUseDefaultIamge) {
    	if(isUseDefaultIamge.equals("0")) {
    		isUseDefaultIamge = "不使用";
			return isUseDefaultIamge;
		} else if (isUseDefaultIamge.equals("1")) {
			isUseDefaultIamge = "使用";
			return isUseDefaultIamge;
		} else {
			isUseDefaultIamge = "";
			return isUseDefaultIamge;
		}
    }
    
    /**
     * 数据格式化 - 表单类别
     * 根据传递来的表单类别  返回格式化后的表单类别
     * @param isEnable 表单类别
     * @return 1-单选 2-多选 3-自定义
     */
    public String getFormType(String formType) {
    	if(formType.equals("1")) {
    		formType = "单选";
			return formType;
		} else if (formType.equals("2")) {
			formType = "多选";
			return formType;
		} else if (formType.equals("3")) {
			formType = "自定义";
			return formType;
		} else {
			formType = "";
			return formType;
		}
    }
    
    /**
     * 数据格式化 - 性别要求
     * 根据传递来的性别要求  返回格式化后的性别要求
     * @param sex 性别要求
     * @return 1-男 0-女 2-不限
     */
    public String getSex(String sex) {
    	if(sex.equals("1")) {
			sex = "男";
			return sex;
		} else if (sex.equals("0")) {
			sex = "女";
			return sex;
		} else if (sex.equals("2")) {
			sex = "不限";
			return sex;
		} else {
			sex = "";
			return sex;
		}
    }
    
    /**
     * 数据格式化 - 认证状态
     * 根据传递来的认证状态  返回格式化后的认证状态
     * @param authStatu 认证状态
     * @return 1-发布中 0-未认证 2-认证通过
     */
    public String getAuthStatu(String authStatu) {
    	if(authStatu.equals("1")) {
    		authStatu = "发布中";
    		return authStatu;
		} else if (authStatu.equals("0")) {
			authStatu = "未认证";
			return authStatu;
		} else if (authStatu.equals("2")) {
			authStatu = "认证通过";
			return authStatu;
		} else {
			authStatu = "";
			return authStatu;
		}
    }
    
    /**
     * 数据格式化 - 维修范围
     * 根据传递来的维修范围  返回格式化后的维修范围
     * @param maintainRange 维修范围
     * @return 1-接受外地区域 0-不接受外地区域
     */
    public String getMaintainRange(String maintainRange) {
    	if(maintainRange.equals("1")) {
			maintainRange = "接受外地区域";
			return maintainRange;
		} else if (maintainRange.equals("0")) {
			maintainRange = "不接受外地区域";
			return maintainRange;
		} else {
			maintainRange = "";
			return maintainRange;
		}
    }
    
    /**
     * 数据格式化 - 自带要求
     * 根据传递来的自带要求  返回格式化后的自带要求
     * @param maintainRange 自带要求
     * @return 1-带 0-不带
     */
    public String getIsZidai(String isZidai){
    	if(isZidai.equals("1")) {
			isZidai = "带";
			return isZidai;
		} else if (isZidai.equals("0")) {
			isZidai = "不带";
			return isZidai;
		} else {
			isZidai = "";
			return isZidai;
		}
    }
    
    /**
     * 数据格式化 - 是否置顶
     * 根据传递来的是否置顶  返回格式化后的是否置顶
     * @param maintainRange 是否置顶
     * @return 1-是 0-否
     */
    public String getIsTop(String isTop){
    	if(isTop.equals("1")) {
    		isTop = "是";
			return isTop;
		} else if (isTop.equals("0")) {
			isTop = "否";
			return isTop;
		} else {
			isTop = "";
			return isTop;
		}
    }
    
    /**
     * 数据格式化 - 是否头条
     * 根据传递来的是否头条  返回格式化后的是否头条
     * @param maintainRange 是否头条
     * @return 1-是 0-否
     */
    public String getIsHead(String isHead){
    	if(isHead.equals("1")) {
    		isHead = "是";
			return isHead;
		} else if (isHead.equals("0")) {
			isHead = "否";
			return isHead;
		} else {
			isHead = "";
			return isHead;
		}
    }
    
    /**
     * 数据格式化 - 出租方式
     * 根据传递来的出租方式  返回格式化后的出租方式
     * @param leaseMode 出租方式
     * @return 1-包月 2-台班 3-装车
     */
    public String getLeaseMode(String leaseMode){
    	if(leaseMode.equals("1")) {
    		leaseMode = "包月";
			return leaseMode;
		} else if (leaseMode.equals("2")) {
			leaseMode = "台班";
			return leaseMode;
		} else if (leaseMode.equals("3")) {
			leaseMode = "装车";
			return leaseMode;
		} else {
			leaseMode = "";
			return leaseMode;
		}
    }
    
    /**
     * 数据格式化 - 是否包含机手
     * 根据传递来的是否包含机手  返回格式化后的是否包含机手
     * @param maintainRange 是否包含机手
     * @return 1-包含机手 0-不包含机手
     */
    public String getIsContainOperator(String isContainOperator){
    	if(isContainOperator.equals("1")) {
    		isContainOperator = "包含机手";
			return isContainOperator;
		} else if (isContainOperator.equals("2")) {
			isContainOperator = "不包含机手";
			return isContainOperator;
		} else {
			isContainOperator = "";
			return isContainOperator;
		}
    }
    
    /**
     * 根据传递前端传递的ID数组
     * @param ids 传递的ID数组
     * @return ID集合
     */
    public List<String> getIdList(String[] ids){
    	List<String> idList = new ArrayList<String>();
		for (int i = 0; i < ids.length; i++) {
			idList.add(ids[i]);
		}
		return idList;
    }
	
	/**
     * 根据传递的行数、总列数获取标题内容
     */
	public static List<String> getHeadTitle(HSSFSheet sheet,int coloumNum) {
		List<String> headingCategory  = new ArrayList<>();
		HSSFRow title = sheet.getRow(0);
		for (int i = 0; i < coloumNum; i++) {
			HSSFCell cell = title.getCell(i);
			headingCategory.add(cell+"");
		}
		return headingCategory;
	}
	
	
	public static void main(String[] args) {
		String a = "5.0";
		String[] arr = a.split("\\.");
		a = arr[0];
		System.out.println(a);
	}

    
}