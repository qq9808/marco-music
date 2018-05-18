package com.marco.music.controller.weixin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marco.music.common.http.Http;
import com.marco.music.common.weixin.AccessTokenUtil;
import com.marco.music.common.weixin.Menu;
import com.marco.music.common.weixin.Weixin;

/**
 * @author Marco
 * @date 2017年8月9日 下午4:05:22
 * 菜单Controller.
 */
@Controller
public class MenuController {

	@RequestMapping("/weixin/menu")
	public void menu(HttpServletRequest request, HttpServletResponse response) {
		
		String accessToken = AccessTokenUtil.getAccessToken(Weixin.APPID, Weixin.APPSECRET);		
		String url = Weixin.MENU_URL.replace("ACCESS_TOKEN", accessToken);		
		System.out.println(accessToken);
		System.out.println(Menu.getDefaultMenu());
		
		try {
			String jsonstr = Http.sendHttpReq("POST", Menu.getDefaultMenu(), url, "utf-8");
			System.out.println(jsonstr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
