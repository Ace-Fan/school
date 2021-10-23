package com.thinkgem.jeesite.modules.wm.util;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

public class ImageDownBenDiUtil {
	
	public static void main(String[] args) {
		
		String url1 = "19-钣金件-http://47.105.171.2:4869/31b931bd9827ffb96109f864000a9b82";
        	
        downloadPicture(url1);
    }
	
    //链接url下载图片
    private static void downloadPicture(String imageUrl) {
        URL url = null;
        
        String image = imageUrl.split("-")[2];

        try {
            url = new URL(image);
            DataInputStream dataInputStream = new DataInputStream(url.openStream());

            String imageName =  "C:/Users/Administrator/Desktop/智慧机甲/机甲图片-前端商品图片  19.11.15/钣金件/分类图片/"+imageUrl.split("-")[0]+"-"+imageUrl.split("-")[1]+".jpg";

            FileOutputStream fileOutputStream = new FileOutputStream(new File(imageName));
            ByteArrayOutputStream output = new ByteArrayOutputStream();

            byte[] buffer = new byte[1024];
            int length;

            while ((length = dataInputStream.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
            fileOutputStream.write(output.toByteArray());
            dataInputStream.close();
            fileOutputStream.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
