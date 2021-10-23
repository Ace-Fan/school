package com.thinkgem.jeesite.api.util;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * 导出Excel
 * 
 * @author Derek
 *
 * @param <T>
 */
public class ExcelImport<T> {

	/**
	 * 导出excel 文件
	 * 
	 * @param request
	 *            请求
	 * @param response
	 * @param title
	 *            标题
	 * @param cloums
	 *            列名
	 * @param content
	 *            内容
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "deprecation" })
	public void export(HttpServletRequest request, HttpServletResponse response, String[] title, String[] cloums,
			Collection<T> content, String fileName, String excelName) throws Exception {

		// 页签名
		String sheetName = fileName;

		// 标题名
		String sheetTitleName = excelName;

		// 内容
		String[][] contents = new String[content.size()][];

		// 便利对象
		Iterator<T> it = content.iterator();
		String filedName; // 实体列名
		Field[] fields; // 列的集合
		Field field; // 单个的列
		Method md; // 方法
		Class tCls; // 类
		T t; // 泛型
		int i = 0; // i++
		while (it.hasNext()) {
			t = (T) it.next();
			fields = t.getClass().getDeclaredFields(); // 获取class里面所有列的集合
			contents[i] = new String[title.length]; // 给内容定义长度
			for (int j = 0; j < title.length; j++) {
				// field = fields[i]; // 获得单个的列
				// filedName = field.getName(); // 获得列名

				// 获得列get和set名称
				String getMethodName = "get" + cloums[j];// "get" + filedName.substring(0,
															// 1).toUpperCase()+filedName.substring(1);

				tCls = t.getClass(); // 把泛型转成class对象
				md = tCls.getMethod(getMethodName, new Class[] {}); // 获得get方法
				Object cl = md.invoke(t, new Object[] {}); // 获得get方法的值
				if (null != cl) {
					if (getMethodName.contains("Date")) {
						Date ds = new Date(cl.toString());
						SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						cl = sd.format(ds);
					}
					contents[i][j] = cl.toString(); // 将取出来的值放到内容数组里面
				} else {
					contents[i][j] = ""; // 如果获得的值是空则设置为字符串的空
				}
			}
			i++;
		}
		// 创建HSSFWorkbook
		HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetTitleName, sheetName, title, contents, null);
		// 响应到客户端
		try {
			this.setResponseHeader(response, fileName);
			OutputStream os = response.getOutputStream();
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 发送响应流方法
	public void setResponseHeader(HttpServletResponse response, String fileName) {
		try {
			try {
				fileName = new String(fileName.getBytes(), "ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/octet-stream;charset=ISO8859-1");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			response.addHeader("Pargam", "no-cache");
			response.addHeader("Cache-Control", "no-cache");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 导出excel 文件
	 * 
	 * @param request
	 *            请求
	 * @param response
	 * @param title
	 *            标题
	 * @param cloums
	 *            列名
	 * @param content
	 *            内容
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
//	public void exportModel(HttpServletRequest request, HttpServletResponse response, String[] title, String fileName,
//			String excelName) throws Exception {
//
//		// 页签名
//		String sheetName = fileName;
//
//		// 标题名
//		String sheetTitleName = excelName;
//
//		// 创建HSSFWorkbook
//		HSSFWorkbook wb = ExcelUtil.getHSSFWorkbookModel(sheetTitleName, sheetName, title, null);
//		// 响应到客户端
//		try {
//			this.setResponseHeader(response, fileName);
//			OutputStream os = response.getOutputStream();
//			wb.write(os);
//			os.flush();
//			os.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}
