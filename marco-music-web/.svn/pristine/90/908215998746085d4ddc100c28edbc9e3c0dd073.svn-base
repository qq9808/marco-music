package com.marco.music.controller.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marco.music.common.code.CodeAndMsg;
import com.marco.music.common.keyword.Keyword;
import com.marco.music.common.string.StringTool;
import com.marco.music.model.user.User;
import com.marco.music.service.user.UserService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年5月22日 下午10:57:09
 * 登录Controller.
 */
@Controller
public class LoginController {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UserService userService;

	/**
	 * 登录页面
	 */
	@RequestMapping("/login/page")
	public String loginPage(HttpServletRequest request, HttpServletResponse response) {
		
		String returnURL = request.getParameter("returnURL");
		System.out.println(returnURL);
		
		request.getSession().setAttribute(Keyword.RETURN_URL, returnURL);		
		return "/login/login";
	}
	
	/**
	 * 登录
	 */
	@RequestMapping(value="/login", produces="application/json; charset=utf-8")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response,
			String account, String password) {
		
		Map<String, Object> result = new HashMap<String, Object>();
				
		try {
			//这些参数不能为空
			if(StringTool.isEmpty(account) || StringTool.isEmpty(password)) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			List<User> userList = userService.findUserByAccount(account);
			if(userList != null && userList.size() > 0) {
				User user = userList.get(0);
				if(user.getPasswork() != null && password.equals(user.getPasswork())) {
					logger.info(user.getNickname() + "登录了!!!!!!!!!!!!!!!!!!");
					request.getSession().setAttribute(Keyword.USER, user);
					result.put("state", CodeAndMsg.SUCCESS_CODE);
					result.put("msg", CodeAndMsg.SUCCESS_MSG);
					JSONObject jsonObject = JSONObject.fromObject(result);
					return jsonObject.toString();
				}
			}
			else {
				result.put("state", CodeAndMsg.LOGIN_MISTAKE);
				result.put("msg", CodeAndMsg.LOGIN_MISTAKE_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
		} catch (Exception e) {
			logger.error("登录时发生错误", e);
		}
		
		result.put("state", CodeAndMsg.LOGIN_MISTAKE);
		result.put("msg", CodeAndMsg.LOGIN_MISTAKE_MSG);
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping("/login/exit")
	public String exit(HttpServletRequest request, HttpServletResponse response) {		
		
		request.getSession().removeAttribute(Keyword.USER);		
		return "redirect:/index.jsp";
	}
	
}
