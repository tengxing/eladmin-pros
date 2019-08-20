package cn.littleterry.exception;

/**
 * @author terry
 * @since 19/08/2019
 */
public enum ResultCode {
    ;
    private Integer code;
    private String message;

    ResultCode(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
    //SUCCESS(1,"成功");
}
