package com.eastebiz.configuration;


import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.*;

import java.util.List;


/*
*   拦截器添加被拦截的
*/
@SpringBootConfiguration
public class Interceptor extends WebMvcConfigurerAdapter {

    //重写   addInterceptors 方法
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(new InterceptorController())
                //参数为数组
                .addPathPatterns("/EbizCompany/amendEbizCompany","/EbizCompany/amendUserManual","/packageList*","/Product/*");
    }

}
