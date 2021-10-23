package com.thinkgem.jeesite.modules.adopens.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/5/10.
 */
public class FileUtil {

    private static String FILE_UPLOAD_DIR = "jeesite_upload";

    public static String saveFile(HttpServletRequest request, MultipartFile file, String fr) {
        // 判断文件是否为空
        if (null != file && !file.isEmpty()) {
            try {
                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
                // )
                String newFileName = fr + new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."), file.getOriginalFilename().length());
                String filePath = request.getSession().getServletContext().getRealPath("/") + FILE_UPLOAD_DIR +"/"
                        + newFileName;
                File saveDir = new File(filePath);
                if (!saveDir.getParentFile().exists())
                    saveDir.getParentFile().mkdirs();
                // 转存文件
                file.transferTo(saveDir);
                return filePath;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "";
    }

}
