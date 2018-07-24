package com.java.controller;

import com.java.entity.blog;
import com.java.service.blogservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/back")
public class backController {
    @Autowired
    private blogservice blogservice;

    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm");
    @RequestMapping("one")
    public String one(){
        return "back";
    }
    @RequestMapping(value = "/ok",method = RequestMethod.POST)
    public String back(@RequestParam("title") String title,@RequestParam("edit") String edit,
                       @RequestParam("category") String category,@RequestParam("key") String key,
                       @RequestParam("articleinfo") String articleinfo){
        blog blog=new blog();
        if (title!=null && edit!=null && category!=null && key!=null && articleinfo!=null){
            blog.setTitle(title);
            blog.setEdit(edit);
            blog.setCategory(category);
            blog.setKeyword(key);
            blog.setContent(articleinfo);
            blog.setRtime(format.format(new Date()));
            blogservice.insertblog(blog);
        }
        return "back";
    }

}
