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
import com.marco.music.model.admin.Admin;
import com.marco.music.service.admin.AdminService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年5月31日 下午6:03:21
 * 登录Controller.
 */
@Controller
public class LoginController {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private AdminService adminService;
	
	/**
	 * 登录
	 */
	@RequestMapping(value="/login", produces="application/json; charset=utf-8")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response,
			String account, String passwork) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			//这些参数不能为空
			if(StringTool.isEmpty(account) || StringTool.isEmpty(passwork)) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			List<Admin> adminList = adminService.findAdminByAccount(account);
			if(adminList != null && adminList.size() > 0) {
				Admin admin = adminList.get(0);
				if(admin.getPasswork() != null && passwork.equals(admin.getPasswork())) {
					request.getSession().setAttribute(Keyword.ADMIN, admin);
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
			e.printStackTrace();
		}
		
		result.put("state", CodeAndMsg.LOGIN_MISTAKE);
		result.put("msg", CodeAndMsg.LOGIN_MISTAKE_MSG);
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}

}
