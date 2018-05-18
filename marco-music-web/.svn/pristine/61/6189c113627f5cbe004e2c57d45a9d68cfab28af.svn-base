package com.marco.music.controller.feedback;

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
import com.marco.music.common.page.Page;
import com.marco.music.common.string.StringTool;
import com.marco.music.model.feedback.Feedback;
import com.marco.music.model.notice.Notice;
import com.marco.music.model.user.User;
import com.marco.music.service.feedback.FeedbackService;
import com.marco.music.service.notice.NoticeService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年7月27日 上午11:01:53
 * 留言Controller.
 */
@Controller
public class FeedbackController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private FeedbackService feedbackService;
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 留言板页面
	 */
	@RequestMapping("/feedback/page")
	public String forumPage(HttpServletRequest request, HttpServletResponse response,
			Integer curPage) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			Object UserObj = request.getSession().getAttribute(Keyword.USER);
			
			if(UserObj == null) {
				result.put("state", CodeAndMsg.USER_NOT_EXIST);
				result.put("msg", CodeAndMsg.USER_NOT_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			User user = (User)UserObj;
			
			Page page = new Page();			
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(99999);
			
			Feedback feedback = new Feedback();
			feedback.setReadUserID(user.getId());
			int count = feedbackService.countFeedbackByCondition(feedback);
			page.setAllRecordNum(count);
			page.setTotalPage(page.getTotalPage());
			Integer startRow = page.getStartRow();
			
			List<Object[]> list1 = feedbackService.findFeedbackBySQL1(user.getId(), startRow, page.getFetchSize());
			List<Object[]> list2 = feedbackService.findFeedbackBySQL2(user.getId(), startRow, page.getFetchSize());
			
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("txImg", user.getTxImg());
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("打开留言中心出错", e.fillInStackTrace());
			request.setAttribute("state", CodeAndMsg.EXCEPTION_CODE);
			request.setAttribute("msg", CodeAndMsg.EXCEPTION_MSG);
			return "/error/error";
			
		}
		
		return "/feedback/feedback";
	}
	
	/**
	 * 保存留言
	 */
	@RequestMapping(value="/feedback/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String feedbackSave(HttpServletRequest request, HttpServletResponse response,
			Integer readUserID, String content, Integer level, Integer replyID) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			Object UserObj = request.getSession().getAttribute(Keyword.USER);
			
			if(UserObj == null) {
				result.put("state", CodeAndMsg.USER_NOT_EXIST);
				result.put("msg", CodeAndMsg.USER_NOT_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			//这些参数不能为空
			if(readUserID == null || StringTool.isEmpty(content) || level == null) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			if(level == 2) {
				if(replyID == null) {
					result.put("state", CodeAndMsg.EXCEPTION_CODE);
					result.put("msg", CodeAndMsg.EXCEPTION_MSG);
					JSONObject jsonObject = JSONObject.fromObject(result);
					return jsonObject.toString();
				}
			}
			
			User user = (User)UserObj;
			Feedback feedback = new Feedback();
			
			feedback.setContent(content);
			feedback.setCreateTime(new Date());
			feedback.setSayUserID(user.getId());
			feedback.setReadUserID(readUserID);
			feedback.setLevel(level);
			if(level == 2) {
				feedback.setReplyID(replyID);
			}
			
			feedbackService.save(feedback);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
			try {
				
				Notice notice = new Notice();
				notice.setType(Keyword.NOTICE_TYPE_FEEDBACK);
				notice.setUserID(readUserID);
				notice.setPersonID(user.getId());
				notice.setEventID(null);
				notice.setEventName(null);
				notice.setCreateTime(new Date());
				notice.setKnow(Keyword.NOT_READ);	
				noticeService.save(notice);
			} catch (Exception e) {
				logger.error("保存留言动态提醒出错", e);
			}
		} catch (Exception e) {
			logger.error("保存留言出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
}
