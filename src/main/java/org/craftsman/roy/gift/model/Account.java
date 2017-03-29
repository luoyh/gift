package org.craftsman.roy.gift.model;

import javax.persistence.Column;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.craftsman.roy.gift.common.Entity;
import org.hibernate.validator.constraints.Length;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@javax.persistence.Entity(name = "account")
@Table(name = "account", indexes = {
		@Index(columnList = "acc,type", name = "uidx_account_type", unique = true)
})
public class Account extends Entity {

	@Column(name = "acc", length = 12, nullable = false)
	@NotNull(message = "帐号不能为空")
	@Length(max = 12, message = "帐号最多12个字符")
	private String acc;

	@Column(name = "type", length = 2, nullable = false, columnDefinition = "int")
	private int type;

	@Column(name = "used", length = 2, nullable = false, columnDefinition = "int")
	private int used;

	public String getAcc() {
		return acc;
	}

	public void setAcc(String acc) {
		this.acc = acc;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}
}
