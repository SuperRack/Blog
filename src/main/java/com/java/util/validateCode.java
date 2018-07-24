package com.java.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class validateCode {
    private int width=160;
    private int height=40;
    private int codeCount=5;
    private int lineCount=150;
    //验证码
    private String code=null;
    //验证码图片Buffer
    private BufferedImage buffimg=null;
    //验证码范围
    private char[] codeSequence={'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    //默认构造函数
    public validateCode(){
        this.creataCode();
    }
    public validateCode(int width,int height){
        this.width=width;
        this.height=height;
        this.creataCode();
    }
    public validateCode(int width,int height,int codeCount,int lineCount){
        this.width=width;
        this.height=height;
        this.codeCount=codeCount;
        this.lineCount=lineCount;
    }
    private void creataCode() {
        int x=0,fontHeight=0,codeY=0;
        int red=0,green=0,blue=0;
        x=width/(codeCount+2);
        fontHeight=height-2;
        codeY=height-4;
        //图像buffer
        buffimg=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D g=buffimg.createGraphics();
        //生成随机数
        Random random=new Random();
        //将图像填充成白色
        g.setColor(Color.white);
        g.fillRect(0,0,width,height);
        //创建字体
        Font font=new Font("Fixedsys", Font.PLAIN, fontHeight);
        g.setFont(font);
        for (int i=0;i<lineCount;i++){
            //设置随机开始和结束
            int xs=random.nextInt(width);
            int ys=random.nextInt(height);
            int xe=xs+random.nextInt(width/8);
            int ye=ys+random.nextInt(height/8);
            //产生随机颜色
            red=random.nextInt(255);
            green=random.nextInt(255);
            blue=random.nextInt(255);
            g.setColor(new Color(red,green,blue));
            g.drawLine(xs,ys,xe,ye);
        }
        //随机记录产生的验证码
        StringBuffer randomCode=new StringBuffer();
        for (int i=0;i<codeCount;i++){
            String srtRand=String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
            red=random.nextInt(255);
            green=random.nextInt(255);
            blue=random.nextInt(255);
            g.setColor(new Color(red,green,blue));
            g.drawString(srtRand,(i+1)*x,codeY);
            randomCode.append(srtRand);
        }
        code=randomCode.toString();
    }
    public void write(String path) throws IOException {
        OutputStream sos = new FileOutputStream(path);
        this.write(sos);
    }
    public void write(OutputStream sos) throws IOException {
        ImageIO.write(buffimg, "png", sos);
        sos.close();
    }

    public BufferedImage getBuffImg() {
        return buffimg;
    }
    public String getCode() {
        return code;
    }
}
