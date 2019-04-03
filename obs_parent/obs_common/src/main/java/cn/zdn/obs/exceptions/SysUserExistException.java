package cn.zdn.obs.exceptions;

public class SysUserExistException extends Exception {

    public SysUserExistException() {
        super();
    }

    public SysUserExistException(String message) {
        super(message);
    }

    public SysUserExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public SysUserExistException(Throwable cause) {
        super(cause);
    }

    protected SysUserExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
