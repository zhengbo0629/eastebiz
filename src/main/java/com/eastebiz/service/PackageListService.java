package com.eastebiz.service;

import com.eastebiz.entity.PackageList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PackageListService {

    //根据当前登录用户id查询所有包裹
    public List<PackageList> selectAllPackageByUserId(Integer userId);
    //根据当前登录医生(公司)id查询所有包裹
    public  List<PackageList> selectAllPackageByCompanyId(Integer companyId);

    //未确认 包裹   医生名下
    public  List<PackageList> selectCompanyUnComfirmPackage(Integer companyId);
    //未确认 包裹   护士用户名下
    public  List<PackageList> selectUserUnComfirmPackage(Integer userId);
    //查看未发货状态的包裹  用户id
    public List<PackageList> selectUnTrackPackageByUserId(Integer userId);
    //查看未发货状态的包裹  公司 医生id
    public List<PackageList> selectUnTrackPackageByCompanyId(Integer companyId);
    //查看途中状态的包裹  用户id
    public List<PackageList> selectShippedPackageByUserId(Integer userId);
    //查看不同状态的包裹  公司 医生id
    public List<PackageList> selectShippedPackageByCompanyId(Integer companyId);
    //查看在家状态的包裹  用户id
    public List<PackageList> selectInstockPackageByUserId(Integer userId);
    //查看不同状态的包裹  公司 医生id
    public List<PackageList> selectInstockPackageByCompanyId(Integer companyId);
    //查看待结算状态的包裹  用户id
    public List<PackageList> selectUnPaiedPackageByUserId(Integer userId);
    //查看待结算状态的包裹  公司 医生id
    public List<PackageList> selectUnPaiedPackageByCompanyId(Integer companyId);
    //查看已结算状态的包裹  用户id
    public List<PackageList> selectPaiedPackageByUserId(Integer userId);
    //查看已结算状态的包裹  公司 医生id
    public List<PackageList> selectPaiedPackageByCompanyId(Integer companyId);
    //查看邮寄完成状态的包裹  用户id
    public List<PackageList> selectShippedCompletePackageByUserId(Integer userId);
    //查看邮寄完成状态的包裹  公司 医生id
    public List<PackageList> selectShippedCompletePackageByCompanyId(Integer companyId);
    //查看不匹配状态的包裹  用户id
    public List<PackageList> selectUnMatchPackageByUserId(Integer userId);
    //查看不匹配状态的包裹  公司 医生id
    public List<PackageList> selectUnMatchPackageByCompanyId(Integer companyId);



    //添加包裹 领票
    public  void  insertPackage(PackageList packageList);

    //未发货未确认包裹


    /*
     * update 按钮   修改
     *   点击按钮先要做一次查询  提交时判断是否被修改为delete*/
    //两个id  这里只需要一个包裹id,公司和护士id已经做完查询了
    public  PackageList  selectOnePackageByid(Integer id);
    public  void updatePackage(PackageList packageList);

    /*
     * delete 按钮   修改包裹状态*/

    //删除包裹 修改 包裹状态 delete
    public  void updateDeleteStatus(Integer id);
    //更新/修改包裹   填写trackingNumber后改变状态为途中包裹
    public void updateShippedStatus(Integer id);
    //更新/修改包裹   将途中包裹改为在家包裹
    public void updateHomeStatus(Integer id);

    //更新/修改包裹   对单完成将途中包裹改为邮寄完成
    public  void  updateShippedCompleteStatus(Integer id);
    //更新/修改包裹   将邮寄完成改为待结算
    public  void  updateUnPaiedStatus(Integer id);
    // 修改状态 正在支付
    public void  updatePayingStatus(Integer id);
    //更新/修改包裹   将待结算改为已结算
    public void  updatePaiedStatus(Integer id);
    //更新/修改包裹   将已结算改为彻底完成
    public  void updateComplete(Integer id);



    /*
     *
     *医生对单*/

    //* 1.查询出所有未对单的包裹
    public  List<PackageList>  selectAllUnCheckPackage(Integer companyId);
    //*   2.领取用户,改变包裹checkStatus   为正在对单
    //public  void  updateCheckingStatus(Integer id);
        //批量领取任务
  public  void updateCheckingStatusBatch(int[] ids,String checker);
    //3查看已领取任务
    public List<PackageList>  selectCheckingStatus(String checker);
    //取消任务 修改状态
   // public void  updateUnCheckStatus(Integer id);
    //批量取消
    public void  updateUnCheckStatusBatch(int[]  ids);
    //4更新包裹状态
    //public  void  updateStatus(Integer id,String status);
    //批量更新包裹状态
    public  void  updateStatusBatch(String status,int[] ids);
    //5查看当前用户对单已完成任务
    public List<PackageList>  selectCheckedStatus(String checker);



    /*

    医生发label*/
    //1.查询出所有未发label 的包裹
    public  List<PackageList> selectAllUnSendLabelPackage(Integer companyId);
    //2.领取用户  改变用户labelStatus
    public  void updateSendingLabelStatusBatch(Integer[] ids);
    //3.查看已领取 正在发label 的包裹
    public List<PackageList>  selectSendingLabel(String labeler);
    //批量取消任务
    public void  updateUnSendLabelStatusBatch(Integer[] ids);
    //4.更新

    //5.查看已发送完label的包裹
    public List<PackageList>  selectSendedLabel(String labeler);


    //更新包裹信息  未确认和未发货
    //先查询 公司的
    public  List<PackageList>  selectCompanyUnComfirmAndUnShipped(Integer companyId);
    //用户的
    public  List<PackageList>  selectUserUnComfirmAndUnShipped(Integer  userId);

    //更新trackingnumber  只能修改 tracking 和信用卡信息
    //先查出来,只有用户的  判断trackingnumber不为空
    public  List<PackageList>  selectTrackingNumberPackage(Integer userId);

    //修改按钮   只能修改 tracking 和信用卡信息  调用上面的updatePackage

    //更改信用卡信息
            //先查用户所有未支付的包裹  mapper已写
    public  List<PackageList>  selectAllUnPaiedPackage(Integer userId);
            //修改信用卡信息
    public  void updateCreaditCard(Integer  id,String creaditCard);

    //打包包裹:医生发了label    labelStatus=SendedLabel
    //用户
    public List<PackageList> selectUserPackedPackage(Integer  userId);
    //公司需打包的包裹
    public List<PackageList> selectCompanyPackedPackage(Integer  companyId);




}
