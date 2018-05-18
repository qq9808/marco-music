package com.marco.music.controller.user;

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
import com.marco.music.model.forum.Forum;
import com.marco.music.model.singing.Singing;
import com.marco.music.model.user.User;
import com.marco.music.service.forum.ForumService;
import com.marco.music.service.singing.SingingService;
import com.marco.music.service.user.UserService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年5月28日 下午12:45:37
 * 用户Controller.
 */
@Controller
public class UserController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SingingService singingService;
	
	@Autowired
	private ForumService forumService;
	
	@RequestMapping("/user/page")
	public String userCenterPage(HttpServletRequest request, HttpServletResponse response) {
			
		Object userObj = request.getSession().getAttribute(Keyword.USER);
		
		if(userObj != null) {
			User user = (User)userObj;
			request.setAttribute("user", user);
			request.setAttribute("txURL", Keyword.TX_URL);
		}
		else {
			request.setAttribute("state", CodeAndMsg.EXCEPTION_CODE);
			request.setAttribute("msg", CodeAndMsg.EXCEPTION_MSG);
			return "/error/error";
		}
		
		return "/userCenter/user_center";
	}
	
	@RequestMapping("/user/page/read")
	public String userCenterPageRead(HttpServletRequest request, HttpServletResponse response,
			Integer id) {
						
		try {
			
			if(id == null) {
				request.setAttribute("state", CodeAndMsg.EXCEPTION_CODE);
				request.setAttribute("msg", CodeAndMsg.EXCEPTION_MSG);
				return "/error/error";
			}
						
			User user = userService.get(id);
			
			if(user != null) {				
				//保护用户信息，防止泄露
				request.setAttribute("id", user.getId());
				request.setAttribute("nickname", user.getNickname());
				request.setAttribute("txImg", user.getTxImg());
				request.setAttribute("sex", user.getSex());
				request.setAttribute("province", user.getProvince());
				request.setAttribute("city", user.getCity());
				request.setAttribute("createTime", user.getCreateTime());
			}

			List<Singing> singingList = singingService.findSingingByUserID(id);
			List<Forum> forumList = forumService.findForumByUserID(id);
			
			request.setAttribute("singingList", singingList);
			request.setAttribute("forumList", forumList);
		} catch (Exception e) {
			request.setAttribute("state", CodeAndMsg.EXCEPTION_CODE);
			request.setAttribute("msg", CodeAndMsg.EXCEPTION_MSG);
			return "/error/error";
		}
						
		return "/userCenter/user_center_read";
	}
	
	/**
	 * 保存用户信息
	 */
	@RequestMapping(value="/user/info/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String registerSave(HttpServletRequest request, HttpServletResponse response,
			Integer sex) {
	
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			Object userObj = request.getSession().getAttribute(Keyword.USER);
			User user = null;
			if(userObj != null) {
				user = (User)userObj;
			}
			else {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			String nickname = request.getParameter("nickname");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String province = request.getParameter("province");
			String city = request.getParameter("city");
				
			//这些参数不能为空
			if(StringTool.isEmpty(nickname) || StringTool.isEmpty(email)) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			user.setNickname(nickname);
			user.setSex(sex);
			user.setEmail(email);
			user.setPhone(phone);
			user.setProvince(province);
			user.setCity(city);
			
			userService.update(user);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
		} catch (Exception e) {
			logger.error("保持个人信息出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
	/**
	 * 查找用户发帖纪录
	 */
	@RequestMapping(value="/user/history", produces="application/json; charset=utf-8")
	@ResponseBody
	public String history(HttpServletRequest request, HttpServletResponse response,
			Integer id) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			if(id == null) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			List<Singing> singingList = singingService.findSingingByUserID(id);
			List<Forum> forumList = forumService.findForumByUserID(id);
			
			result.put("singingList", singingList);
			result.put("forumList", forumList);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
		} catch (Exception e) {
			logger.error("查找用户发帖纪录出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
}
