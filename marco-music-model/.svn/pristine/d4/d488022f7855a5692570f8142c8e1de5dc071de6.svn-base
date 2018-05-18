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
 * @date 2017年6月3日 上午12:57:09
 * 原创&翻唱
 */
@Entity
@Table(name="article_singing")
public class Singing implements Serializable {

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
	
	@Column(name="type")
	private Integer type;	         //类型  1.mp3 2.mp4
		
	@Column(name="video_id")
	private String videoID;		     //视频ID
	
	@Column(name="video_url")
	private String videoURL;		 //视频地址
	
	@Column(name="video_name")
	private String videoName;		 //视频名称

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

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getVideoID() {
		return videoID;
	}

	public void setVideoID(String videoID) {
		this.videoID = videoID;
	}

	public String getVideoURL() {
		return videoURL;
	}

	public void setVideoURL(String videoURL) {
		this.videoURL = videoURL;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
}
