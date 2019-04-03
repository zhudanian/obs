package cn.zdn.obs.exceptions;

/**
 * Author:hellboy
 * Date:2018-11-14 14:02
 * Description:<描述>
 */
public class SysUserNotExistException extends Exception{

    public SysUserNotExistException() {
        super();
    }

    public SysUserNotExistException(String message) {
        super(message);
    }

    public SysUserNotExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public SysUserNotExistException(Throwable cause) {
        super(cause);
    }

    protected SysUserNotExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
