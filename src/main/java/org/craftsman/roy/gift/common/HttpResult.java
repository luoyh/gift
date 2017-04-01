package org.craftsman.roy.gift.common;

import org.craftsman.roy.gift.App;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
public class HttpResult {
	
	public static void main(String[] args) {
		System.out.println(HttpResult.class.getClassLoader().getSystemResource("").getPath());
	}
	
	private int code;
	private String msg;
	private Object data;
	
	public static HttpResult ok() {
		HttpResult r = new HttpResult();
		r.setCode(App.OK);
		return r;
	}
	
	public static HttpResult err() {
		HttpResult r = new HttpResult();
		r.setCode(App.ERR);
		return r;
	}
	
	public int getCode() {
		return code;
	}
	public HttpResult setCode(int code) {
		this.code = code;
		return this;
	}
	public String getMsg() {
		return msg;
	}
	public HttpResult setMsg(String msg) {
		this.msg = msg;
		return this;
	}
	public Object getData() {
		return data;
	}
	public HttpResult setData(Object data) {
		this.data = data;
		return this;
	}
}
