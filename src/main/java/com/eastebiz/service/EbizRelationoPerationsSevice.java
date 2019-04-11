package com.eastebiz.service;


import com.eastebiz.entity.EbizRelationoPerations;

import java.util.List;

public interface EbizRelationoPerationsSevice {


    //添加
    public void insertEbizRelationoPerations(EbizRelationoPerations ebizRelationoPerations);

    //修改
    public void updateEbizRelationoPerations(Integer id,String addStatus);

    //查询用户添加公司
    public List<EbizRelationoPerations> selectAllUserAndCompany( String addStatus);

    //查询公司添加用户
    public List<EbizRelationoPerations> selectALLCompanyAndUser(String addStatus);

    //ID查询一个
    public EbizRelationoPerations queryOneEbizRelationoPerations( Integer id);


    //使用公司名字和用户名字去查询
    public EbizRelationoPerations queryOneUserNameAanCompanyName(String userName,String companyName);

}
