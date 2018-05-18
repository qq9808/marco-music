package com.marco.music.common.weixin;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.marco.music.common.http.Http;
import com.marco.music.common.string.StringTool;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年8月9日 下午3:06:13
 * AccessToken工具类.
 */
public class AccessTokenUtil {

	protected static Logger logger = Logger.getLogger(AccessTokenUtil.class);
	
	/**
	 * 获取access_token
	 * 获取频率有限制，每日2000次，每次有效期7200秒，为了避免超过频率限制，所以将access_token放入缓存中
	 */
	public static String getAccessToken(String appid, String appsecret) {
		
		AccessToken accessTokenObj = new AccessToken();
		String access_token = "";
		
		try {
			WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
			ServletContext application = webApplicationContext.getServletContext();
			
			Object obj = application.getAttribute(Weixin.ACCESS_TOKEN);
			
			if(obj != null){
				accessTokenObj = (AccessToken)obj;
				long saveTime = accessTokenObj.getCreateTime();
				long now = System.currentTimeMillis();			
				System.out.println("access_token存储时间为" + ((now - saveTime) / 1000));
				if ((now - saveTime) / 1000 <= 3600) {
					access_token = accessTokenObj.getAccess_token();
					return access_token;		
				}
			}
			
			String url = Weixin.ACCESS_TOKEN_URL.replace("APPID", Weixin.APPID).replace("APPSECRET", Weixin.APPSECRET);
			String json_result = Http.doGet(url); 
			System.out.println("调用access_token接口（调用上限为2000），可调用次数-1");
			System.out.println(json_result);
			
			if(StringTool.isNotEmpty(json_result)) {
				JSONObject obj_result = JSONObject.fromObject(json_result);
				access_token = obj_result.optString("access_token");
				accessTokenObj.setAccess_token(access_token);
				accessTokenObj.setCreateTime(System.currentTimeMillis());
				application.setAttribute(Weixin.ACCESS_TOKEN, accessTokenObj);
			}
		} catch (Exception e) {
			logger.error("刷新全局变量AccessToken时发生错误", e);
			e.printStackTrace();
		}
		
		return access_token;
	}
	
}
