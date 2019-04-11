package com.eastebiz.dao;

import com.eastebiz.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface AdminDao {

    //登录
    public Admin  selectOneAdmin(@Param("adminName") String adminName, @Param("password") String password);
}
