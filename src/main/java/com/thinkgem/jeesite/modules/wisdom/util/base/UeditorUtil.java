package com.thinkgem.jeesite.modules.wisdom.util.base;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.thinkgem.jeesite.modules.base.util.FileUtil;
import com.thinkgem.jeesite.modules.base.util.GetOrgUtil;

/**
 * 富文本上传工具类
 * @author Administrator
 */
public class UeditorUtil {
	/**
	 * 根据 DOC 对象获取所有图片SRC属性
	 * @param doc
	 * @return
	 */
	public static List<String> getImgSrcList(Document doc) {
		// 获取所有img标签
		Elements imgList = doc.select("img");
		
		List<String> imgSrcList = new ArrayList<>();
		
		// 获取imgSrc集合
		for (Element imgHtml : imgList) {
			String imgSrc = imgHtml.attr("src");
			System.out.println("---------------------------");
			System.out.println(imgSrc);
			System.out.println(GetOrgUtil.getUrlValue("checkFilePath"));
			System.out.println("---------------------------");
			if (imgSrc.indexOf(GetOrgUtil.getUrlValue("checkFilePath")) == -1) {
				imgSrcList.add(imgSrc);
			}
		}
		
		return imgSrcList;
	}
	
	/**
	 * 传递HTML内容获取img需要替换的标签文本
	 * @param html
	 * @return
	 */
	public static List<String> getImgHtml(String html,List<String> md5List){
		Document doc = Jsoup.parse(html);
		
		Elements imgList = doc.select("img");
		
		List<String> imgHtmlList = new ArrayList<>();
		
		for (int i = 0; i < imgList.size(); i++) {
			imgList.get(i).attr("dispSrc", md5List.get(i));
		}
		
		for (Element imgHtml : imgList) {
			String imgHtmlInfo = imgHtml + "";
			imgHtmlList.add(imgHtmlInfo);
		}
		
		return imgHtmlList;
	}
	
	/**
	 * 传递HTML内容获取img原来标签文本
	 * @param html
	 * @return
	 */
	public static List<String> getAfterImgHtml(String html){
		Document doc = Jsoup.parse(html);
		
		Elements imgList = doc.select("img");
		
		List<String> imgHtmlList = new ArrayList<>();
		
		for (Element imgHtml : imgList) {
			String imgHtmlInfo = imgHtml + "";
			imgHtmlList.add(imgHtmlInfo);
		}
		
		return imgHtmlList;
	}
	
	/**
	 * 传递图片SRC属性集合、项目存放图片路径获取真实图片路径
	 * @param imgSrcList
	 * @param imgPath
	 * @return
	 */
	public static List<String> getTrueImgPathList(List<String> imgSrcList,String imgPath){
		List<String> imgPathList = new ArrayList<>(); 
		
		for (String imgSrc : imgSrcList) {
			String[] imgSrcArr = imgSrc.split("/");
			String imgPathInfo = imgPath;
			for (int i = 0; i < imgSrcArr.length; i++) {
				if (i != 1 && i != 0) {
					imgPathInfo = imgPathInfo + "/" + imgSrcArr[i];
				}
			}
			imgPathList.add(imgPathInfo);
		}
		System.out.println("imgPathList====================***************************"+imgPathList);
		return imgPathList;
	}
	
	/**
	 * 判断HTML失败包含上传文件路径，如果不包含返回false，包含返回true
	 * @param html
	 * @return
	 */
	public static boolean checkUpload(String html) {
		Document doc = Jsoup.parse(html);
		
		List<String> imgList = getImgSrcList(doc);
		
		boolean bool = true;
		
		for (int i = 0; i < imgList.size(); i++) {
			if(imgList.get(i).indexOf("/mechserp/ueditor/jsp/upload/image/") == -1) {
				bool = false;
				return bool;
			}
		}
		
		return bool;
	}
	
	/**
	 * 判断HTML失败包含上传文件路径，如果不包含返回false，包含返回true
	 * @param html
	 * @return
	 */
	public static boolean checkUploadInfo(String html,String projectPath) {
		Document doc = Jsoup.parse(html);
		
		List<String> imgList = getImgSrcList(doc);
		
		System.out.println("imgList:======================"+imgList);
		System.out.println("projectPath:=========================="+projectPath);
		
		boolean bool = true;
		
		for (int i = 0; i < imgList.size(); i++) {
			if(imgList.get(i).indexOf(projectPath) == -1) {
				bool = false;
				return bool;
			}
		}
		
		return bool;
	}
	
	/**
	 * 传递文本获取上传到文件服务器的图片返回
	 * @param html
	 * @param path
	 * @return
	 * @throws IOException 
	 */
	public static String getUploadFileRes(String html,String path) throws IOException {
		// 替换标签文本中表格部分
		html = html.replace("<table", "<table border='1' cellspacing='0' cellspadding='0' ");
		
		Document doc = Jsoup.parse(html);
		List<String> imgList = getImgSrcList(doc);			// 获取所有的img标签内容
		
		System.out.println("==========================================");
		System.out.println("imgList.size:"+imgList.size());
		System.out.println("==========================================");
		
		if (imgList.size()>0) {
			List<String> imgUpList = new ArrayList<String>();	// 定义需要修改的文本集合
			String pathHtml = "";
			
			for (int i = 0; i < imgList.size(); i++) {			// 上传文件服务器，获取返回结果集
				pathHtml = "";
				pathHtml = path + imgList.get(i);
				pathHtml = FileUtil.fileUpload(pathHtml);
				imgUpList.add(pathHtml);
			}
			
			for (int i = 0; i < imgList.size(); i++) {			// 替换处理文本
				html = html.replace("<img", "<img dispSrc='" + imgUpList.get(i)+"'");
				html = html.replace(imgList.get(i), GetOrgUtil.getUrlValue("imgServerPath") + imgUpList.get(i)+"");
			}
		} else {
			
			System.out.println("1111111111111111111");
			
			Elements imgEList = doc.select("img");
			
			List<String> imgHtmlList = new ArrayList<>();
			
			for (Element imgHtml : imgEList) {
				String imgSrc = imgHtml.attr("src");
				if (imgSrc.indexOf(GetOrgUtil.getUrlValue("checkFilePath")) == 0) {
					imgHtmlList.add(imgSrc);
				}
			}
			
			for (int i = 0; i < imgHtmlList.size(); i++) {			// 替换处理文本
				html = html.replace("<img", "<img dispSrc='" + imgHtmlList.get(i)+"'");
			}
			
		}
		
		System.out.println(html+"-=================");
		return html;
	}
	
	
	public static void main(String[] args) throws IOException {
		String s = "http://121.40.235.200:9270/group1/M00/00/00/rBBSg12BfHyAZZuKAABqkNWjlpI904.jpg";
		System.out.println(s.indexOf(GetOrgUtil.getUrlValue("checkFilePath")));
	}

}
