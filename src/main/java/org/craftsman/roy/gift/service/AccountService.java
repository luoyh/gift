package org.craftsman.roy.gift.service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.craftsman.roy.gift.App;
import org.craftsman.roy.gift.ex.ApiException;
import org.craftsman.roy.gift.model.Account;
import org.craftsman.roy.gift.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@Service("accountService")
public class AccountService {
	
	class Node {
		Node next;
	}

	@Autowired
	private AccountRepository accountRepository;
	
	public void fetch(Account account) {
		Account a = accountRepository.fetch(account);
		if (null == a) {
			throw new ApiException(App.ERR, "帐号不存在");
		}
		accountRepository.uesed(a.getId());
	}
	
	public void insert(Account account) {
		accountRepository.save(account);
	}
	
	public Page<Account> list(final String account, int page, int size) {
		Pageable pageable = new PageRequest(page, size, new Sort(Direction.DESC, "gmtCreated"));
		return accountRepository.findAll(new Specification<Account>() {
			@Override
			public Predicate toPredicate(Root<Account> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.like(root.get("acc"), "%" + account + "%");
			}
		}, pageable);
	}
	
}
