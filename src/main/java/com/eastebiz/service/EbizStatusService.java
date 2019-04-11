package com.eastebiz.service;

import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizStatus;
import com.eastebiz.entity.EbizUser;


import java.util.List;

public interface EbizStatusService {


    //添加
    public void addEbizStatus(EbizStatus ebizStatus);

    //公司修改修改
    public void updateEbizStatus(EbizStatus ebizStatus);

    //用户查询激活状态
    public List<EbizStatus> queryALLActiveEbizCompany(Integer userId,String status);

    //用户查询添加未激活
    public List<EbizStatus> queryAddUnActiveEbizCompany(Integer userId,String status);

    //公司查询所有护士
    public List<EbizStatus> queryAllEbizUser(Integer companyId);

    //ID查询一个用户信息
    public EbizStatus selectOneEbizUser(Integer id);

    //ID查询一个公司信息
    public EbizStatus selectOneEbizCompany( Integer id);
}
