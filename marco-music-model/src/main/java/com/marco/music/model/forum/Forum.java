package com.marco.music.model.forum;

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
 * 论坛帖子.
 */
@Entity
@Table(name="article_forum")
public class Forum implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;
	
	@Column(name="title")
	private String title;		     //标题
	
	@Column(name="content")
	private String content;		     //内容
	
	@Column(name="createtime")
	private Date createTime;	     //发帖时间
	
	@Column(name="userid")
	private Integer userID;	         //用户id
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public void setCreateTime(Date createtime) {
		this.createTime = createtime;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

}
