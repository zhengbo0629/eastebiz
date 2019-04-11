package com.eastebiz.service.impl;

import com.eastebiz.dao.ProductDao;
import com.eastebiz.entity.Product;
import com.eastebiz.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {


    @Autowired
    private ProductDao productDao;

    //添加
    @Override
    public void registerProduct(Product product) {
        productDao.insertProduct(product);
    }

    //修改
    @Override
    public void amendbProduct(Product product) {
        productDao.updatebProduct(product);
    }

    //使用属性条件模糊查询
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Product> queryAllNameAndValue(Integer ebizcompanyId, String name, String value) {
        return productDao.selectAllNameAndValue(ebizcompanyId, name, value);
    }

    //根据提供的条件进行模糊查询  全部的查询
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Product> queryAllValue(Integer ebizcompanyId, String value) {
        return productDao.selectAllValue(ebizcompanyId, value);
    }

    //根据状态查询
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Product> queryAndStatus(String status,Integer ebizcompanyId) {
        return productDao.selectAndStatus(status,ebizcompanyId);
    }

    //根据公司ID查询公司旗下有多少产品
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Product> seclectAllEbizcompanyId(Integer ebizcompanyId) {
        return productDao.seclectAllEbizcompanyId(ebizcompanyId);
    }

    //根据公司ID查询公司在收购的产品
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Product> queryAllEbizcompany(Integer ebizcompanyId) {
        return productDao.seclectAllEbizcompany(ebizcompanyId);
    }


    //根据ID查询一个
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Product selectOneProduct(Integer id) {
        return productDao.selectOneProduct(id);
    }
}
