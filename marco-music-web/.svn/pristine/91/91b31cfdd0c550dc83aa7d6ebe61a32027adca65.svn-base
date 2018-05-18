package com.marco.music.startup;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.marco.music.common.keyword.Keyword;
import com.marco.music.common.youku.Youku;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年6月6日 上午10:53:37
 * 项目启动时刷新令牌.
 */
public class RefreshToken extends HttpServlet {

	protected Logger logger = Logger.getLogger(getClass());
	
	public void init(){       
		
		try {
			
			String result = Youku.authorize();
			System.out.println(result);
			
			if(result != null) {
				
				JSONObject jsonResult = JSONObject.fromObject(result);
				String access_token = jsonResult.optString("access_token");
				
				WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
				ServletContext application = webApplicationContext.getServletContext();
				application.setAttribute(Keyword.ACCESS_TOKEN, access_token);
			}			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("启动项目时刷新令牌出错！", e.fillInStackTrace());
		}
	}	
	
}
