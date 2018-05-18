package com.marco.music.controller.notice;

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
import com.marco.music.model.notice.Notice;
import com.marco.music.model.user.User;
import com.marco.music.service.notice.NoticeService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年8月2日 下午8:11:05
 * 新的动态.
 */
@Controller
public class NoticeController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 检查是否有动态
	 */
	@RequestMapping(value="/notice/check", produces="application/json; charset=utf-8")
	@ResponseBody
	public String checkNotice(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			Object userObj = request.getSession().getAttribute(Keyword.USER);
			
			if(userObj == null) {
				result.put("state", CodeAndMsg.USER_NOT_EXIST);
				result.put("msg", CodeAndMsg.USER_NOT_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			User user = (User)userObj;
			List<Notice> list = noticeService.findNoticeByUserid(user.getId());
			
			if(list != null && list.size() > 0) {
				result.put("num", list.size());
			}
			else {
				result.put("num", 0);
			}
			
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
		} catch (Exception e) {
			logger.error("检查是否有动态时发生异常", e);
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
	/**
	 * 查找动态
	 */
	@RequestMapping(value="/notice/find", produces="application/json; charset=utf-8")
	@ResponseBody
	public String findNotice(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			Object userObj = request.getSession().getAttribute(Keyword.USER);
			
			if(userObj == null) {
				result.put("state", CodeAndMsg.USER_NOT_EXIST);
				result.put("msg", CodeAndMsg.USER_NOT_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			User user = (User)userObj;
			List<Object[]> list = noticeService.findNoticeBySQL(user.getId());
			List<Object[]> knowList = noticeService.findKnowBySQL(user.getId());
			
			result.put("knowList", knowList);
			if(list != null && list.size() > 0) {
				result.put("many", 1);
				result.put("list", list);
			}
			else {
				result.put("many", 0);
			}
			
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
		} catch (Exception e) {
			logger.error("查找动态时发生异常", e);
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();		
	}
	
	/**
	 * 阅读动态
	 */
	@RequestMapping(value="/notice/read", produces="application/json; charset=utf-8")
	@ResponseBody
	public String readNotice(HttpServletRequest request, HttpServletResponse response,
			Integer noticeID) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			if(noticeID == null) {
				result.put("state", CodeAndMsg.EXCEPTION_CODE);
				result.put("msg", CodeAndMsg.EXCEPTION_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			Notice notice = noticeService.get(noticeID);
			notice.setKnow(Keyword.HAD_READ);
			noticeService.update(notice);
			
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
		} catch (Exception e) {
			logger.error("更新动态时发生异常", e);
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
	/**
	 * 忽略全部
	 */
	@RequestMapping(value="/notice/ignore", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ignoreNotice(HttpServletRequest request, HttpServletResponse response){
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			Object userObj = request.getSession().getAttribute(Keyword.USER);
			
			if(userObj == null) {
				result.put("state", CodeAndMsg.USER_NOT_EXIST);
				result.put("msg", CodeAndMsg.USER_NOT_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			User user = (User)userObj;
			
			noticeService.ignore(user.getId());
			
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
		} catch (Exception e) {
			logger.error("忽略动态时发生异常", e);
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
}
