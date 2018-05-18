package com.marco.music.common.keyword;

/**
 * @author Marco
 * @date 2017年5月22日 下午11:05:15
 * session的key.
 */
public class Keyword {

	public static final String RETURN_URL = "returnURL";
	
	public static final String USER = "user";
	
	public static final String ADMIN = "admin";
	
	public static final int TX_MAX_SIZE = 10;
	
	public static final String TX_TEMP_PATH = "D:/MarcoMusic/upload/img/touxiang/temp";
	
	public static final String TX_PATH = "D:/MarcoMusic/upload/img/touxiang";
	
	public static final String TX_URL = "/upload/file/img/tx/";
	
	public static final String TIEZI_IMG_PATH = "D:/MarcoMusic/upload/img/tiezi";
	
	public static final String TIEZI_IMG_PREFIX_PATH = "D:/MarcoMusic/upload/img/";
	
	public static final String TIEZI_URL = "/upload/file/img/";
	
	public static final String ACCESS_TOKEN = "access_token";
	
	public static final Integer AUDIO_TYPE = 1;      //音频
	public static final Integer VIDEO_TYPE = 2;		 //视频
	
	public static final Integer NOTICE_TYPE_FEEDBACK = 1;          //留言
	public static final Integer NOTICE_TYPE_SINGING = 2;           //回复翻唱&原创帖子
	public static final Integer NOTICE_TYPE_SINGING_REPLY = 3;     //回复翻唱&原创帖子的评论
	public static final Integer NOTICE_TYPE_FORUM = 4;             //回复论坛帖子
	public static final Integer NOTICE_TYPE_FORUM_REPLY = 5;       //回复论坛帖子的评论
	public static final Integer NOTICE_TYPE_NEWS_REPLY = 6;        //回复资讯帖子的评论
	
	public static final Integer NOT_READ = 0;       //未阅读
	public static final Integer HAD_READ = 1;		//已阅读
	
}
