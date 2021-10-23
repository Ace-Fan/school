package com.thinkgem.jeesite.modules.base.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.modules.base.entity.FileUploadRes;

import net.sf.json.JSONObject;

/**
 * 文件工具类
 * @author weekly
 * @version V19.08.08
 */
public class FileUtil {
	
	// 上传图片服务器地址
	public final static String uploadFilePath = GetOrgUtil.getUrlValue("uploadFilePath"); 
	
	/**
	 * 通用上传文件返回报文
	 * @param file			临时文件
	 * @param filePath		真实TOMCAT文件目录
	 * @return
	 * @throws IOException
	 */
	public static String singleFileUpload(MultipartFile file, String filePath) throws IOException {

        String originalFileName = file.getOriginalFilename();
        String pfx = originalFileName.substring(originalFileName.lastIndexOf("."));
        String fileName = UUID.randomUUID().toString().replaceAll("-", "");
        String sourceImg = filePath + File.separator + fileName + pfx;
        File file1 = new File(sourceImg);
        if (!file1.getParentFile().exists()) { file1.getParentFile().mkdirs(); }  // 判断路径是否存在,没有则新建
        file.transferTo(file1);
        RestTemplate restTemplate = new RestTemplate();

        //设置请求头
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("multipart/form-data");
        headers.setContentType(type);

        //设置请求体，注意是LinkedMultiValueMap
        FileSystemResource fileSystemResource = new FileSystemResource(sourceImg);
        MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
        form.add("file", fileSystemResource);
        form.add("watermark", false);

        //用HttpEntity封装整个请求报文
        HttpEntity<MultiValueMap<String, Object>> files = new HttpEntity<>(form, headers);

        return restTemplate.postForObject(uploadFilePath, files, String.class);
    }
	
	/**
	 * 动态获取媒体类型
	 * @param filename
	 * @return
	 */
	public static String getTempContentType(String filename) {
		String type = null;
		Path path = Paths.get(filename);
		try {
			type = Files.probeContentType(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return type;
	}
	
	public static String getFileExtensionName(String filename) {
		int pos= filename.lastIndexOf(".");
		String ret = "";
		if (pos != -1 ) { ret = filename.substring(pos+1); }
		return ret;
	}
	
	/**
	 * 传递JSON字符串，返回结果集
	 * @param jsonStr
	 * @return
	 */
	public static String jsonRes(String jsonStr) {
        FileUploadRes fileUploadRes = (FileUploadRes) JSONObject.toBean(toJsonObject(jsonStr), FileUploadRes.class);
        return fileUploadRes.getResult();
	}
	
	public static String fileUpload(String filePath) throws IOException {
		RestTemplate restTemplate = new RestTemplate();

        //设置请求头
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("multipart/form-data");
        headers.setContentType(type);

        //设置请求体，注意是LinkedMultiValueMap
        FileSystemResource fileSystemResource = new FileSystemResource(filePath);
        MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
        form.add("file", fileSystemResource);
        form.add("watermark", false);

        //用HttpEntity封装整个请求报文
        HttpEntity<MultiValueMap<String, Object>> files = new HttpEntity<>(form, headers);
        
        //返回结果对象
        filePath = restTemplate.postForObject(uploadFilePath, files, String.class);
        FileUploadRes fileUploadRes = (FileUploadRes) JSONObject.toBean(toJsonObject(filePath), FileUploadRes.class);
        return fileUploadRes.getResult();
	}
	
	/**
	 * JSON字符串转为JSON对象
	 * @param json
	 */
	public static JSONObject toJsonObject(String json) {
		json = json.replaceAll("&quot;", "\""); // 把&quot转换为\
		JSONObject jsonObject = JSONObject.fromObject(json);// 转json
		return jsonObject;
	}
	
	/**
	 * 通用上传文件返回报文
	 * @param file			临时文件
	 * @param filePath		真实TOMCAT文件目录
	 * @return
	 * @throws IOException
	 */
	public static String fileUploadRes(String sourceImg, File file, String filePath) throws IOException {

        RestTemplate restTemplate = new RestTemplate();

        //设置请求头
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("multipart/form-data");
        headers.setContentType(type);

        //设置请求体，注意是LinkedMultiValueMap
        FileSystemResource fileSystemResource = new FileSystemResource(sourceImg);
        MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
        form.add("file", fileSystemResource);
        form.add("watermark", false);

        //用HttpEntity封装整个请求报文
        HttpEntity<MultiValueMap<String, Object>> files = new HttpEntity<>(form, headers);

        return restTemplate.postForObject(uploadFilePath, files, String.class);
    }
}
