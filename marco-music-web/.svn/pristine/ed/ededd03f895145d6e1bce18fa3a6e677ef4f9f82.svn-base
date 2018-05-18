package com.marco.music.controller.homepage;

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
import com.marco.music.common.date.DateUtil;
import com.marco.music.service.forum.ForumReplyService;
import com.marco.music.service.news.NewsService;
import com.marco.music.service.recommend.RecommendService;
import com.marco.music.service.singing.SingingService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年7月9日 上午1:06:54
 * 首页Controller
 */
@Controller
public class HomepageController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SingingService singingService;
		
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private ForumReplyService forumReplyService;
	
	/**
	 * 获取各个模块前十个记录
	 */
	@RequestMapping(value="/homepage/getData", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getData(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			//音乐厅
			List<Object[]> singingList = singingService.getTenData();
			for(int i=0; i<singingList.size(); i++) {
				String date = DateUtil.formatDate((Date)singingList.get(i)[2], "yyyy-MM-dd HH:mm");
				singingList.get(i)[2] = date;
			}
		
			//资讯
			List<Object[]> newsList = newsService.getTenData();
			for(int i=0; i<newsList.size(); i++) {
				String date = DateUtil.formatDate((Date)newsList.get(i)[2], "yyyy-MM-dd HH:mm");
				newsList.get(i)[2] = date;
			}
			
			//荐读
			List<Object[]> recommendList = recommendService.getTenData();
			for(int i=0; i<recommendList.size(); i++) {
				String date = DateUtil.formatDate((Date)recommendList.get(i)[2], "yyyy-MM-dd HH:mm");
				recommendList.get(i)[2] = date;
			}
			
			//家园
			List<Object[]> forumList = forumReplyService.getTenData();
			for(int i=0; i<forumList.size(); i++) {
				String date = DateUtil.formatDate((Date)forumList.get(i)[2], "yyyy-MM-dd HH:mm");
				forumList.get(i)[2] = date;
			}
			
			result.put("singingList", singingList);
			result.put("newsList", newsList);
			result.put("recommendList", recommendList);
			result.put("forumList", forumList);
			
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("取出记录的时候发生异常", e);
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
}
