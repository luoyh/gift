package org.craftsman.roy.gift.web;

import java.util.Date;

import javax.validation.Valid;

import org.craftsman.roy.gift.App;
import org.craftsman.roy.gift.common.HttpResult;
import org.craftsman.roy.gift.model.Account;
import org.craftsman.roy.gift.model.Five;
import org.craftsman.roy.gift.model.Member;
import org.craftsman.roy.gift.service.AccountService;
import org.craftsman.roy.gift.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author luoyh
 * @date Mar 22, 2017
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/dashboard")
	public String dashboard(ModelMap model) {
		model.put("page", memberService.list(0, 50));
		return "admin/dashboard";
	}

	@GetMapping("/five")
	public String five(ModelMap model) {
		model.put("page", memberService.listFive(0, 50));
		return "admin/five";
	}
	
	@GetMapping("/account")
	public String account(ModelMap model) {
		model.put("page", accountService.list("", 0, 50));
		return "admin/account";
	}

	@GetMapping("/member/page")
	@ResponseBody
	public Page<Member> page(Integer page, Integer size) {
		return memberService.list(null == page ? 0 : page, null == size ? 50 : size);
	}

	@GetMapping("/five/page")
	@ResponseBody
	public Page<Five> fivePage(Integer page, Integer size) {
		return memberService.listFive(null == page ? 0 : page, null == size ? 50 : size);
	}
	
	@PostMapping("/account")
	@ResponseBody
	public HttpResult addAcc(@Valid Account account, BindingResult br) {
		HttpResult hr = HttpResult.ok();
		if (br.hasFieldErrors()) {
			hr.setCode(App.ERR).setMsg(br.getFieldError().getDefaultMessage());
		}
		account.setGmtCreated(new Date());
		account.setGmtModified(new Date());
		accountService.insert(account);
		return hr;
	}
	
	@GetMapping("/account/page")
	@ResponseBody
	public Page<Account> pageacc(String account, Integer page, Integer size) {
		return accountService.list(account, null == page ? 0 : page, null == size ? 50 : size);
	}
	
}
