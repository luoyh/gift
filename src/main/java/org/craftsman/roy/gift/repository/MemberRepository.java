package org.craftsman.roy.gift.repository;

import org.craftsman.roy.gift.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@Repository("memberRepository")
public interface MemberRepository extends JpaRepository<Member, Long> {

}
