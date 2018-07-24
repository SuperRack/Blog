package com.java.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.dao.blogdao;
import com.java.entity.blog;
import com.sun.mail.imap.protocol.Item;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.FetchProfile;
import java.util.List;
@Service
public class blogservice {
    @Autowired
    private blogdao blogdao;


    /**
     * 文章分页显示
     * @param pageNo
     * @param pagesize
     * @return
     */
    public PageInfo blog(int pageNo,int pagesize,int num){
        PageHelper.startPage(pageNo,pagesize);
        List<blog> list=null;
        if(num==0){
            list=blogdao.selectblog();
        }
       if(num==1){
            list=blogdao.selectblog2();
       }
        PageInfo page=new PageInfo(list);
        return page;
    }

    /**
     * 通过id查找文章
     * @param id
     * @return
     */
    public blog selectbyid(int id){
        return blogdao.selectbyid(id);
    }
    /**
     * 计算总条数
     */
    public int selectcount(){
        int count=blogdao.selectcount();
        return count;
    }
    /**
     * 更新博客
     */
    public void updateblog(blog blog){
        System.out.println(blog.getId());
        System.out.println(blog.getComment());
        blogdao.updateblog(blog);
    }
    /**
     * 按日志类别分类
     */
    public List<String> selectcategory(){
        return blogdao.selectcategory();
    }
    /**
     * 按日志日期分类
     */
    public List<String> selectrtime(){
        return blogdao.selectrtime();
    }

    /**
     * 写博客
     */
    public void insertblog(blog blog){
        blogdao.insertblog(blog);
    }
}
