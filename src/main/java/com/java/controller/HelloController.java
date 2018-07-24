package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.entity.blog;

import com.java.entity.comment;
import com.java.service.CommentService;
import com.java.service.blogservice;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/blog")
public class HelloController {
    @Autowired
    private blogservice blogservice;
    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/new")
    public String newfile(@RequestParam(value = "pageNo",defaultValue = "1")int pageNo,
                          @RequestParam(value = "num",defaultValue ="0")int num,
                          Model model){
        int pagesize=5;
        List<String> stringList=blogservice.selectcategory();
        List<String> rlist=blogservice.selectrtime();
        System.out.println(rlist.toString());
        PageInfo pageInfo=blogservice.blog(pageNo,pagesize,num);
        List<blog> list=pageInfo.getList();
        long pagenum=page(pagesize,pageInfo.getTotal());
        model.addAttribute("list",list);
        model.addAttribute("Total",pageInfo.getTotal());
        model.addAttribute("pagenum",pagenum);
        model.addAttribute("stringlist",stringList);
        model.addAttribute("rlist",rlist);
        model.addAttribute("pageNo",pageNo);
        return "new";
    }
    public long page(int pagesize,long total){
        long pagenum=0;
        long pagetotal=total%pagesize;
        if(pagetotal==0){
            pagenum=total/pagesize;
        }else {
            pagenum=(total/pagesize)+1;
        }
        return pagenum;
    }


    @RequestMapping(value = "/one")
    public String newfile2(@RequestParam(value = "id")int id,Model model
           ){
        List<String> stringList=blogservice.selectcategory();
        List<String> rlist=blogservice.selectrtime();
        System.out.println(rlist.toString());
        blog blog=new blog();
        List<comment> comlists=new ArrayList<comment>();
        comlists=commentService.selectblogid(id);
        int num =comlists.size();
        blog.setComment(num);
        blog.setId(id);
        blogservice.updateblog(blog);
        blog=blogservice.selectbyid(id);
        String title1=null;
        String title2=null;
        if(blog.getId()>1){
             title1=blogservice.selectbyid(id-1).getTitle();
        }else {
            title1=null;
        }
        if(blog.getId()<blogservice.selectcount()){
             title2=blogservice.selectbyid(id+1).getTitle();
        }else {
            title2=null;
        }
        model.addAttribute("blog",blog);
        model.addAttribute("stringlist",stringList);
        model.addAttribute("rlist",rlist);
        model.addAttribute("comments",comlists);
        model.addAttribute("title1",title1);
        model.addAttribute("title2",title2);
        return "001";
    }

}
