package com.java.dao;

import com.java.entity.comment;

import java.util.List;

public interface commentdao {
    void insert(comment comment);
    List<comment> selectblogid(int bolgid);

}
