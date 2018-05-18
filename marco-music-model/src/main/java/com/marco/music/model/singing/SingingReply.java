package com.marco.music.model.singing;

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
 * @date 2017年6月3日 上午12:59:35
 * 原创&翻唱回复.
 */
@Entity
@Table(name="article_singing_reply")
public class SingingReply implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;
	
	@Column(name="singing_id")
	private Integer singingID;	     	 //原创&翻唱id
	
	@Column(name="content")
	private String content;		     //内容
		
	@Column(name="level")
	private Integer level;	         //回复级数，1.一级回复，2.二级回复
	
	@Column(name="reply_id")
	private Integer replyID;	     //被回复记录的id
	
	@Column(name="userid")
	private Integer userID;	         //用户id
	
	@Column(name="createtime")
	private Date createTime;	     //回复时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSingingID() {
		return singingID;
	}

	public void setSingingID(Integer singingID) {
		this.singingID = singingID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getReplyID() {
		return replyID;
	}

	public void setReplyID(Integer replyID) {
		this.replyID = replyID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
		
}
