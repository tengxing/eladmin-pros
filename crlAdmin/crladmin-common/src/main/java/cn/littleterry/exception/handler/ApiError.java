package cn.littleterry.exception.handler;

import lombok.Data;

/**
 * 报错统一返回
 * @author terry
 * @since 2018-11-23
 */
@Data
class ApiError {
    private String message;

    private boolean success = false;

    private Integer code = 500;

    private Object result;

    private long timestamp = System.currentTimeMillis();


    private ApiError() {
    }

    public ApiError(Integer code,String message) {
        this();
        this.code = code;
        this.message = message;
    }
}


