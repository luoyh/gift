package org.craftsman.roy.gift.common;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * 
 * @author luoyh
 * @date Mar 18, 2017
 */
@MappedSuperclass
public class Entity {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "gmt_created", nullable = false, columnDefinition = "datetime")
	private Date gmtCreated;

	@Column(name = "gmt_modified", nullable = false, columnDefinition = "datetime")
	private Date gmtModified;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getGmtCreated() {
		return gmtCreated;
	}
	public void setGmtCreated(Date gmtCreated) {
		this.gmtCreated = gmtCreated;
	}
	public Date getGmtModified() {
		return gmtModified;
	}
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
}
