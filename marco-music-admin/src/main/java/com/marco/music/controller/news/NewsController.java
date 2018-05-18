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
import com.marco.music.common.string.StringTool;
import com.marco.music.model.admin.Admin;
import com.marco.music.model.news.News;
import com.marco.music.service.news.NewsService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年6月1日 上午10:03:59
 * 资讯Controller.
 */
@Controller
public class NewsController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private NewsService newsService;
	
	/**
	 * 资讯页面
	 */
	@RequestMapping("/news/page")
	public String newsPage(Integer curPage, HttpServletRequest request, HttpServletResponse response) {
	
		try {
			
			Page page = new Page();
			
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(15);
			
			News news = new News();
			int count = newsService.countNewsByCondition(news);
			page.setAllRecordNum(count);
			page.setTotalPage(page.getTotalPage());
			Integer startRow = page.getStartRow();
			
			List<News> list = newsService.searchNewsByCondition(news, startRow, page.getFetchSize());
			
			request.setAttribute("page", page);
			request.setAttribute("list", list); 			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("打开资讯后台出错", e.fillInStackTrace());
		}
		
		return "/news/news";
	}
	
	/**
	 * 保存资讯
	 */
	@RequestMapping(value="/news/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String forumSave(HttpServletRequest request, HttpServletResponse response,
			String title, String content) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {			
			//这些参数不能为空
			if(StringTool.isEmpty(title) || StringTool.isEmpty(content)) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			Object adminObj = request.getSession().getAttribute(Keyword.ADMIN);
			Admin admin = (Admin)adminObj;
			News news = new News();
			
			news.setTitle(title);
			news.setContent(content);
			news.setCreateTime(new Date());
			news.setAdminID(admin.getId());
			
			newsService.save(news);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
		} catch (Exception e) {
			logger.error("保存资讯出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
			
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
	/**
	 * 删除资讯
	 */
	@RequestMapping(value="/news/delete", produces="application/json; charset=utf-8")
	@ResponseBody
	public String forumDelete(HttpServletRequest request, HttpServletResponse response,
			Integer id) {
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			//这些参数不能为空
			if(id == null) {
				result.put("state", CodeAndMsg.PARAM_ERROR_CODE);
				result.put("msg", CodeAndMsg.PARAM_ERROR_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			newsService.delete(id);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
		} catch (Exception e) {
			logger.error("删除资讯出错", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
}
