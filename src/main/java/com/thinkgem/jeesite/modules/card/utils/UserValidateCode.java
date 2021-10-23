package com.thinkgem.jeesite.modules.card.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Polygon;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

/**
 * 生成验证码
 * @author JASON Liu
 *
 */
public class UserValidateCode {

	 // 生成的验证码
    String ValidateCode;
    // 临时文件
    File file;
    char[] value = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
//获取验证码图片，参数：n:验证码字符数量
    public File getValidateCodeImage(int n) throws IOException {
        //验证码图片尺寸
        int width = 25 * n;
        int height = 30;

        Font font = new Font("黑体", Font.BOLD, 25);
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = (Graphics2D) bi.getGraphics();
        g2.setBackground(Color.WHITE);//背景色
        g2.clearRect(0, 0, width, height);
        g2.setFont(font);//字体

        String str = "";
        Random random = new Random();
        char[] c = new char[n];
        //绘制字符
        for (int i = 0; i < n; i++) {
            c[i] = value[random.nextInt(36)];
            g2.setColor(getRandColor(0, 255));
            g2.drawString(String.valueOf(c[i]), width / n * i, height -5);
        }
        str = String.valueOf(c);
        //绘制线条
        for (int i = 0; i < 10; i++) {
            g2.setPaint(getRandColor(0, 255));
            g2.drawLine(random.nextInt(width), random.nextInt(30), random.nextInt(width), random.nextInt(30));
            g2.drawPolygon(new Polygon());
        }
        //临时图片路径
     file = new File("E:/liuzhuo/doc/刘卓：mybatis/imgs/国家+" + str + ".jpg");
        //输出到临时图像
        ImageIO.write(bi, "jpg", file);

        this.ValidateCode = str;
        this.file = file;
        return file;
    }
    /**
     * 获取随机颜色
     * @param fc
     * @param bc
     * @return
     */
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
    /**
     * 删除临时图片
     */
    public void destroy() {
        if (this.file.exists()) {
            this.file.delete();
        }
    }

    public String getValidateCode() {
        return ValidateCode;
    }

    public void setValidateCode(String validateCode) {
        ValidateCode = validateCode;
    }
}
