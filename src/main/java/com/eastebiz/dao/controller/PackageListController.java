package com.eastebiz.dao.controller;


import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizUser;
import com.eastebiz.entity.PackageList;
import com.eastebiz.service.EbizUserSevice;
import com.eastebiz.service.PackageListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/packageList")
public class PackageListController {

    @Autowired
    private PackageListService packageListService;

    @Autowired
    private EbizUserSevice ebizUserSevice;




    //查看公司所有包裹  包裹管理
    @RequestMapping("/queryAllEbizCompanyAndPackage")
    @ResponseBody
    public List<PackageList> queryAllEbizCompanyAndPackage(HttpSession session){
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        return packageListService.selectAllPackageByCompanyId(companyId);
    }


    //查看所有状态包裹(公司/员工)
    @RequestMapping("/queryAllPackage")
    @ResponseBody
    public List<PackageList> queryAllPackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();
            return packageListService.selectAllPackageByUserId(userId);
        } else {
            return packageListService.selectAllPackageByCompanyId(companyId);
        }


    }

    //未确认
    @RequestMapping("/queryUnComfirmPackage")
    @ResponseBody
    public List<PackageList> queryUnComfirmPackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();
            return packageListService.selectUserUnComfirmPackage(userId);
        } else {
            return packageListService.selectCompanyUnComfirmPackage(companyId);
        }
    }


    //未发货
    @RequestMapping("/queryUnTrackPackage")
    @ResponseBody
    public List<PackageList> queryUnTrackPackageByUserId(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();
            return packageListService.selectUnTrackPackageByUserId(userId);
        } else {
            return packageListService.selectUnTrackPackageByCompanyId(companyId);
        }
    }


    //途中
    @RequestMapping("/queryShippedPackage")
    @ResponseBody
    public List<PackageList> queryShippedPackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();

            return packageListService.selectShippedPackageByUserId(userId);
        } else {
            return packageListService.selectShippedPackageByCompanyId(companyId);
        }
    }

    //在家包裹
    @RequestMapping("/queryInstockPackage")
    @ResponseBody
    public List<PackageList> queryInstockPackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();
            return packageListService.selectInstockPackageByUserId(userId);
        } else {
            return packageListService.selectInstockPackageByCompanyId(companyId);
        }
    }

    //待结算
    @RequestMapping("/queryUnPaiedPackage")
    @ResponseBody
    public List<PackageList> queryUnPaiedPackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();

            return packageListService.selectUnPaiedPackageByUserId(userId);
        } else {
            return packageListService.selectUnPaiedPackageByCompanyId(companyId);
        }
    }

    //已结算
    @RequestMapping("/queryPaiedPackage")
    @ResponseBody
    public List<PackageList> queryPaiedPackageB(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();
            return packageListService.selectPaiedPackageByUserId(userId);
        } else {
            return packageListService.selectPaiedPackageByCompanyId(companyId);
        }
    }


    //邮寄完成
    @RequestMapping("/queryShippedCompletePackage")
    @ResponseBody
    public List<PackageList> queryShippedCompletePackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();
            return packageListService.selectShippedCompletePackageByUserId(userId);
        } else {
            return packageListService.selectShippedCompletePackageByCompanyId(companyId);
        }
    }


    //不匹配
    @RequestMapping("/queryUnMatchPackage")
    @ResponseBody
    public List<PackageList> queryUnMatchPackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && companyId != null) {
            Integer userId = EbizUser.getId();

            return packageListService.selectUnMatchPackageByUserId(userId);
        } else {
            return packageListService.selectUnMatchPackageByCompanyId(companyId);
        }
    }


    //领票操作
    @RequestMapping("/reportPackage")

    public String reportPackage(PackageList packageList) {

        packageListService.insertPackage(packageList);
        return "redirect:/package/reportPackage.jsp";
    }




    //修改未确认或未发货包裹信息

    //1.查询出要修改的包裹信息
    @RequestMapping("/queryPackageMessage")
    public String queryPackageMessage(Integer id, HttpSession session) {
        //调业务方法
        PackageList packageList = packageListService.selectOnePackageByid(id);
        session.setAttribute("PackageList", packageList);
        return "redirect:/package/editPackageByDoctor.jsp";
    }

    //1.1查询出要修改的包裹信息 用于发邮箱
    @RequestMapping("/queryPackageEamil")
    public String queryPackageEamil(Integer id, HttpSession session) {
        //调业务方法
        PackageList packageList = packageListService.selectOnePackageByid(id);
        session.setAttribute("PackageList", packageList);

        //查询用户邮箱
        String userName = packageList.getUserName();
        EbizUser ebizUser = ebizUserSevice.queryOneUerName(userName);
        String email = ebizUser.getEmail();
        session.setAttribute("Email",email);

        return "redirect:/Eamil/sendEmailToUser.jsp";
    }


    //2..1修改页面上包裹信息
    @RequestMapping("/amendPackageMessage")
    public String amendPackageMessage(PackageList packageList, HttpSession session) {
        //调业务方法
        packageListService.updatePackage(packageList);
        return "redirect:/product/queryAllPackForCompany.jsp";
    }

    //2.2 填写trackingnumber 修改 状态为途中  同时跳转至途中包裹页面
    //将未发货UnShipped 包裹  改为途中shipped
    @RequestMapping("/amendShippedPackage")

    public String amendShippedPackage(HttpSession session) {
        PackageList packageList = (PackageList) session.getAttribute("PackageList");

        packageListService.updateShippedStatus(packageList.getId());
        return "途中包裹页面";
    }


    /*医生对单  */

    //查看所有未对单包裹
    @RequestMapping("/queryAllUnCheckPackage")
    @ResponseBody
    public List<PackageList> queryAllUnCheckPackage(HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer companyId = EbizCompany.getId();

        return packageListService.selectAllUnCheckPackage(companyId);
    }

    //领取任务(批量) 改变包裹checkStatus 为正在对单checking
    //不进行页面跳转    只刷新当前页面
    @RequestMapping("/updateCheckingStatusPackage")
    @ResponseBody
    public void updateCheckingStatusPackage(int[] ids,HttpSession session) {
        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        String owerName = EbizCompany.getOwerName();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if(EbizUser != null && owerName != null){
            String userName = EbizUser.getUserName();
            packageListService.updateCheckingStatusBatch(ids,userName);
        }else {
            packageListService.updateCheckingStatusBatch(ids,owerName);
        }


    }

    // 3.查看取任务(通过当前用户名字) 并 跳转至查询所有已领取页面
    @RequestMapping("/queryCheckedStatusPackage")
    @ResponseBody
    public List<PackageList> queryCheckedStatusPackage(HttpSession session) {

        EbizCompany EbizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        String owerName = EbizCompany.getOwerName();
        EbizUser EbizUser = (EbizUser) session.getAttribute("EbizUser");
        if (EbizUser != null && owerName != null) {
            String userName = EbizUser.getUserName();
            List<PackageList> packageLists = packageListService.selectCheckingStatus(userName);
            return packageLists;
        } else {
            List<PackageList> packageLists = packageListService.selectCheckingStatus(owerName);
            return packageLists;
        }

    }

    //批量取消
    @RequestMapping("/amendUnCheckedStatusPackage")
    public String amendUnCheckedStatusPackage(int[] ids){
        packageListService.updateUnCheckStatusBatch(ids);
        return "redirect:/package/allCurrentCheckingTasksForUser.jsp";
    }


    //4.更新包裹状态

    @RequestMapping("/amendPackageStatus")
    public String amendPackageStatus( String status,int[] ids) {

       packageListService.updateStatusBatch(status,ids);
        return "redirect:/package/allCurrentCheckingTasksForUser.jsp";
    }

    ;

    // 5查看当前用户对单已完成任务
    @RequestMapping("/queryCheckedStatus")
    @ResponseBody
    public List<PackageList> queryCheckedStatus(HttpSession session) {
        EbizUser ebizUser = (EbizUser) session.getAttribute("EbizUser");
        List<PackageList> lists = packageListService.selectCheckingStatus(ebizUser.getUserName());
        return lists;
    }

    ;

    /*发label*/
    //点击发label 查询所有未发label页面Integer companyId
    @RequestMapping("/queryAllUnSendLabelPackage")
    @ResponseBody
    public List<PackageList> queryAllUnSendLabelPackage(HttpSession session) {
        EbizCompany ebizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        return packageListService.selectAllUnSendLabelPackage(ebizCompany.getId());

    }

    //领取用户发label 改变用户labelStatus    SendingLabel
    @RequestMapping("/updateSendingLabelStatusPackage")
    @ResponseBody//刷新所有未发label页面
    public String updateSendingLabelStatusPackage(Integer[] ids) {


        return "当前所有未发label页面";
    }

    //已领取任务的label
    @RequestMapping("/querySendingLabelStatusPackage")
    @ResponseBody
    public List<PackageList> querySendingLabelStatusPackage(HttpSession session) {
        EbizCompany ebizCompany = (EbizCompany) session.getAttribute("EbizCompany");

        return packageListService.selectSendingLabel(ebizCompany.getOwerName());//参数是labeler
    }

    //发送label   邮件接口


    //查询已发label的任务
    @RequestMapping("/querySendedLabelStatusPackage")
    @ResponseBody
    public List<PackageList> querySendedLabelStatusPackage(HttpSession session) {
        EbizCompany ebizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        return packageListService.selectSendedLabel(ebizCompany.getOwerName());
    }

}
