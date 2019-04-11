package com.eastebiz.dao;

import com.eastebiz.entity.EbizCompany;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface EbizCompanyDao {
    //注册
    public void insertEbizCompany(EbizCompany ebizCompany);
    //查询公司名称是否存在
    public EbizCompany selectOneCompanyName(String companyName);
    //查询医生名称是否存在
    public EbizCompany selectOneOwerName(String owerName);
    //修改登陆时间
    public void updateAndUpdateTime(@Param("id") Integer id,@Param("updateTime") Date updateTime);
    //修改信息
    public void updateEbizCompany(EbizCompany ebizCompany);
    //添加公司手册（是一个根据ID修改）
    public void updateUserManual(@Param("id") Integer id,@Param("userManual")String userManual);

    //修改地址、邮箱、电话
    public void updateAddressAndEmailAndphoneNumber(EbizCompany ebizCompany);

    //查询 地址1
    public String selectAddress1(@Param("id") Integer id);

    //查询 地址2
    public String selectAddress2(@Param("id") Integer id);
    //查询 地址3
    public String selectAddress3(@Param("id") Integer id);

    //查询一个
    public EbizCompany selectOneEbizCompany(@Param("id") Integer id);

    //查询所有公司
    public List<EbizCompany> selectAllCompany();

}
