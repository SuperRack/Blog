package com.java.service;

import com.java.dao.commentdao;
import com.java.entity.comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private commentdao commentdao;

    public void insert(comment comment){
        commentdao.insert(comment);
    }

    public List<comment> selectblogid(int blogid){
        List<comment> comlist=commentdao.selectblogid(blogid);
        return comlist;
    }
}
