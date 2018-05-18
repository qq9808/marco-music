package com.marco.music.common.weixin;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Marco
 * @date 2017年8月9日 下午3:44:54
 * 一级菜单.
 */
public class Button {

	private String type; // 菜单的响应动作类型
	private String name; // 菜单标题
	private String key; // 菜单KEY值
	private String url; // 网页链接
	private String media_id;
	private List<Button> sub_button = new ArrayList<Button>();

	public void addSubuButton(Button bt) {
		sub_button.add(bt);
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}

	public List<Button> getSub_button() {
		return sub_button;
	}

	public void setSub_button(List<Button> sub_button) {
		this.sub_button = sub_button;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return this.type;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getKey() {
		return this.key;
	}
	
}
