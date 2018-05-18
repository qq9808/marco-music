package com.marco.music.controller.recommend;

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
import com.marco.music.model.recommend.Recommend;
import com.marco.music.model.recommend.RecommendReply;
import com.marco.music.model.user.User;
import com.marco.music.service.notice.NoticeService;
import com.marco.music.service.recommend.RecommendReplyService;
import com.marco.music.service.recommend.RecommendService;

import net.sf.json.JSONObject;

/**
 * @author Marco
 * @date 2017年8月24日 上午10:56:20
 * 荐读Controller.
 */
@Controller
public class RecommendController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RecommendReplyService recommendReplyService;
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 荐读页面
	 */
	@RequestMapping("/recommend/page")
	public String recommendPage(HttpServletRequest request, HttpServletResponse response,
			Integer curPage) {
		
		try {
			
			Page page = new Page();
			
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(20);
			 
			Recommend recommend = new Recommend();
			int count = recommendService.countRecommendByCondition(recommend);
			page.setAllRecordNum(count);
			page.setTotalPage(page.getTotalPage());
			Integer startRow = page.getStartRow();
			
			List<Recommend> list = recommendService.searchRecommendByCondition(recommend, startRow, page.getFetchSize());
			
			request.setAttribute("page", page);
			request.setAttribute("list", list); 
			
		} catch (Exception e) {
			logger.error("打开荐读模块出错", e);
		}
		
		return "/recommend/recommend";
	}
	
	/**
	 * 荐读详情
	 */
	@RequestMapping("/recommend/detail")
	public String newsDetail(HttpServletRequest request, HttpServletResponse response,
			Integer id, Integer curPage) {
		
		try {
			
			Recommend recommend = recommendService.get(id);
			
			//查找该荐读下的所有回复
			Page page = new Page();			
			if(curPage != null) {
				page.setCurPage(curPage);
			}
			page.setFetchSize(99999);
			
			List<Object[]> list = recommendService.findRecommendReplyBySQL(id, 0, 99999);
			
			request.setAttribute("recommend", recommend);	
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			logger.error("打开荐读详情出错", e);
		}
		
		return "/recommend/recommend_detail";
	}

	/**
	 * 保存回复
	 */
	@RequestMapping(value="/recommend/reply/save", produces="application/json; charset=utf-8")
	@ResponseBody
	public String recommendReplySave(HttpServletRequest request, HttpServletResponse response,
			Integer recommendID, String content, Integer level, Integer replyID, Integer authorID, String eventName) {
		
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
			RecommendReply recommendReply = new RecommendReply();
			
			recommendReply.setRecommendID(recommendID);
			recommendReply.setContent(content);
			recommendReply.setLevel(level);
			if(level != null && level == 2) {
				recommendReply.setReplyID(replyID);
			}
			recommendReply.setUserID(user.getId());
			recommendReply.setCreateTime(new Date());
			
			recommendReplyService.save(recommendReply);
			result.put("state", CodeAndMsg.SUCCESS_CODE);
			result.put("msg", CodeAndMsg.SUCCESS_MSG);
			
			if(level != null && level == 2) {
				
			}
			
		} catch (Exception e) {
			logger.error("保存荐读回复出错", e);
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}
	
}
