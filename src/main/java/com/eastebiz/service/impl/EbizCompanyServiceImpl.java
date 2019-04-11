package com.eastebiz.service.impl;


import com.eastebiz.dao.EbizCompanyDao;
import com.eastebiz.entity.EbizCompany;
import com.eastebiz.service.EbizCompanyService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("ebizCompanyService")
@Transactional
public class EbizCompanyServiceImpl implements EbizCompanyService {



   @Autowired
    private EbizCompanyDao  ebizCompanyDao;

    //注册
    @Override
    public void registerEbizCompany(EbizCompany ebizCompany) {
        ebizCompanyDao.insertEbizCompany(ebizCompany);
    }

    //查询公司名称是否存在
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizCompany queryOneCompanyName(String companyName) {
        return ebizCompanyDao.selectOneCompanyName(companyName);
    }
    //查询医生名称是否存在
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizCompany queryOneOwerName(String owerName) {
        return ebizCompanyDao.selectOneOwerName(owerName);
    }
    //修改登陆时间
    @Override
    public void amendAndUpdateTime(Integer id, Date updateTime) {
        ebizCompanyDao.updateAndUpdateTime(id, updateTime);
    }
    //修改信息
    @Override
    public void amendEbizCompany(EbizCompany ebizCompany) {
        ebizCompanyDao.updateEbizCompany(ebizCompany);
    }

    //添加公司手册（是一个根据ID修改）
    @Override
    public void amendUserManual(Integer id, String userManual) {
        ebizCompanyDao.updateUserManual(id, userManual);
    }

   @Override
   public void amendAddressAndEmailAndphoneNumber(EbizCompany ebizCompany) {
    ebizCompanyDao.updateAddressAndEmailAndphoneNumber(ebizCompany);
   }


 //查询三个地址

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public String selectAddress1(Integer id) {
        return ebizCompanyDao.selectAddress1(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public String selectAddress2(Integer id) {
        return ebizCompanyDao.selectAddress2(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public String selectAddress3(Integer id) {
        return ebizCompanyDao.selectAddress3(id);
    }



    //查询一个
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizCompany selectOneEbizCompany(Integer id) {
        return ebizCompanyDao.selectOneEbizCompany(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<EbizCompany> selectAllCompany() {
        return ebizCompanyDao.selectAllCompany();
    }

}
