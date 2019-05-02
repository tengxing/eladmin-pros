package cn.littleterry.util;

import lombok.Data;

import java.io.Serializable;

/**
 * 通用返回result
 * @author terry
 * @since 24/04/2019
 */
@Data
public class R<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 成功标志
     */
    private boolean success = true;

    /**
     * 返回处理消息
     */
    private String message = "操作成功！";

    /**
     * 返回代码
     */
    private Integer code = 0;

    /**
     * 返回数据对象 data
     */
    private T result;

    public R() {

    }

    /**
     * 时间戳
     */
    private long timestamp = System.currentTimeMillis();


    public void success(String message) {
        this.message = message;
        this.code = 200;
        this.success = true;
    }

    public static R<Object> error() {
        return error(500, "操作失败！");
    }

    public static R<Object> error(String msg) {
        return error(500, msg);
    }

    public static R<Object> error(int code, String msg) {
        R<Object> r = new R<>();
        r.setCode(code);
        r.setMessage(msg);
        r.setSuccess(false);
        return r;
    }

    public static R<Object> ok() {
        return ok(200, "操作成功！");
    }

    public static R<Object> ok(String msg) {
        R<Object> r = new R<>();
        r.setSuccess(true);
        r.setCode(200);
        r.setMessage(msg);
        return r;
    }

    public static R<Object> ok(Object data) {
        R<Object> r = new R<>();
        r.setSuccess(true);
        r.setCode(200);
        r.setResult(data);
        return r;
    }

    public static R<Object> ok(int code, String msg) {
        R<Object> r = new R<>();
        r.setCode(code);
        r.setMessage(msg);
        r.setSuccess(true);
        return r;
    }
}

