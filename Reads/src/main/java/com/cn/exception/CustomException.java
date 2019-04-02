package com.cn.exception;

public class CustomException extends Exception {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String message;
    public Throwable throwable;
    public CustomException(String message){
        super(message);
        this.message = message;
    }

    public CustomException(Throwable throwable){
        super(throwable);
        this.throwable = throwable;
    }

    public Throwable getThrowable() {
        return throwable;
    }

    public void setThrowable(Throwable throwable) {
        this.throwable = throwable;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
