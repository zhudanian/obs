package cn.zdn.obs.exceptions;


public class PhoneNotExistException extends Exception {


    public PhoneNotExistException() {
        super();
    }

    public PhoneNotExistException(String message) {
        super(message);
    }

    public PhoneNotExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public PhoneNotExistException(Throwable cause) {
        super(cause);
    }

    protected PhoneNotExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
