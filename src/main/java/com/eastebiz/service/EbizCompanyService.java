package com.eastebiz.service;

import com.eastebiz.entity.EbizCompany;


import java.util.Date;
import java.util.List;

public interface EbizCompanyService {

    //注册
    public void registerEbizCompany(EbizCompany ebizCompany);
   //查询公司名称是否存在
    public EbizCompany queryOneCompanyName(String companyName);
    //查询医生名称是否存在
    public EbizCompany queryOneOwerName(String owerName);
    //修改登陆时间
    public void amendAndUpdateTime( Integer id,  Date updateTime);
    //修改信息
    public void amendEbizCompany(EbizCompany ebizCompany);

    //添加公司手册（是一个根据ID修改）
    public void amendUserManual(Integer id,String userManual);

    //修改地址、邮箱、电话
    public void amendAddressAndEmailAndphoneNumber(EbizCompany ebizCompany);

    //查询 地址1
    public String selectAddress1(Integer id);

    //查询 地址2
    public String selectAddress2(Integer id);
    //查询 地址3
    public String selectAddress3(Integer id);

    //查询一个
    public EbizCompany selectOneEbizCompany(Integer id);


    public List<EbizCompany> selectAllCompany();
}
