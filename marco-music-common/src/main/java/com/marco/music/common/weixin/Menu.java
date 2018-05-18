package com.marco.music.common.weixin;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年8月9日 下午3:43:56
 * 微信公众号菜单.
 */
public class Menu {

	private List<Button> button = new ArrayList<Button>();

	public void addButton(Button btn) {
		button.add(btn);
	}

	public List<Button> getButton() {
		return button;
	}

	public void setButton(List<Button> button) {
		this.button = button;
	}
	
	public static String getDefaultMenu() {
		
		Menu menu=new Menu();//创建主菜单对象
		Button btn1=new Button(); 
		
		btn1.setName("Info");//一级菜单
		btn1.setType("view");
		btn1.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx7bf049486c045d43&redirect_uri=http://herogus.nat100.top/weixinCourse/test/userAuthorization.action&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
	
		menu.addButton(btn1);
		
		JSONObject jsonObject = JSONObject.fromObject(menu);		
		String jsonstr = jsonObject.toString();
		return jsonstr;
	}
	
}
