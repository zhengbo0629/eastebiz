package com.eastebiz.dao.controller;


import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizRelationoPerations;
import com.eastebiz.entity.EbizStatus;
import com.eastebiz.entity.EbizUser;
import com.eastebiz.service.EbizCompanyService;
import com.eastebiz.service.EbizRelationoPerationsSevice;
import com.eastebiz.service.EbizStatusService;
import com.eastebiz.service.EbizUserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/EbizStatus")
public class EbizStatusController {

    @Autowired
    private EbizStatusService ebizStatusService;

    @Autowired
    private EbizCompanyService ebizCompanyService;

    @Autowired
    private EbizUserSevice ebizUserSevice;

    @Autowired
    private EbizRelationoPerationsSevice ebizRelationoPerationsSevice;



    //用户添加公司
    @RequestMapping("/userAddCompany")
    @ResponseBody
    public void userAddCompany(Integer id,HttpSession session){

        EbizRelationoPerations ebizRelationoPerations = ebizRelationoPerationsSevice.queryOneEbizRelationoPerations(id);
        String companyName = ebizRelationoPerations.getCompanyName();


        //获取公司数据
        EbizCompany ebizCompany = ebizCompanyService.queryOneCompanyName(companyName);

        Integer cId = ebizCompany.getId();

        //获取用户
        EbizUser ebizUser =(EbizUser) session.getAttribute("EbizUser");
        Integer uId = ebizUser.getId();

        //给激活状态
        String  status ="Active";

        //获取ebizStatus对象
        EbizStatus ebizStatus = new EbizStatus();
        ebizStatus.setCompanyId(cId);
        ebizStatus.setUserId(uId);
        ebizStatus.setStatus(status);
        //调用方法
        ebizStatusService.addEbizStatus(ebizStatus);

        //修改表里面是数据
        String  addStatus="delete";
        ebizRelationoPerationsSevice.updateEbizRelationoPerations(id, addStatus);
    }


    //公司添加用户
    @RequestMapping("/companyAddUser")
    @ResponseBody
    public void companyAddUser(Integer id,HttpSession session){

        EbizRelationoPerations ebizRelationoPerations = ebizRelationoPerationsSevice.queryOneEbizRelationoPerations(id);
        String userName = ebizRelationoPerations.getUserName();

        //获取用户ID
        EbizUser ebizUser = ebizUserSevice.queryOneUerName(userName);
        Integer uId = ebizUser.getId();

        //获取公司ID
        EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
        Integer cId = ebizCompany.getId();

        //给激活状态
        String  status ="Active";


        //获取ebizStatus对象
        EbizStatus ebizStatus = new EbizStatus();
        ebizStatus.setCompanyId(cId);
        ebizStatus.setUserId(uId);
        ebizStatus.setStatus(status);
        //调用方法
        ebizStatusService.addEbizStatus(ebizStatus);

        //修改表里面是数据
        String  addStatus="delete";
        ebizRelationoPerationsSevice.updateEbizRelationoPerations(id, addStatus);
    }



    //查询一个ID
    @RequestMapping("/queryOneEbizStatus")
    @ResponseBody
    public void queryOneEbizStatus(Integer id,HttpSession session){
        EbizStatus ebizStatus = ebizStatusService.selectOneEbizUser(id);
        session.setAttribute("EbizStatus",ebizStatus);

    }

    //公司修改用户状态
    @RequestMapping("/updateEbizStatus")
    public String updateEbizStatus(EbizStatus ebizStatus){
        ebizStatusService.updateEbizStatus(ebizStatus);
        return "redirect:/company/queryAllUser.jsp";
    }

    //用户查询已经激活
    @RequestMapping("/queryALLActiveEbizCompany")
    @ResponseBody
    public List<EbizStatus> queryALLActiveEbizCompany(HttpSession session){
        //获取用户的ID
        EbizUser ebizUser =(EbizUser) session.getAttribute("EbizUser");
        Integer id = ebizUser.getId();
        String  status="Active";
        List<EbizStatus> ebizStatuss = ebizStatusService.queryALLActiveEbizCompany(id, status);
        return ebizStatuss;
    }

    //用户查询添加未激活
    @RequestMapping("/queryAddUnActiveEbizCompany")
    @ResponseBody
    public List<EbizStatus> queryAddUnActiveEbizCompany(HttpSession session){
        EbizUser ebizUser =(EbizUser) session.getAttribute("EbizUser");
        Integer id = ebizUser.getId();
        String  status="AddUnActive";
        return ebizStatusService.queryAddUnActiveEbizCompany(id, status);
    }

    //公司查询所有护士
    @RequestMapping("/queryAllEbizUser")
    @ResponseBody
    public List<EbizStatus> queryAllEbizUser(HttpSession session){
        EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
        Integer id = ebizCompany.getId();
        List<EbizStatus> ebizStatusess = ebizStatusService.queryAllEbizUser(id);
        return ebizStatusess;
    }


    //查询一个公司信息  用户后续操作(跳转)

    @RequestMapping("/queryEbizCompany")
    @ResponseBody
    public void queryEbizCompany(Integer id,HttpSession session){

        //接受页面参数查询一个一个公司 信息
        EbizStatus ebizStatus = ebizStatusService.selectOneEbizCompany(id);
        Integer companyId = ebizStatus.getCompanyId();

        //获取信息然后存入session中
        EbizCompany ebizCompany = ebizCompanyService.selectOneEbizCompany(companyId);
        session.setAttribute("EbizCompany",ebizCompany);
    }



}
