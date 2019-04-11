package com.eastebiz.service.impl;

import com.eastebiz.dao.EbizStatusDao;
import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizStatus;
import com.eastebiz.entity.EbizUser;
import com.eastebiz.service.EbizStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("ebizStatusService")
@Transactional
public class EbizStatusServiceImpl  implements EbizStatusService {

    @Autowired
    private EbizStatusDao ebizStatusDao;


    @Override
    public void addEbizStatus(EbizStatus ebizStatus) {
        ebizStatusDao.insertEbizStatus(ebizStatus);
    }

    @Override
    public void updateEbizStatus(EbizStatus ebizStatus) {
        ebizStatusDao.updateEbizStatus(ebizStatus);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<EbizStatus> queryALLActiveEbizCompany(Integer userId, String status) {
        return ebizStatusDao.selectALLActiveEbizCompany(userId, status);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<EbizStatus> queryAddUnActiveEbizCompany(Integer userId, String status) {
        return ebizStatusDao.selectAddUnActiveEbizCompany(userId, status);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<EbizStatus> queryAllEbizUser(Integer companyId) {
        return ebizStatusDao.selectAllEbizUser(companyId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizStatus selectOneEbizUser(Integer id) {
        return ebizStatusDao.selectOneEbizUser(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public EbizStatus selectOneEbizCompany(Integer id) {
        return ebizStatusDao.selectOneEbizCompany(id);
    }
}
