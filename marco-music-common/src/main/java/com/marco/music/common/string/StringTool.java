package com.marco.music.common.string;

/**
 * @author Marco
 * @date 2017年5月21日 下午5:29:51
 * 字符串工具类.
 */
public class StringTool {

	/**
	 * 判断字符串是否为空
	 * 
	 * @param string
	 * @return
	 */
	public static boolean isEmpty(String str) {
		return str == null || str.trim().equals("") || str.trim().equals("null");
	}
	
	/**
	 * 判断字符串是否为非空
	 * 
	 * @param string
	 * @return
	 */
	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}
	
}
