package com.marco.music.common.youku;

import java.util.HashMap;
import java.util.Map;

import com.marco.music.common.http.Http;

/**
 * @author Marco
 * @date 2017年6月6日 上午10:57:48
 * 优酷.
 */
public class Youku {

	public static final String client_id = "46233d5303c4e1fa";
	
	public static final String client_secret = "9796b2d23728509ebb1046aa77381ae2";
	
	public static final String grant_type = "refresh_token";
	
	public static final String refresh_token = "3422089c86a605294638ea22ad6aafd8";
	
	public static final String authorize_url = "https://api.youku.com/oauth2/token.json";
	
	public static String authorize() {
		
		Map<String,String> params = new HashMap<String, String>();
		params.put("client_id", client_id);
		params.put("grant_type", grant_type);
		params.put("refresh_token", refresh_token);
		
		String result = Http.post(authorize_url, params);
		
		return result;
	}
}
