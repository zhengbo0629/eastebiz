package com.eastebiz.dao.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/DropOut")
public class dropOutController {
    //退出
    @RequestMapping("/dropOut")
    public String dropOut(HttpSession session){
        //  公司  和  用户的退出 删除Session

        session.removeAttribute("EbizCompany");
        session.removeAttribute("EbizUser");
        return "redirect:/homepage/homepage.jsp";
    }

}
