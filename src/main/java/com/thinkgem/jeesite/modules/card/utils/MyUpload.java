package com.thinkgem.jeesite.modules.card.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class MyUpload {

	public static String path="";
	public static String fileName="";
	public static void getUpload(MultipartFile photo,HttpServletRequest request) throws IllegalStateException, IOException{
		if (!photo.isEmpty()) {  //判断文件不为空
			//获取当前服务器下目录
			path = request.getSession().getServletContext().getRealPath("/"+"upload");
			//获取原始文件名
			fileName = photo.getOriginalFilename();
			//将文件路径一起文件名加入到实体类的属性中
			//限制文件上传格式
			File file = new File(path, fileName);
			//判断路径是否存在
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			//完成上传
			photo.transferTo(file);
		}
	}
}
