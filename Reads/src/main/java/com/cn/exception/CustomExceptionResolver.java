package com.cn.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class CustomExceptionResolver implements HandlerExceptionResolver {


    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        // 解析出异常类�?
        CustomException customException = null;
        String message = "";
        // 若该异常类型是系统自定义的异常，直接取出异常信息在错误页面展示即可�??
        if(e instanceof CustomException){
            customException = (CustomException)e;
            customException.getThrowable().getClass().getName();
        }else{
            // 如果不是系统自定义异常，构�?�一个系统自定义的异常类型，信息为�?�未知错误�??
            customException = new CustomException("未知错误");
            message = customException.getMessage();
        }
        //错误信息
        ModelAndView modelAndView = new ModelAndView();
        //将错误信息传到页�?
        modelAndView.addObject("message",message);
        //指向错误页面
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
