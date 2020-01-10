package cn.littleterry.util;

import com.alibaba.fastjson.JSON;
import lombok.Data;

/**
 * Coral系统统一返回包装类
 * @author terry
 * @since 29/04/2019
 */
@Data
public class R<T> {
    private static final long serialVersionUID = 1L;

    private boolean success = true;

    private String message = "操作成功！";

    private Integer code = 200;

    private T result;

    private long timestamp = System.currentTimeMillis();

    public static <E> R<E> ok() {
        return new R<>();
    }
    public static <E> R<E> ok(String message) {
        R r = new R<>();
        r.setMessage(message);
        return r;
    }

    public R() {
    }
    public static <E> R<E> error() {
        R r = new R<>();
        r.setCode(500);
        r.setMessage("操作失败！");
        r.setSuccess(false);
        return r;
    }
    public static <E> R<E> error(String message) {
        R r = new R<>();
        r.setCode(500);
        r.setMessage(message);
        r.setSuccess(false);
        return r;
    }

    public R write(T result) {
        this.result = result;
        return this;
    }

    public static void main(String[] args){
        System.out.println(JSON.toJSONString(R.ok().write(new R())));
    }
}
