package com.marco.music.controller.forum;

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
import com.marco.music.model.forum.Forum;
import com.marco.music.model.forum.ForumReply;
import com.marco.music.model.notice.Notice;
import com.marco.music.model.user.User;
import com.marco.music.service.forum.ForumReplyService;
import com.marco.music.service.forum.ForumService;
import com.marco.music.service.notice.NoticeService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年5月24日 下午2:11:12
 * 论坛Controller
 */
@Controller
public class ForumController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private ForumService forumService;
	
	@Autowired
	private ForumReplyService forumReplyService;
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 论坛页面
	 */
	@RequestMapping("/forum/page")
	public String forumPage(HttpServletRequest request, HttpServletResponse response,
			Integer curPage) {
		
		try {
			
			Page page = new Page();
						
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(20);
			
			Forum forum = new Forum();
			int count = forumService.countForumByCondition(forum);
			page.setAllRecordNum(count);
			page.setTotalPage(page.getTotalPage());
			Integer startRow = page.getStartRow();
			
			List<Object[]> list = forumService.searchForumBySQL(startRow, page.getFetchSize());
			
			request.setAttribute("page", page);
			request.setAttribute("list", list);
			request.setAttribute("txURL", Keyword.TX_URL);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("打开论坛模块出错", e.fillInStackTrace());
		}
				
		return "/forum/forum";
	}
		
	/**
	 * 保存帖子
	 */
	@RequestMapping(value="/forum/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String forumSave(HttpServletRequest request, HttpServletResponse response,
			String title, String content) {
		
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
			if(StringTool.isEmpty(title) || StringTool.isEmpty(content)) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			User user = (User)UserObj;
			Forum forum = new Forum();
			
			forum.setTitle(title);
			forum.setContent(content);
			forum.setUserID(user.getId());
			forum.setCreateTime(new Date());
			
			forumService.save(forum);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
		} catch (Exception e) {
			logger.error("保存论坛帖子出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
			
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
	/**
	 * 帖子详情
	 */
	@RequestMapping("/forum/detail")
	public String forumDetail(HttpServletRequest request, HttpServletResponse response,
			Integer id, Integer curPage) {
		
		try {
			
			Object[] forum = forumService.getForum(id);
						
			//查找该帖子下面的回复
			Page page = new Page();			
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(99999);
			
			ForumReply forumReply = new ForumReply();
			int count = forumReplyService.countForumReplyByCondition(forumReply);
			page.setAllRecordNum(count);
			page.setTotalPage(page.getTotalPage());
			Integer startRow = page.getStartRow();
			
			List<Object[]> list = forumReplyService.findForumReplyBySQL(id, startRow, page.getFetchSize());
			
			request.setAttribute("forum", forum);
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("打开论坛帖子出错", e.fillInStackTrace());
		}
		
		return "/forum/forum_detail";
	}
		
	/**
	 * 保存回复
	 */
	@RequestMapping(value="/forum/reply/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String forumReplySave(HttpServletRequest request, HttpServletResponse response,
			Integer forumID, String content, Integer level, Integer replyID, Integer authorID, String eventName) {
		
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
			ForumReply forumReply = new ForumReply();
			
			forumReply.setForumID(forumID);
			forumReply.setContent(content);
			forumReply.setLevel(level);
			if(level != null && level == 2) {
				forumReply.setReplyID(replyID);
			}
			forumReply.setUserID(user.getId());
			forumReply.setCreateTime(new Date());
			
			forumReplyService.save(forumReply);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
			try {
				Notice notice = new Notice();
				if(level != null && level == 1) {
					notice.setType(Keyword.NOTICE_TYPE_FORUM);
				}
				if(level != null && level == 2) {
					notice.setType(Keyword.NOTICE_TYPE_FORUM_REPLY);
				}
				notice.setUserID(authorID);
				notice.setPersonID(user.getId());
				notice.setEventID(forumID);
				notice.setEventName(eventName);
				notice.setCreateTime(new Date());
				notice.setKnow(Keyword.NOT_READ);	
				noticeService.save(notice);
			} catch (Exception e) {
				logger.error("保存论坛动态提醒出错", e);
			}
		} catch (Exception e) {
			logger.error("保存论坛回复出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
			
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
}
