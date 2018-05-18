package com.marco.music.model.notice;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Marco
 * @date 2017年7月30日 上午2:22:23
 * 新的动态.
 */
@Entity
@Table(name="notice")
public class Notice implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;
	
	@Column(name="type")
	private Integer type;	         //事件类型
	
	@Column(name="userid")
	private Integer userID;	         //本人id
	
	@Column(name="person_id")
	private Integer personID;	     //用户id
	
	@Column(name="event_id")
	private Integer eventID;	     //事件id
	
	@Column(name="event_name")
	private String eventName;		 //事件名称
	
	@Column(name="createtime")
	private Date createTime;	     //创建时间
	
	@Column(name="know")
	private Integer know;	         //是否阅读

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Integer getPersonID() {
		return personID;
	}

	public void setPersonID(Integer personID) {
		this.personID = personID;
	}

	public Integer getEventID() {
		return eventID;
	}

	public void setEventID(Integer eventID) {
		this.eventID = eventID;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getKnow() {
		return know;
	}

	public void setKnow(Integer know) {
		this.know = know;
	}
	
}
