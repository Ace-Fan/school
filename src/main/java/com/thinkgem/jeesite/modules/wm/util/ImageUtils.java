package com.thinkgem.jeesite.modules.wm.util;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.imageio.ImageIO;

/**
 * @title 获取网络图片的宽高格式
 * @author weekly
 * @version V19.12.04
 */
public class ImageUtils {

	/**
	 * 获取网络图片的宽高格式
	 * @param url		网络图片路径
	 * @return String
	 */
	public static String getWidthAndHeight(String url) {
		try {
			String fileName = StringUtil.getLastOf(url, "/");
			String fileTypes = FileUtil.getTempContentType(fileName);		// 根据原始文件名获取其文件类型
			InputStream is = new URL(url).openStream();
			BufferedImage sourceImg = ImageIO.read(is);
			int width = sourceImg.getWidth();
			int height = sourceImg.getHeight();
			return width + "*" + height + "*" + fileTypes;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
}
