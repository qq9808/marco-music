package com.marco.music.model.recommend;

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
 * @date 2017年8月23日 下午11:35:17
 * 荐读回复.
 */
@Entity
@Table(name="article_recommend_reply")
public class RecommendReply implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;
	
	@Column(name="recommend_id")
	private Integer recommendID;	 //荐读id
	
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

	public Integer getRecommendID() {
		return recommendID;
	}

	public void setRecommendID(Integer recommendID) {
		this.recommendID = recommendID;
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
