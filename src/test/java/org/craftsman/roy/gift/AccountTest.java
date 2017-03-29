package org.craftsman.roy.gift;

import org.craftsman.roy.gift.model.Account;
import org.craftsman.roy.gift.repository.AccountRepository;
import org.craftsman.roy.gift.service.AccountService;
import org.craftsman.roy.gift.service.MemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.test.context.junit4.SpringRunner;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author luoyh
 * @date Mar 22, 2017
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AccountTest {
	
	private ObjectMapper mapper = new ObjectMapper();
	
	private String toJson(Object obj) {
		try {
			return mapper.writeValueAsString(obj);
		} catch (Exception ex) {}
		return null;
	}
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	MemberService memberService;
	@Autowired
	AccountService accountService;
	
	@Test
	public void testList() {
		Page<Account> list = accountService.list("i", 0, 20);
		System.out.println(toJson(list));
	}
	
	public void testPage() throws Exception {
		System.err.println(toJson(memberService.list(0, 10)));
		System.err.println(toJson(memberService.list(0, 2)));
		System.err.println(toJson(memberService.list(1, 2)));
		System.err.println(toJson(memberService.list(2, 2)));
		System.err.println(toJson(memberService.list(3, 2)));
	}
	
}
