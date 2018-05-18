package com.marco.music.controller.news;

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
import com.marco.music.model.news.News;
import com.marco.music.model.news.NewsReply;
import com.marco.music.model.notice.Notice;
import com.marco.music.model.user.User;
import com.marco.music.service.news.NewsReplyService;
import com.marco.music.service.news.NewsService;
import com.marco.music.service.notice.NoticeService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年6月1日 下午4:32:32
 * 资讯Controller.
 */
@Controller
public class NewsController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private NewsReplyService newsReplyService;
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 资讯页面
	 */
	@RequestMapping("/news/page")
	public String newsPage(HttpServletRequest request, HttpServletResponse response,
			Integer curPage) {
		
		try {
			
			Page page = new Page();
			
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(20);
			
			News news = new News();			
			int count = newsService.countNewsByCondition(news);
			page.setAllRecordNum(count);
			page.setTotalPage(page.getTotalPage());
			Integer startRow = page.getStartRow();
			
			List<News> list = newsService.searchNewsByCondition(news, startRow, page.getFetchSize());
			
			request.setAttribute("page", page);
			request.setAttribute("list", list); 			
		} catch (Exception e) {
			logger.error("打开资讯模块出错", e.fillInStackTrace());
		}
			
		return "/news/news";
	}
	
	/**
	 * 资讯详情
	 */
	@RequestMapping("/news/detail")
	public String newsDetail(HttpServletRequest request, HttpServletResponse response,
			Integer id, Integer curPage) {
		
		try {			
			News news = newsService.get(id);			
			
			//查找该资讯下的所有回复
			Page page = new Page();			
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(99999);
			
			List<Object[]> list = newsService.findNewsReplyBySQL(id, 0, 99999);
			
			request.setAttribute("news", news);	
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			logger.error("打开资讯详情出错", e);
		}
			
		return "/news/news_detail";
	}
	
	/**
	 * 保存回复
	 */
	@RequestMapping(value="/news/reply/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String newsReplySave(HttpServletRequest request, HttpServletResponse response,
			Integer newsID, String content, Integer level, Integer replyID, Integer authorID, String eventName) {
		
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
			NewsReply newsReply = new NewsReply();
			
			newsReply.setNewsID(newsID);
			newsReply.setContent(content);
			newsReply.setLevel(level);
			if(level != null && level == 2) {
				newsReply.setReplyID(replyID);
			}
			newsReply.setUserID(user.getId());
			newsReply.setCreateTime(new Date());
			
			newsReplyService.save(newsReply);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
			if(level != null && level == 2) {
				try {
					Notice notice = new Notice();
					notice.setType(Keyword.NOTICE_TYPE_NEWS_REPLY);
					notice.setUserID(authorID);
					notice.setPersonID(user.getId());
					notice.setEventID(newsID);
					notice.setEventName(eventName);
					notice.setCreateTime(new Date());
					notice.setKnow(Keyword.NOT_READ);	
					noticeService.save(notice);
				} catch (Exception e) {
					logger.error("保存资讯动态提醒出错", e);
				}
			}			
		} catch (Exception e) {
			logger.error("保存资讯回复出错", e);
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
	
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
	
}
