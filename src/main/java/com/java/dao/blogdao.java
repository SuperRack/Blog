package com.java.dao;

import com.java.entity.blog;

import java.util.List;

public interface blogdao {
    List<blog> selectblog();
    List<blog> selectblog2();
    blog selectbyid(int id);
    int selectcount();
    void updateblog(blog blog);
    /**
     * 按日志类别进行分类
     */
    List<String> selectcategory();
    /**
     * 按日志日期进行分类
     */
    List<String> selectrtime();
    /**
     * 写博客
     */
    void insertblog(blog blog);
}
