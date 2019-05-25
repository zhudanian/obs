package cn.zdn.obs.exceptions;

public class CustomerNotExistException extends Exception {
    public CustomerNotExistException() {
        super();
    }

    public CustomerNotExistException(String message) {
        super(message);
    }

    public CustomerNotExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public CustomerNotExistException(Throwable cause) {
        super(cause);
    }

    protected CustomerNotExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
