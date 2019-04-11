package com.eastebiz.dao.controller;


import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizRelationoPerations;
import com.eastebiz.entity.EbizUser;
import com.eastebiz.service.EbizRelationoPerationsSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/EbizRelationo")
public class EbizRelationoController {

    @Autowired
    private EbizRelationoPerationsSevice ebizRelationoPerationsSevice;




    //用户添加公司
    @RequestMapping("/userAddEbizRelationoPerations")
    public String userAddEbizRelationoPerations(HttpSession session, EbizRelationoPerations ebizRelationoPerations){
        EbizUser ebizUser =(EbizUser) session.getAttribute("EbizUser");
        String userName = ebizUser.getUserName();

        ebizRelationoPerations.setUserName(userName);
        ebizRelationoPerationsSevice.insertEbizRelationoPerations(ebizRelationoPerations);
        return "redirect:/user/userMain.jsp";
    }


    //公司添加用户
    @RequestMapping("/EbizCompanyAddEbizRelationoPerations")
    public String EbizCompanyAddEbizRelationoPerations(HttpSession session, EbizRelationoPerations ebizRelationoPerations){
        EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
        String companyName = ebizCompany.getCompanyName();

        ebizRelationoPerations.setCompanyName(companyName);
        ebizRelationoPerationsSevice.insertEbizRelationoPerations(ebizRelationoPerations);
        return "redirect:/company/queryAllUser.jsp";
    }

    //修改
    @RequestMapping("/updateEbizRelationoPerations")
    @ResponseBody
    public void updateEbizRelationoPerations(Integer id){
        String  addStatus="delete";
        ebizRelationoPerationsSevice.updateEbizRelationoPerations(id, addStatus);
    }

    //查询用户添加公司操作
    @RequestMapping("/queryAllUserAndCompany")
    @ResponseBody
    public List<EbizRelationoPerations> queryAllUserAndCompany(){
        String addStatus = "UserAndCompany";
        return ebizRelationoPerationsSevice.selectAllUserAndCompany(addStatus);
    }

    //查询公司添加用户操作
    @RequestMapping("/queryALLCompanyAndUser")
    @ResponseBody
    public List<EbizRelationoPerations> queryALLCompanyAndUser(){
        String addStatus = "CompanyAndUser";
        return ebizRelationoPerationsSevice.selectALLCompanyAndUser(addStatus);
    }


    //使用用户名字去看是否已经添加过
    @RequestMapping("/queryOneUserName")
    @ResponseBody
    public Integer  queryOneUserName(String userName,HttpSession session){

        EbizCompany ebizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        String companyName = ebizCompany.getCompanyName();
        EbizRelationoPerations ebizRelationoPerations = ebizRelationoPerationsSevice.queryOneUserNameAanCompanyName(userName, companyName);
        if(ebizRelationoPerations==null) {
            return 1;

        }else {
            return 2;
        }
    }

    //使用用户名字去看是否已经添加过
    @RequestMapping("/queryOneCompanyName")
    @ResponseBody
    public Integer  queryOneCompanyName(String companyName,HttpSession session){

        EbizUser ebizUser = (EbizUser) session.getAttribute("EbizUser");
        String userName = ebizUser.getUserName();
        EbizRelationoPerations ebizRelationoPerations = ebizRelationoPerationsSevice.queryOneUserNameAanCompanyName(userName, companyName);
        if(ebizRelationoPerations==null) {
            return 1;

        }else {
            return 2;
        }
    }
}
