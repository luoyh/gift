package org.craftsman.roy.gift.repository;

import org.craftsman.roy.gift.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@Repository("accountRepository")
public interface AccountRepository extends JpaRepository<Account, Long>, JpaSpecificationExecutor<Account> {

	//Account findByAccountAndTypeAndUsed(Account account);
	@Query("from account where acc=:#{#p.acc} and type=:#{#p.type} and used=:#{#p.used}")
	Account fetch(@Param("p") Account account);
	
	@Modifying
	@Transactional
	@Query("update account set used=1 where id=?1")
	int uesed(long id);
}
