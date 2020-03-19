package com.originaltek.botgo.anhui.filter;


import com.originaltek.botgo.anhui.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.*;

@Slf4j
public class ReturnFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {
        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (ServiceException e) {
            log.error(String.format("异常信息：%s, 异常码：%d", e.getMessage(), e.getCode()), e);
            //TODO 处理错误返回对象
        } catch (Throwable t) {
            log.error(String.format("异常信息：%s", t.getMessage()), t);
            //TODO 处理错误返回对象
        }
    }

    @Override
    public void destroy() {

    }

}
