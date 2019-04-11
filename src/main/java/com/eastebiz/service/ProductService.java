package com.eastebiz.service;

import com.eastebiz.entity.Product;



import java.util.List;

public interface ProductService {
    //添加
    public void registerProduct(Product product);

    //修改
    public void amendbProduct(Product product);

    //使用属性条件模糊查询
    public List<Product> queryAllNameAndValue(Integer ebizcompanyId, String name , String value);

    //根据提供的条件进行模糊查询  全部的查询
    public List<Product> queryAllValue(Integer ebizcompanyId,String value);

    //根据状态查询
    public List<Product> queryAndStatus(String status,Integer ebizcompanyId);

    //根据公司ID查询公司旗下有多少产品
    public List<Product> seclectAllEbizcompanyId(Integer ebizcompanyId);


    //根据公司ID查询公司在收购的产品
    public List<Product> queryAllEbizcompany(Integer ebizcompanyId);


    //根据ID查询一个
    public Product selectOneProduct(Integer id);
}
