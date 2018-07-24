package com.java.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class tuling {
        public static void main(String[] args) throws IOException{
        String APIKEY="b40f1efc7d5940f7a64759607064f79c";
//        发送给机器人的问题
        String question="新乡天气怎么样？";
        String INFO= URLEncoder.encode(question,"UTF-8");
        String geturl="http://www.tuling123.com/openapi/api?key=" + APIKEY + "&info=" + INFO;
        URL url=new URL(geturl);
        HttpURLConnection connection=(HttpURLConnection) url.openConnection();
        connection.connect();
//        取得输入流，并使用Reader读取
         BufferedReader reader=new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));
         StringBuffer sb=new StringBuffer();
         String line=null;
         while ((line = reader.readLine())!=null){
             sb.append(line);
         }
//         断开连接
         reader.close();
         connection.disconnect();
         System.out.println(sb);
    }

}

