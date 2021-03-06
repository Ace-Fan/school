package com.thinkgem.jeesite.modules.adopens.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.util.Hashtable;

/**
 * 二维码工具类
 *
 * http://www.cnblogs.com/lixuwu/p/5953226.html
 *
 */
public class QrCodeUtil2 {

    /**
     * 生成二维码（生成文件形式）
     * @param contents  二维码内容
     * @param logoImgPath  logo路径 url
     * @param isNetImg  是否为链接图片
     * @param qrcodeSaveFile  二维码保存File
     * @param format  二维码的图片格式
     * @throws IOException
     * @throws WriterException
     */
    public static void encodeQrcode(String contents, String logoImgPath, boolean isNetImg, File qrcodeSaveFile, String format) throws IOException, WriterException {
        int width = 430; // 二维码图片宽度 300
        int height = 430; // 二维码图片高度300

//        String format = "png";// 二维码的图片格式

        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
        // 指定纠错等级,纠错级别（L 7%、M 15%、Q 25%、H 30%）
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        // 内容所使用字符集编码
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
//      hints.put(EncodeHintType.MAX_SIZE, 350);//设置图片的最大值
//      hints.put(EncodeHintType.MIN_SIZE, 100);//设置图片的最小值
        hints.put(EncodeHintType.MARGIN, 1);//设置二维码边的空度，非负数

        BitMatrix bitMatrix = new MultiFormatWriter().encode(contents,//要编码的内容
                //编码类型，目前zxing支持：Aztec 2D,CODABAR 1D format,Code 39 1D,Code 93 1D ,Code 128 1D,
                //Data Matrix 2D , EAN-8 1D,EAN-13 1D,ITF (Interleaved Two of Five) 1D,
                //MaxiCode 2D barcode,PDF417,QR Code 2D,RSS 14,RSS EXPANDED,UPC-A 1D,UPC-E 1D,UPC/EAN extension,UPC_EAN_EXTENSION
                BarcodeFormat.QR_CODE,
                width, //条形码的宽度
                height, //条形码的高度
                hints);//生成条形码时的一些配置,此项可选

        // 生成二维码
//        File outputFile = new File(qrcodeSaveFile"+format);//指定输出路径

        MatrixToImageWriter.writeToFile(logoImgPath, isNetImg, bitMatrix, format, qrcodeSaveFile);
    }

    /**
     * 生成二维码（BufferedImage形式）
     * @param contents  二维码内容
     * @param logoImgPath  logo路径 url
     * @param isNetImg  是否为链接图片
     * @param format  二维码的图片格式
     * @throws IOException
     * @throws WriterException
     */
    public static BufferedImage encodeQrcodeReturnBufferedImage(String contents, String logoImgPath, boolean isNetImg, String format) throws IOException, WriterException {
        int width = 430; // 二维码图片宽度 300
        int height = 430; // 二维码图片高度300

//        String format = "png";// 二维码的图片格式

        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
        // 指定纠错等级,纠错级别（L 7%、M 15%、Q 25%、H 30%）
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        // 内容所使用字符集编码
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
//      hints.put(EncodeHintType.MAX_SIZE, 350);//设置图片的最大值
//      hints.put(EncodeHintType.MIN_SIZE, 100);//设置图片的最小值
        hints.put(EncodeHintType.MARGIN, 1);//设置二维码边的空度，非负数

        BitMatrix bitMatrix = new MultiFormatWriter().encode(contents,//要编码的内容
                //编码类型，目前zxing支持：Aztec 2D,CODABAR 1D format,Code 39 1D,Code 93 1D ,Code 128 1D,
                //Data Matrix 2D , EAN-8 1D,EAN-13 1D,ITF (Interleaved Two of Five) 1D,
                //MaxiCode 2D barcode,PDF417,QR Code 2D,RSS 14,RSS EXPANDED,UPC-A 1D,UPC-E 1D,UPC/EAN extension,UPC_EAN_EXTENSION
                BarcodeFormat.QR_CODE,
                width, //条形码的宽度
                height, //条形码的高度
                hints);//生成条形码时的一些配置,此项可选

        // 生成二维码
//        File outputFile = new File(qrcodeSaveFile"+format);//指定输出路径

        return MatrixToImageWriter.returnBufferedImage(logoImgPath, isNetImg, bitMatrix, format);
    }

    public static void main(String[] args) throws Exception {
        try {
            String format = "png";
            File dirFile = new File("f:/ss/aa");
            if (!dirFile.exists()) {
                dirFile.mkdirs();
            }
            File qrcodeSaveFile = new File(dirFile, "aaa."+format);
            encodeQrcode("我是内容2222",
                    "http://wx.qlogo.cn/mmopen/DLAWAZXktYbWJ6G7KfIia1YFccA0qhHzPnC7PsQETzibfeItFibJfhUl1RhCOD8GhW5iadUgHVdwQXriasmm7f2B0ricY7IF3pKxUL/0",
                    true,
                    qrcodeSaveFile, format);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
}

class MatrixToImageWriter {
    private static final int BLACK = 0xFF000000;//用于设置图案的颜色
    private static final int WHITE = 0xFFFFFFFF; //用于背景色

    private MatrixToImageWriter() {
    }

    public static BufferedImage toBufferedImage(BitMatrix matrix) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                image.setRGB(x, y,  (matrix.get(x, y) ? BLACK : WHITE));
//              image.setRGB(x, y,  (matrix.get(x, y) ? Color.YELLOW.getRGB() : Color.CYAN.getRGB()));
            }
        }
        return image;
    }

    public static void writeToFile(String logoImgPath, boolean isNetImg,  BitMatrix matrix, String format, File file) throws IOException {
        BufferedImage image = toBufferedImage(matrix);

        BufferedImage logo = null;
        try {
            if (isNetImg) {
                logo = ImageIO.read(new URL(logoImgPath));
            } else {
                logo = ImageIO.read(new File(logoImgPath));
            }
        } catch (Exception e) {
        }
        if (null != logo) {
            //设置logo图标
            LogoConfig logoConfig = new LogoConfig();
            image = logoConfig.logoMatrix(logo, image);
        }
        if (!ImageIO.write(image, format, file)) {
            throw new IOException("Could not write an image of format " + format + " to " + file);
        }else{
            System.out.println("图片生成成功！");
        }
    }

    public static void writeToStream(String logoImgPath, boolean isNetImg, BitMatrix matrix, String format, OutputStream stream) throws IOException {
        BufferedImage image = toBufferedImage(matrix);

        BufferedImage logo = null;
        try {
            if (isNetImg) {
                logo = ImageIO.read(new URL(logoImgPath));
            } else {
                logo = ImageIO.read(new File(logoImgPath));
            }
        } catch (Exception e) {
        }
        if (null != logo) {
            //设置logo图标
            LogoConfig logoConfig = new LogoConfig();
            image = logoConfig.logoMatrix(logo, image);
        }
        if (!ImageIO.write(image, format, stream)) {
            throw new IOException("Could not write an image of format " + format);
        }
    }


    public static BufferedImage returnBufferedImage(String logoImgPath, boolean isNetImg, BitMatrix matrix, String format) throws IOException {
        BufferedImage image = toBufferedImage(matrix);

        BufferedImage logo = null;
        try {
            if (isNetImg) {
                logo = ImageIO.read(new URL(logoImgPath));
            } else {
                logo = ImageIO.read(new File(logoImgPath));
            }
        } catch (Exception e) {
        }
        if (null != logo) {
            //设置logo图标
            LogoConfig logoConfig = new LogoConfig();
            image = logoConfig.logoMatrix(logo, image);
        }
        return image;
    }
}

class LogoConfig {

    /**
     * 设置 logo
     * @param matrixImage 源二维码图片
     * @return 返回带有logo的二维码图片
     * @throws IOException
     * @author Administrator sangwenhao
     */
    public BufferedImage logoMatrix(BufferedImage logo,BufferedImage matrixImage) throws IOException{
        /**
         * 读取二维码图片，并构建绘图对象
         */
        Graphics2D g2 = matrixImage.createGraphics();

        int matrixWidth = matrixImage.getWidth();
        int matrixHeigh = matrixImage.getHeight();

        /**
         * 读取Logo图片
         */
//        BufferedImage logo = ImageIO.read(new File(logoImgPath));
//        BufferedImage logo = ImageIO.read(new URL(logoImgPath));

        //开始绘制图片
        g2.drawImage(logo,matrixWidth/5*2,matrixHeigh/5*2, matrixWidth/5, matrixHeigh/5, null);//绘制
        BasicStroke stroke = new BasicStroke(5,BasicStroke.CAP_ROUND,BasicStroke.JOIN_ROUND);
        g2.setStroke(stroke);// 设置笔画对象
        //指定弧度的圆角矩形
        RoundRectangle2D.Float round = new RoundRectangle2D.Float(matrixWidth/5*2, matrixHeigh/5*2, matrixWidth/5, matrixHeigh/5,20,20);
        g2.setColor(Color.white);
        g2.draw(round);// 绘制圆弧矩形

        //设置logo 有一道灰色边框
        BasicStroke stroke2 = new BasicStroke(1,BasicStroke.CAP_ROUND,BasicStroke.JOIN_ROUND);
        g2.setStroke(stroke2);// 设置笔画对象
        RoundRectangle2D.Float round2 = new RoundRectangle2D.Float(matrixWidth/5*2+2, matrixHeigh/5*2+2, matrixWidth/5-4, matrixHeigh/5-4,20,20);
        g2.setColor(new Color(128,128,128));
        g2.draw(round2);// 绘制圆弧矩形

        g2.dispose();
        matrixImage.flush() ;
        return matrixImage ;
    }

}