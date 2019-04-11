package com.eastebiz.dao;


import com.eastebiz.entity.EbizRelationoPerations;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EbizRelationoPerationsDao {

    //添加
    public void insertEbizRelationoPerations(EbizRelationoPerations ebizRelationoPerations);

    //修改
    public void updateEbizRelationoPerations(@Param("id") Integer id, @Param("addStatus") String addStatus);

    //查询用户添加公司
    public List<EbizRelationoPerations> selectAllUserAndCompany(@Param("addStatus") String addStatus);

    //查询公司添加用户
    public List<EbizRelationoPerations> selectALLCompanyAndUser(@Param("addStatus")String addStatus);

    //ID查询一个
    public EbizRelationoPerations selectOneEbizRelationoPerations(@Param("id") Integer id);

    //使用公司名字和用户名字去查询
    public EbizRelationoPerations selectOneUserNameAanCompanyName(@Param("userName") String userName,@Param("companyName")String companyName);

}
