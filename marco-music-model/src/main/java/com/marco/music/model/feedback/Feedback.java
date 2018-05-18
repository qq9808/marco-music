package com.marco.music.model.feedback;

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
 * @date 2017年5月25日 上午8:45:37
 * 留言.
 */
@Entity
@Table(name="feedback")
public class Feedback implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;
	
	@Column(name="content")
	private String content;		     //内容
	
	@Column(name="createtime")
	private Date createTime;	     //留言时间
	
	@Column(name="say_userid")
	private Integer sayUserID;	     //发表用户id
	
	@Column(name="read_userid")
	private Integer readUserID;	     //阅读用户id
	
	@Column(name="reply_id")
	private Integer replyID;	     //被回复的留言的id
	
	@Column(name="level")
	private Integer level;	         //留言等级

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getSayUserID() {
		return sayUserID;
	}

	public void setSayUserID(Integer sayUserID) {
		this.sayUserID = sayUserID;
	}

	public Integer getReplyID() {
		return replyID;
	}

	public void setReplyID(Integer replyID) {
		this.replyID = replyID;
	}

	public Integer getReadUserID() {
		return readUserID;
	}

	public void setReadUserID(Integer readUserID) {
		this.readUserID = readUserID;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}
		
}
