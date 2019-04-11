package com.eastebiz.service.impl;

import com.eastebiz.dao.PackageListDao;
import com.eastebiz.entity.PackageList;
import com.eastebiz.service.PackageListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("packageListService")
@Transactional
public class PackageListServiceImpl implements PackageListService {

    @Autowired
    private  PackageListDao  packageListDao;
    //查询医生所有包裹
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectAllPackageByCompanyId(Integer companyId) {
        return packageListDao.selectAllPackageByCompanyId(companyId);
    }
    //查询护士所有包裹
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectAllPackageByUserId(Integer userId) {
        return  packageListDao.selectAllPackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectCompanyUnComfirmPackage(Integer companyId) {
        return packageListDao.selectCompanyUnComfirmPackage(companyId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUserUnComfirmPackage(Integer userId) {
        return packageListDao.selectUserUnComfirmPackage(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUnTrackPackageByUserId(Integer userId) {
        return packageListDao.selectUnTrackPackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUnTrackPackageByCompanyId(Integer companyId) {
        return packageListDao.selectUnTrackPackageByCompanyId(companyId);
    }
    //途中
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectShippedPackageByUserId(Integer userId) {
        return packageListDao.selectShippedPackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectShippedPackageByCompanyId(Integer companyId) {
        return packageListDao.selectShippedPackageByCompanyId(companyId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectInstockPackageByUserId(Integer userId) {
        return packageListDao.selectInstockPackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectInstockPackageByCompanyId(Integer companyId) {
        return packageListDao.selectInstockPackageByCompanyId(companyId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUnPaiedPackageByUserId(Integer userId) {
        return packageListDao.selectUnPaiedPackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUnPaiedPackageByCompanyId(Integer companyId) {
        return packageListDao.selectUnPaiedPackageByCompanyId(companyId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectPaiedPackageByUserId(Integer userId) {
        return packageListDao.selectPaiedPackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectPaiedPackageByCompanyId(Integer companyId) {
        return packageListDao.selectPaiedPackageByCompanyId(companyId);
    }
    //邮寄完成
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectShippedCompletePackageByUserId(Integer userId) {
        return  packageListDao.selectShippedCompletePackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectShippedCompletePackageByCompanyId(Integer companyId) {
        return packageListDao.selectShippedCompletePackageByCompanyId(companyId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUnMatchPackageByUserId(Integer userId) {
        return packageListDao.selectUnMatchPackageByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUnMatchPackageByCompanyId(Integer companyId) {
        return packageListDao.selectUnMatchPackageByCompanyId(companyId);
    }

    @Override
    public void insertPackage(PackageList packageList) {
        packageListDao.insertPackage(packageList);
    }
    //查询一个
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PackageList selectOnePackageByid(Integer id) {

        return packageListDao.selectOneByid(id);
    }
    //修改包裹信息
    @Override
    public void updatePackage(PackageList packageList)
    {
        packageListDao.updatePackage(packageList);
    }

    @Override
    public void updateDeleteStatus(Integer id) {
        packageListDao.updateDeleteStatus(id);
    }

    @Override
    public void updateShippedStatus(Integer id) {
        packageListDao.updateShippedStatus(id);
    }


    @Override
    public void updateHomeStatus(Integer id) {
        packageListDao.updateHomeStatus(id);
    }

    @Override
    public void updateShippedCompleteStatus(Integer id) {
        packageListDao.updateShippedCompleteStatus(id);
    }

    @Override
    public void updateUnPaiedStatus(Integer id) {
            packageListDao.updatePaiedStatus(id);
    }

    @Override
    public void updatePayingStatus(Integer id) {
        packageListDao.updatePayingStatus(id);
    }

    @Override
    public void updatePaiedStatus(Integer id) {
                packageListDao.updatePaiedStatus(id);
    }

    @Override
    public void updateComplete(Integer id) {
            packageListDao.updateComplete(id);
    }
/*医生对单*/
    @Override//查看所有未对单包裹
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectAllUnCheckPackage(Integer companyId) {
        return  packageListDao.selectAllUnCheckPackage(companyId);
    }

   /* @Override//改变包裹checkStatus 为正在对单checking
    public void updateCheckingStatus(Integer id) {
            packageListDao.updateCheckingStatus(id);
    }*/

    @Override//对单批量领取任务
    public void updateCheckingStatusBatch(int[] ids,String checker) {

        packageListDao.updateCheckingStatusBatch(ids,checker);
    }

    // 3.查看已领取任务
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectCheckingStatus(String checker) {
        return packageListDao.selectCheckingStatus(checker);
    }



    @Override//批量取消
    public void updateUnCheckStatusBatch(int[] ids) {
            packageListDao.updateUnCheckStatusBatch(ids);
    }

    //4.更新包裹状态
  /*  public  void  updateStatus(Integer id,String status) {
        packageListDao.updateStatus(id,status);
    }*/

    @Override
    public void updateStatusBatch(String status,int[] ids) {
        packageListDao.updateStatusBatch(status,ids);
    }

    // 5.查看已完成任务
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectCheckedStatus(String checker) {
        return packageListDao.selectCheckedStatus(checker);
    }

    /*发label*/

    @Override//1.查询出所有未发label 的包裹
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectAllUnSendLabelPackage(Integer companyId) {
        return packageListDao.selectAllUnSendLabelPackage(companyId);
    }



    @Override//2.批量领取包裹  改变包裹labelStatus
    public void updateSendingLabelStatusBatch(Integer[] ids) {
        packageListDao.updateSendingLabelStatusBatch(ids);
    }



    //3.查看已领取正在发label 的包裹
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectSendingLabel(String labeler) {
        return packageListDao.selectSendingLabel(labeler);
    }

   //批量取消
    @Override
    public void updateUnSendLabelStatusBatch(Integer[] ids) {
packageListDao.updateUnSendLabelStatusBatch(ids);
    }

    //4.更新  发邮件

    //5.查看已发送完label的包裹
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectSendedLabel(String labeler) {
        return packageListDao.selectSendedLabel(labeler);
    }

    //更新包裹信息  未确认和未发货
    //先查询 公司的
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectCompanyUnComfirmAndUnShipped(Integer companyId) {
        return packageListDao.selectCompanyUnComfirmAndUnShipped(companyId);
    }
    //用户的
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUserUnComfirmAndUnShipped(Integer userId) {
        return packageListDao.selectUserUnComfirmAndUnShipped(userId);
    }
    //更新trackingnumber  只能修改 tracking 和信用卡信息
    //先查出来,只有用户的  判断trackingnumber不为空
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectTrackingNumberPackage(Integer userId) {
        return packageListDao.selectTrackingNumberPackage(userId);
    }
    //修改按钮   只能修改 tracking 和信用卡信息  调用上面的updatePackage

   //更改信用卡信息
    //先查用户所有未支付的包裹
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectAllUnPaiedPackage(Integer userId) {
        return packageListDao.selectAllUnPaiedPackage(userId);
    }
    //修改信用卡信息
    @Override
    public void updateCreaditCard(Integer id, String creaditCard) {
            packageListDao.updateCreaditCard(id,creaditCard);
    }
    //打包包裹:医生发了label    labelStatus=SendedLabel
    //用户
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectUserPackedPackage(Integer userId) {
        return packageListDao.selectUserPackedPackage(userId);
    }
    //公司需打包的包裹
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<PackageList> selectCompanyPackedPackage(Integer companyId) {
        return packageListDao.selectCompanyPackedPackage(companyId);
    }
}
