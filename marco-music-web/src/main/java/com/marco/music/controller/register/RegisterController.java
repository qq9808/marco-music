package com.marco.music.controller.register;

import java.util.Date;
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
 * @date 2017年5月21日 下午3:34:58
 * 用户注册.
 */
@Controller
public class RegisterController {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UserService userService;

	/**
	 * 注册页面
	 */
	@RequestMapping("/register/page")
	public String registerPage(HttpServletRequest request, HttpServletResponse response) {
		
		String returnURL = request.getParameter("returnURL");
		System.out.println(returnURL);
		
		request.getSession().setAttribute(Keyword.RETURN_URL, returnURL);		
		return "/register/register";
	}
	
	/**
	 * 注册
	 */
	@RequestMapping(value="/register/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String registerSave(HttpServletRequest request, HttpServletResponse response,
			String account, String password, String nickname, String email) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
						
			User user = new User();
			
			//这些参数不能为空
			if(StringTool.isEmpty(account) || StringTool.isEmpty(password) || StringTool.isEmpty(nickname)) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			//检查用户名是否已经存在
			List<User> UserList1 = userService.findUserByAccount(account);
			if(UserList1 != null && UserList1.size() > 0) {
				result.put("state", CodeAndMsg.ACCOUNT_EXIST);
				result.put("msg", CodeAndMsg.ACCOUNT_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			//检查邮箱是否已经存在
			List<User> UserList2 = userService.findUserByEmail(email);
			if(UserList2 != null && UserList2.size() > 0) {
				result.put("state", CodeAndMsg.EMAIL_EXIST);
				result.put("msg", CodeAndMsg.EMAIL_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			user.setAccount(account);
			user.setPasswork(password);
			user.setNickname(nickname);
			user.setEmail(email);
			user.setCreateTime(new Date());
						
			userService.save(user);
			request.getSession().setAttribute(Keyword.USER, user);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
		} catch (Exception e) {
			logger.error("保存用户出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
						
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();		
	}
	
}
