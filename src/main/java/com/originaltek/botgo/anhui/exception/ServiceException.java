package com.originaltek.botgo.anhui.exception;

import lombok.Getter;

@Getter
public class ServiceException extends RuntimeException {

    /**
     * 错误码
     */
    private Integer code;

    public ServiceException() {
        super();
    }

    public ServiceException(String message, Integer code) {
        super(message);
        this.code = code;
    }

    public ServiceException(String message, Throwable cause, Integer code) {
        super(message, cause);
        this.code = code;
    }


}
