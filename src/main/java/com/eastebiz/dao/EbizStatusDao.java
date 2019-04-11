package com.eastebiz.dao;

import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizStatus;
import com.eastebiz.entity.EbizUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;
@Repository
public interface EbizStatusDao {

    //添加
    public void insertEbizStatus(EbizStatus ebizStatus);

    //公司修改修改
    public void updateEbizStatus(EbizStatus ebizStatus);



    //用户查询激活状态
    public List<EbizStatus> selectALLActiveEbizCompany(@Param("userId") Integer userId,@Param("status")String status);

    //用户查询添加未激活
    public List<EbizStatus> selectAddUnActiveEbizCompany(@Param("userId") Integer userId, @Param("status")String status);

    //公司查询所有护士
    public List<EbizStatus> selectAllEbizUser(@Param("companyId") Integer companyId);

    //ID查询一个用户信息
    public EbizStatus selectOneEbizUser(@Param("id") Integer id);

    //ID查询一个公司信息
    public EbizStatus selectOneEbizCompany(@Param("id") Integer id);
}
