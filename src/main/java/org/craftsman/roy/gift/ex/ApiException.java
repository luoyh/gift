package org.craftsman.roy.gift.ex;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
public class ApiException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public ApiException(int code, String msg) {
		super(msg);
		this.code = code;
		this.msg = msg;
	}
	
	private int code;
	private String msg;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
