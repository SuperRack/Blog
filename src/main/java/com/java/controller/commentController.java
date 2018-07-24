package com.java.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.entity.comment;
import com.java.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.pkcs11.wrapper.Constants;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.xml.stream.events.Comment;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/blog")
public class commentController {
    @Autowired
    private CommentService commentservice;

    private SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
    private ObjectMapper mapper=new ObjectMapper();
    @ResponseBody
    @RequestMapping(value="/com", produces = "application/json; charset=utf-8")
    public String insertcom(int blogid, String name, String mail, String kaptcha,
                            String areas, HttpServletRequest request) throws JsonProcessingException {
        String code=(String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        System.out.println(code);
        System.out.println(kaptcha);
        if (name.isEmpty()){
            String json1=mapper.writeValueAsString("名称不能为空！");
            return json1;
        }else if (!kaptcha.equals(code)){
            String json2=mapper.writeValueAsString("验证码错误！");
            return json2;
        }else {
            comment comment = new comment();
            comment.setBlogid(blogid);
            comment.setContent(areas);
            comment.setDate(dateFormat.format(new Date()));
            comment.setMail(mail);
            comment.setName(name);
            commentservice.insert(comment);
        }
        return null;
    }

}
