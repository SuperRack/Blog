package com.java.controller;

import org.apache.http.protocol.HttpService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.net.httpserver.HttpsServerImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@RequestMapping("file")
@Controller
public class testController {
    /**
     * 文件上传gongn
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public String upload(MultipartFile file, HttpServletRequest request) throws IOException {
        FileOutputStream fos=new FileOutputStream("D:/Package/MyTest01/src/main/webapp/image/");
        String path=fos.toString();
        String filename=file.getOriginalFilename();
        File dir=new File(path,filename);
        if(!dir.exists()){
           dir.mkdirs();
        }
        file.transferTo(dir);
        return "ok";
    }

    /**
     * 文件下载
     */
    @RequestMapping("/down")
    public void down(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String filename="D:/Package/MyTest01/src/main/webapp/image/face.jpg";
        //获取输入流
        InputStream bis=new BufferedInputStream(new FileInputStream(new File(filename)));
//        //若是中文名
//        String filename2="下载文件.txt";
//        //转码
//        filename= URLEncoder.encode(filename2,"utf-8");
        //设置文件下载头
        response.addHeader("Content-Dispostion","attachment;filename="+filename);
        //设置文件ContentType类型，这样设置，会自动判断下载类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out=new BufferedOutputStream(response.getOutputStream());
        int len=0;
        while ((len=bis.read())!=-1){
            out.write(len);
            out.flush();
        }
        out.close();
    }
    @RequestMapping("/test")
    public String test(){
        return "test";
    }
}