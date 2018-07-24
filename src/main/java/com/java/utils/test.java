package com.java.utils;

public class test {
    public static void main(String[] args){
        //定义二叉树
        BiTree root=new BiTree(100);
        root.add(new BiTree(50));
        root.add(new BiTree(80));
        root.add(new BiTree(30));
        root.add(new BiTree(45));
        root.add(new BiTree(15));
        System.out.println("中序遍历:");
        root.mid_tree();
        System.out.println("先序遍历:");
        root.pro_tree();
        System.out.println("后序遍历:");
        root.aft_tree();
    }
}
//递归定义法
class BiTree{
    private int v;
    private BiTree l;
    private BiTree r;

    public BiTree(int x) {
        v=x;
    }
    public void add(BiTree the){
        if(the.v<v){
            if(l==null){
                l=the;
            }else{
                l.add(the);
            }

        }else{
            if(r==null){
                r=the;
            }else{
                r.add(the);
            }
        }
    }
    //中序遍历
    public void mid_tree(){

        if(l!=null) l.mid_tree();
        System.out.println(v);
        if(r!=null) r.mid_tree();
    }
    //先序遍历
    public void pro_tree(){
        System.out.println(v);
        if(l!=null) l.pro_tree();
        if(r!=null) r.pro_tree();
    }
    //后序遍历
    public void aft_tree(){
        if(l!=null) l.aft_tree();
        if(r!=null) r.aft_tree();
        System.out.println(v);
    }

}