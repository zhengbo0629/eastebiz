package com.eastebiz.dao.controller;

import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizUser;
import com.eastebiz.service.EbizCompanyService;
import com.eastebiz.service.EbizStatusService;
import com.eastebiz.service.EbizUserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/Register")
public class RegisterController {

    @Autowired
    private EbizUserSevice ebizUserSevice;

    @Autowired
    private EbizCompanyService ebizCompanyService;

    @Autowired
    private EbizStatusService ebizStatusService;



    //主账号注册
    @RequestMapping("/registerCompany")
    public String registerCompany(EbizUser ebizUser,String companyName, HttpSession session){

        //添加属性
        String userType="doctor";
        ebizUser.setUserType(userType);
        ebizUser.setStatus("Active");
        //创建时间
        Date createTime = new Date();
        ebizUser.setCreateTime(createTime);
        //调方法
        ebizUserSevice.registerEbizUser(ebizUser);

        String owerName = ebizUser.getUserName();
        EbizCompany ebizCompany = new EbizCompany(companyName, owerName,createTime);
        //创建公司
        ebizCompanyService.registerEbizCompany(ebizCompany);
        return "redirect:/homepage/login.jsp";
    }

    //注册独立用户
    @RequestMapping("/registerIndependentUser")
    public String registerIndependentUser(EbizUser ebizUser,String companyName, HttpSession session){

        //添加属性
        String userType="SelfEmployedDoctor";
        ebizUser.setUserType(userType);
        ebizUser.setStatus("Active");
        //创建时间
        Date createTime = new Date();
        ebizUser.setCreateTime(createTime);
        //调方法
        ebizUserSevice.registerEbizUser(ebizUser);

        String owerName = ebizUser.getUserName();
        EbizCompany ebizCompany = new EbizCompany(companyName, owerName,createTime);
        //创建公司
        ebizCompanyService.registerEbizCompany(ebizCompany);
        return "redirect:/homepage/login.jsp";
    }

    //子账号注册
    @RequestMapping("/registerNurse")
    public String registerNurse(EbizUser ebizUser,String companyName){

        String userType="nurse";
        ebizUser.setUserType(userType);
        //创建时间
        Date createTime = new Date();
        ebizUser.setCreateTime(createTime);
        EbizCompany ebizCompany = ebizCompanyService.queryOneCompanyName(companyName);
        //建立关系属性
        Integer id = ebizCompany.getId();
        ebizUser.setEbizCompany(new EbizCompany(id));
        //调方法
        ebizUserSevice.registerEbizUser(ebizUser);
        return "redirect:/homepage/login.jsp";
    }

}
