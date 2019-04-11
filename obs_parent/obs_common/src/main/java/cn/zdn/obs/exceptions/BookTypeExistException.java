package cn.zdn.obs.exceptions;


public class BookTypeExistException extends Exception {

    public BookTypeExistException() {
        super();
    }

    public BookTypeExistException(String message) {
        super(message);
    }

    public BookTypeExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public BookTypeExistException(Throwable cause) {
        super(cause);
    }

    protected BookTypeExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
