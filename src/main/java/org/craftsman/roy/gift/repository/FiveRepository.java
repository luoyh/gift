package org.craftsman.roy.gift.repository;

import org.craftsman.roy.gift.model.Five;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@Repository("fiveRepository")
public interface FiveRepository extends JpaRepository<Five, Long> {

}
