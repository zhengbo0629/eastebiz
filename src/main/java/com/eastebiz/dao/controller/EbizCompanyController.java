package com.eastebiz.dao.controller;


import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.Product;
import com.eastebiz.service.EbizCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/EbizCompany")
public class EbizCompanyController {

    @Autowired
    private EbizCompanyService ebizCompanyService;


    /*
    //注册
    @RequestMapping("/registerEbizCompany")

    public String registerEbizCompany(EbizCompany ebizCompany,String confirmPassword){
        //两次密码对比
        String password = ebizCompany.getPassword();
        if(password.equals(confirmPassword)) {
            //添加注册时间
            Date date = new java.util.Date();
            ebizCompany.setCreateTime(date);
            ebizCompanyService.registerEbizCompany(ebizCompany);
            return "redirect:/company/companyLogin.jsp";
        }
        return "redirect:/company/companyRegister.jsp";
    }*/

    //查询公司名称是否存在
    @RequestMapping("/queryOneCompanyName")
    @ResponseBody
    public EbizCompany queryOneCompanyName(String companyName){
        EbizCompany ebizCompany = ebizCompanyService.queryOneCompanyName(companyName);

        return ebizCompany;

    }

    @RequestMapping("/queryOneOwerName")
    @ResponseBody
    //查询医生名称是否存在
    public EbizCompany queryOneOwerName(String owerName){
        EbizCompany ebizCompany = ebizCompanyService.queryOneOwerName(owerName);
        return ebizCompany;
    }

    @RequestMapping("/amendEbizCompany")
    //修改信息
    public String amendEbizCompany(EbizCompany ebizCompany){
        ebizCompanyService.amendEbizCompany(ebizCompany);
        return "redirect:/main/main.jsp";
    }

    @RequestMapping("/amendUserManual")
    //添加公司手册（是一个根据ID修改）
    public String  amendUserManual(String userManual,HttpSession session){
        //从登陆用户的session中取出ID
        EbizCompany ebizCompany = (EbizCompany) session.getAttribute("EbizCompany");
        Integer id = ebizCompany.getId();
        ebizCompanyService.amendUserManual(id, userManual);
        ebizCompany.setUserManual(userManual);
        session.setAttribute("EbizCompany",ebizCompany);
        return "redirect:/company/companyAccountSetting.jsp";
    }

    //修改地址、邮箱、电话
    @RequestMapping("/amendAddressAndEmailAndphoneNumber")
    public String amendAddressAndEmailAndphoneNumber(EbizCompany ebizCompany,HttpSession session){
        ebizCompanyService.amendAddressAndEmailAndphoneNumber(ebizCompany);
        EbizCompany newEbizCompany =(EbizCompany) session.getAttribute("EbizCompany");

        newEbizCompany.setEmail(ebizCompany.getEmail());
        newEbizCompany.setAddress1Name(ebizCompany.getAddress1Name());
        newEbizCompany.setAddress1Value(ebizCompany.getAddress1Value());
        newEbizCompany.setAddress2Name(ebizCompany.getAddress2Name());
        newEbizCompany.setAddress2Value(ebizCompany.getAddress2Value());
        newEbizCompany.setAddress3Name(ebizCompany.getAddress3Name());
        newEbizCompany.setAddress3Value(ebizCompany.getAddress3Value());
        newEbizCompany.setPhoneNumber(ebizCompany.getPhoneNumber());

        session.setAttribute("EbizCompany",newEbizCompany);
        return "redirect:/company/companyAccountSetting.jsp";
    }



    //查询 地址1
    @RequestMapping("/selectAddress1")
    @ResponseBody
    public String selectAddress1(HttpSession session){
        Product newProduct =(Product) session.getAttribute("newProduct");
        Integer id = newProduct.getEbizCompany().getId();
        return ebizCompanyService.selectAddress1(id);

    }

    //查询 地址2
    @RequestMapping("/selectAddress2")
    @ResponseBody
    public String selectAddress2(HttpSession session){
        Product newProduct =(Product) session.getAttribute("newProduct");
        Integer id = newProduct.getEbizCompany().getId();
        return ebizCompanyService.selectAddress2(id);
    }
    //查询 地址3
    @RequestMapping("/selectAddress3")
    @ResponseBody
    public String selectAddress3(HttpSession session){
        Product newProduct =(Product) session.getAttribute("newProduct");
        Integer id = newProduct.getEbizCompany().getId();
        return ebizCompanyService.selectAddress3(id);
    }

    //查询所有公司
    @RequestMapping("/selectAllCompany")
    @ResponseBody
    public List<EbizCompany> selectAllCompany(){
        return     ebizCompanyService.selectAllCompany();

    }

    //查询一个公司
    @RequestMapping("/queryOneCompany")

    public String queryOneCompany(Integer id,HttpSession session){
        EbizCompany ebizCompany = ebizCompanyService.selectOneEbizCompany(id);
        session.setAttribute("EbizCompany",ebizCompany);
        return "redirect:/admin/updateDoctorUserInfor.jsp";
    }
}
