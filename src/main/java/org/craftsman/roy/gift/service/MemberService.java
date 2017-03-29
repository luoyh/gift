package org.craftsman.roy.gift.service;

import org.craftsman.roy.gift.App;
import org.craftsman.roy.gift.ex.ApiException;
import org.craftsman.roy.gift.model.Member;
import org.craftsman.roy.gift.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@Service("memberService")
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	public void insert(Member member) {
		try {
			memberRepository.save(member);
		} catch (Exception ex) {
			throw new ApiException(App.ERR, "此电话已被注册");
		}
	}
	
	public Page<Member> list(int page, int size) {
		Pageable pageable = new PageRequest(page, size, new Sort(Direction.DESC, "gmtCreated"));
		return memberRepository.findAll(pageable);
	}

}
