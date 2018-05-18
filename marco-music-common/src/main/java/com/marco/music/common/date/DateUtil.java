package com.marco.music.common.date;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Marco
 * @date 2017年9月2日 上午1:39:42
 * 日期工具类.
 */
public class DateUtil {

	/**
	 * 获取指定格式的日期
	 */
	public static String getFormatDate(String format){
		SimpleDateFormat sdfDays = new SimpleDateFormat(format);
		return sdfDays.format(new Date());
	}
	
	/**
	 * 转换指定格式的日期
	 */
	public static String formatDate(Date date, String format){
		SimpleDateFormat sdfDays = new SimpleDateFormat(format);
		return sdfDays.format(date);
	}
	
}
