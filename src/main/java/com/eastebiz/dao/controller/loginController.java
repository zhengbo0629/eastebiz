package com.eastebiz.dao.controller;

import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizUser;
import com.eastebiz.service.EbizCompanyService;
import com.eastebiz.service.EbizUserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/login")
public class loginController {

    @Autowired
    private EbizUserSevice ebizUserSevice;
    @Autowired
    private EbizCompanyService ebizCompanyService;

    //所有的登陆方法
    @RequestMapping("/Login")
    public String Login(String name, String password, HttpSession session) {

        EbizUser ebizUser = ebizUserSevice.loginEbizUser(name, password);
        Integer ebizUserId = ebizUser.getId();
        ebizUserSevice.updateTime(ebizUserId, new java.util.Date());
        if (ebizUser != null) {
            String userType = ebizUser.getUserType();
            String status = ebizUser.getStatus();
            //管理员
            if (userType.equals("admin")) {
                Date date = new Date();
                session.setAttribute("EbizUser", ebizUser);
                return "redirect:/admin/queryAllCompany.jsp";
                //主账号
            } else if (userType.equals("doctor") && status.equals("Active")) {
                EbizCompany ebizCompany = ebizCompanyService.queryOneOwerName(name);
                //把用户存进session
                session.setAttribute("EbizCompany", ebizCompany);
                //修改时间
                Integer id = ebizCompany.getId();
                ebizCompanyService.amendAndUpdateTime(id, new java.util.Date());
                return "redirect:/main/main.jsp";
                //独立账号
            } else if (userType.equals("SelfEmployedDoctor") && status.equals("Active")) {
                EbizCompany ebizCompany = ebizCompanyService.queryOneOwerName(name);
                //把用户存进session
                session.setAttribute("EbizCompany", ebizCompany);
                //修改时间
                Integer id = ebizCompany.getId();
                ebizCompanyService.amendAndUpdateTime(id, new java.util.Date());
                return "redirect:/main/main2.jsp";

            } else if (userType.equals("nurse") && status.equals("Active")) {
                session.setAttribute("EbizUser", ebizUser);
                Integer comanyId = ebizUser.getEbizCompany().getId();
                EbizCompany ebizCompany = ebizCompanyService.selectOneEbizCompany(comanyId);
                session.setAttribute("EbizCompany", ebizCompany);

                return "redirect:/jurisdiction/userMain1.jsp";
            } else {
                return "redirect:/homepage/login.jsp";
            }
        } else {
            return "redirect:/homepage/login.jsp";
        }
    }
}
