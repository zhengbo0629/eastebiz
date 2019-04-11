package com.eastebiz.dao;

import com.eastebiz.entity.EbizUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface EbizUserDao {
    //注册
    public  void insertEbizUser(EbizUser ebizUser);

    //登录
    public EbizUser selectOneEbizUser(@Param("userName")String userName,@Param("password")String  password);

    //查询用户是否是存在
    public EbizUser selectOneUserName(String uerName);

    //修改登录时间
    public void updateAndUpdateTime(@Param("id") Integer id,@Param("updateTime") Date updateTime);

    //修改信息
    public void updateEbizUser(EbizUser ebizUser);

    //查询地址
    public EbizUser selectAddress(@Param("id") Integer id);

}
