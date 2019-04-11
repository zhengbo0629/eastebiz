package com.eastebiz.dao.controller;


import com.eastebiz.entity.EbizUser;
import com.eastebiz.service.EbizUserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/EbizUser")
public class EbizUserController {

    @Autowired
    private EbizUserSevice ebizUserSevice;



    //注册
    @RequestMapping("/registerEbizUser")

    public String registerEbizUser(EbizUser ebizUser,String confirmPassword){
        //两次密码对比
        String password = ebizUser.getPassword();
        if(password.equals(confirmPassword)) {
            //添加注册时间
            Date date = new java.util.Date();
            ebizUser.setCreateTime(date);
            ebizUserSevice.registerEbizUser(ebizUser);
            return "redirect:/user/userLogin.jsp";
        }
        return "redirect:/user/userRegister.jsp";
    }




    //修改
    @RequestMapping("/modifyEbizUser")
    public String modifyEbizUser(EbizUser ebizUser){
        Date date = new Date();

        ebizUser.setUpdateTime(date);


        ebizUserSevice.updateEbizUser(ebizUser);
        return "redirect:/user/userMain.jsp";
    }

    //用户名查询用户是否存在
    @RequestMapping("/queryEbizUser")
    @ResponseBody
    public EbizUser queryEbizUser(String userName){
        EbizUser ebizUser = ebizUserSevice.queryOneUerName(userName);
        return ebizUser;
    }


    //查询地址
    @RequestMapping("/selectAddress")
    @ResponseBody
    public EbizUser selectAddress(HttpSession session){

        EbizUser ebizUser =(EbizUser) session.getAttribute("EbizUser");
        Integer id = ebizUser.getId();
        return ebizUserSevice.selectAddress(id);
    }
}
