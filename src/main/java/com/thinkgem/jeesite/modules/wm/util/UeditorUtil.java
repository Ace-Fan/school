package com.thinkgem.jeesite.modules.wm.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

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
			if (imgSrc.indexOf(GetOrgUtil.getUrlValue("imgServerPath")) == -1) {
				imgSrcList.add(imgSrc);
			}
		}
		
		return imgSrcList;
	}
	
	/**
	 * 判断HTML失败包含上传文件路径，如果不包含返回false，包含返回true
	 * @param html
	 * @return
	 */
	public static boolean checkUploadInfo(String html,String projectPath) {
		Document doc = Jsoup.parse(html);
		List<String> imgList = getImgSrcList(doc);
		
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
		
		if (imgList.size()>0) {
			String pathHtml = "";
			for (int i = 0; i < imgList.size(); i++) {			// 上传文件服务器，获取返回结果集
				pathHtml = "";
				pathHtml = path + imgList.get(i);
				pathHtml = FileUtil.fileUpload(pathHtml);
				String pathAfrerHtml = GetOrgUtil.getUrlValue("imgServerPath") + pathHtml;
				html = html.replace(imgList.get(i), pathAfrerHtml+'"' + " dispSrc=" + '"' + pathHtml);
			}
		} else {
			Elements imgEList = doc.select("img");
			for (Element imgHtml : imgEList) {
				String imgSrc = imgHtml.attr("src");
				String dispSrc = imgSrc.substring(GetOrgUtil.getUrlValue("imgServerPath").length(), imgSrc.length());
				if (imgSrc.indexOf(GetOrgUtil.getUrlValue("imgServerPath")) == 0) {
					html = html.replace(imgSrc, imgSrc+'"' + " dispSrc=" + '"' + dispSrc);
				}
			}
			
		}
		
		return html;
	}
	
}
