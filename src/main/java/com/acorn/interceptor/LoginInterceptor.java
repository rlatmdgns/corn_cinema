package com.acorn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;


@Log4j


public class LoginInterceptor implements HandlerInterceptor{

	     //하드코딩 방지 
	private final String loginkey = "login";
	   
	public LoginInterceptor() {
		log.info("LoginInterceptor invoked");
	   } //default constructor
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		log.info("LoginInterceptor preHandle() invoked");
		log.info("request : "  + request);
		log.info("response : "  + response);
		log.info("handler : "  + handler);
		log.info("\t SessionID:" + request.getSession().getId());
		log.info("RequestURI : " + request.getRequestURI() );
        log.info("----------------------------------------------------------------------------");
       
        //이미 세션 영영에 지정된 키의 속성객체가 존재한다면,
        //이 속성객체를 세션영역에서 제거.       
        HttpSession session = request.getSession();
        if(session.getAttribute(loginkey) !=null ) {
        	  System.out.println("loginkey" + loginkey); // 세션 제거전 log
        	  
              System.out.println("세션 제거 !!");
              
        	  session.removeAttribute(loginkey); 
        	  System.out.println("loginkey : "+ loginkey); //세션 제거후 log
        
        }    
        System.out.println("preHandle NEXT !!");
       return true; // true = NEXT 로 이동!	
	} //preHandle

	
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			ModelAndView modelAndView)
				throws Exception {
		
		log.info("LoginInterceptor postHandle() invoked");
		log.info("request : "  + request);
		log.info("response : "  + response);
		log.info("handler : "  + handler);
		log.info("\t SessionID:" + request.getSession().getId());
		log.info("\t SessionID:" + request.getSession());
		log.info("modelAndView :" + modelAndView );
	
		
        //기존에 생성된 세션 객체가 있으면 변환하고 , 없으면 새로이 세션 객체를만들어서 반환
		HttpSession session = request.getSession();
	 	 log.info("session : "  +  session);
		
		// ModelAndView 객체를 이용하여 세션 스코프에 속성지정 
		ModelMap modelMap = modelAndView.getModelMap();

		Object userVO = modelMap.get("userVO");
		
		 log.info("modelMap : " + modelMap);	
		 log.info("userVO: " + userVO);
		
		  if(userVO !=null)  {

		session.setAttribute(loginkey, userVO); //	★세션 스코프에 공유
		  
	     log.info("loginkey: "  +  loginkey);
	     log.info("userVO:  " + userVO);

	    Object orignalRequestURI = session.getAttribute("originalURIkey");
	       
	     log.info("orignalRequestURI : "  + orignalRequestURI );
	      
	         //가려고 하는 페이지가 있으면 "orignalRequestURI" 로 이동 // 아니면 "/" 로 이동 
	     response.sendRedirect(orignalRequestURI!= null ? (String)orignalRequestURI :"/" ); 
		
		  } //if
	     
	} //postHandle

	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			Exception ex)
			throws Exception {
	                       ;;
	}//afterCompletion

	
} //end class
