package org.craftsman.roy.gift.model;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.craftsman.roy.gift.common.Entity;
import org.hibernate.validator.constraints.Length;

/**
 * 
 * @author luoyh
 * @date Apr 2, 2017
 */
@javax.persistence.Entity
@Table(name = "five")
public class Five extends Entity {

	@Column(name = "realname", length = 12, nullable = false)
	@NotNull(message = "姓名不能为空")
	@Length(max = 12, message = "姓名最多12个字符")
	private String realname;
	
	@Column(name = "mobile", length = 20, nullable = false, unique = true)
	@NotNull(message = "电话不能为空")
	@Length(max = 20, message = "电话最大长度为20")
	private String mobile;

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
}
