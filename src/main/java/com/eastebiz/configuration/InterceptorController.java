package com.eastebiz.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eastebiz.entity.EbizCompany;
import com.eastebiz.entity.EbizUser;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Component
public class InterceptorController implements HandlerInterceptor{
	
	
	// 在控制前执行前执行
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
				Object arg2) throws Exception {
				//request 获取session
			HttpSession session = request.getSession();
			//从session中获取对象
			EbizCompany ebizCompany =(EbizCompany) session.getAttribute("EbizCompany");
			EbizUser ebizUser = (EbizUser) session.getAttribute("EbizUser");
			if(ebizCompany!=null || ebizUser !=null){
				//存在就通过
				return true;
			}else{
				//不存在返回登陆页面
				response.sendRedirect(request.getContextPath()+"/eastebiz/homepage/homepage.jsp");
				return false;
			}
		}
	
	// 在控制前执行 返回视图前执行
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	// 在控制前执行 后执行
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
