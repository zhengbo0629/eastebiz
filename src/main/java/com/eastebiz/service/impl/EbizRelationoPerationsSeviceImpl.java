package com.eastebiz.service.impl;

import com.eastebiz.dao.EbizRelationoPerationsDao;
import com.eastebiz.entity.EbizRelationoPerations;
import com.eastebiz.service.EbizRelationoPerationsSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("ebizRelationoPerationsSevice")
@Transactional
public class EbizRelationoPerationsSeviceImpl implements EbizRelationoPerationsSevice {

    @Autowired
    private EbizRelationoPerationsDao ebizRelationoPerationsDao;



    //添加
    @Override
    public void insertEbizRelationoPerations(EbizRelationoPerations ebizRelationoPerations) {
        ebizRelationoPerationsDao.insertEbizRelationoPerations(ebizRelationoPerations);
    }

    //修改
    @Override
    public void updateEbizRelationoPerations(Integer id,String addStatus) {
        ebizRelationoPerationsDao.updateEbizRelationoPerations(id,addStatus);
    }


    //查询用户添加公司
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<EbizRelationoPerations> selectAllUserAndCompany(String addStatus) {
        return ebizRelationoPerationsDao.selectAllUserAndCompany(addStatus);
    }



    //查询公司添加用户
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<EbizRelationoPerations> selectALLCompanyAndUser(String addStatus) {
        return ebizRelationoPerationsDao.selectALLCompanyAndUser(addStatus);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizRelationoPerations queryOneEbizRelationoPerations(Integer id) {
        return ebizRelationoPerationsDao.selectOneEbizRelationoPerations(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizRelationoPerations queryOneUserNameAanCompanyName(String userName, String companyName) {
        return ebizRelationoPerationsDao.selectOneUserNameAanCompanyName(userName,companyName);
    }
}
