package org.craftsman.roy.gift.web;

import javax.servlet.http.HttpServletRequest;

import org.craftsman.roy.gift.common.HttpResult;
import org.craftsman.roy.gift.ex.ApiException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author luoyh
 * @date Mar 19, 2017
 */
@ControllerAdvice
public class AdviceException {

	@ExceptionHandler(value = Exception.class)
	@ResponseBody
	public HttpResult dex(HttpServletRequest request, Exception ex) throws Exception {
		ex.printStackTrace();
		if (ex instanceof ApiException) {
			ApiException ae = (ApiException) ex;
			return HttpResult.err().setCode(ae.getCode()).setMsg(ae.getMsg());
		}
		return HttpResult.err().setMsg(ex.getMessage());
	}
	
}
