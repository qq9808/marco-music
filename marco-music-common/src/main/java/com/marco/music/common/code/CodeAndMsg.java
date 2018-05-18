package com.marco.music.common.code;

/**
 * @author Marco
 * @date 2017年5月21日 下午9:40:01
 * 状态码及其说明.
 */
public class CodeAndMsg {

	public static final int SUCCESS_CODE   = 200;
	public static final String SUCCESS_MSG = "成功！";
	
	public static final int EXCEPTION_CODE   = 10000;
	public static final String EXCEPTION_MSG = "系统繁忙，请稍后再试";
	
	public static final int PARAM_ERROR_CODE   = 10001;
	public static final String PARAM_ERROR_MSG = "填写信息有误，请在检查后重新填写";
	
	public static final int ACCOUNT_EXIST        = 10002;
	public static final String ACCOUNT_EXIST_MSG = "该用户名已经存在啦，另起一个用户名吧";
	
	public static final int EMAIL_EXIST        = 10002;
	public static final String EMAIL_EXIST_MSG = "该邮箱已经被注册啦，用另外一个邮箱吧";
	
	public static final int LOGIN_MISTAKE        = 10003;
	public static final String LOGIN_MISTAKE_MSG = "用户名或密码错误，请重新输入";
	
	public static final int USER_NOT_EXIST        = 10003;
	public static final String USER_NOT_EXIST_MSG = "找不到用户，请检查您的登录状态";
	
}
