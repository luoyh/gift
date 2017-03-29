package org.craftsman.roy.gift.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.craftsman.roy.gift.App;
import org.craftsman.roy.gift.common.HttpResult;
import org.craftsman.roy.gift.model.Account;
import org.craftsman.roy.gift.model.Member;
import org.craftsman.roy.gift.service.AccountService;
import org.craftsman.roy.gift.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	
	@Value("${admin.username}")
	private String username;
	
	@Value("${admin.password}")
	private String password;
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/")
	public String index(ModelMap model) {
		model.put("timestamp", System.currentTimeMillis());
		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	@ResponseBody
	public HttpResult logon(String username, String password, HttpServletRequest request) {
		if (this.username.equals(username) && this.password.equals(password)) {
			request.getSession().setAttribute(App.JSESSION_TOKEN, "0");
			return HttpResult.ok();
		}
		return HttpResult.err();
	}
	
	@PostMapping("/register")
	@ResponseBody
	public HttpResult register(@Valid Member member, BindingResult result) {
		if (result.hasErrors()) {
			return HttpResult.err().setMsg(result.getFieldError().getDefaultMessage());
		}
		member.setGmtCreated(new Date());
		member.setGmtModified(new Date());
		memberService.insert(member);
		return HttpResult.ok();
	}
	
	@PostMapping("/fetch")
	@ResponseBody
	public HttpResult fetch(@Valid Account account, BindingResult result) {
		if (result.hasErrors()) {
			return HttpResult.err().setMsg(result.getFieldError().getDefaultMessage());
		}
		accountService.fetch(account);
		return HttpResult.ok();
	}

}
