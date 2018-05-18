package com.marco.music.controller.weixin;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marco.music.common.weixin.Weixin;

/**
 * @author Marco
 * @date 2017年8月9日 下午2:30:32
 * 接入微信公众号.
 */
@Controller
public class LinkController {

	@RequestMapping("/weixin/link")
	public void link(HttpServletRequest request, HttpServletResponse response,
			String signature, String timestamp, String nonce, String echostr) {
		
		PrintWriter out = null;
		
		try {
			
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			
			if (signature == null) {
				out.write("参数错误！");
			}
			
			boolean result = validSign(signature, Weixin.TOKEN, timestamp, nonce);
			
			if (result) {
				out.write(echostr);
			}
			else {
				out.write("接入失败！");
			}			
							        
		} catch (IOException e) {
			e.printStackTrace();			
		}	
		
		out.flush();
        out.close();
	}
	
	public boolean validSign(String signature, String tocken, String timestamp, String nonce) {
		String[] paramArr = new String[] { tocken, timestamp, nonce };
		Arrays.sort(paramArr);
		StringBuilder sb = new StringBuilder(paramArr[0]);
		sb.append(paramArr[1]).append(paramArr[2]);
		String ciphertext = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(sb.toString().getBytes());
			ciphertext = byteToStr(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	
		return ciphertext != null ? ciphertext.equals(signature.toUpperCase()) : false;
	}

	private String byteToStr(byte[] byteArray) {
		String rst = "";
		for (int i = 0; i < byteArray.length; i++) {
			rst += byteToHex(byteArray[i]);
		}
		return rst;
	}
	
	private String byteToHex(byte b) {
		char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		char[] tempArr = new char[2];
		tempArr[0] = Digit[(b >>> 4) & 0X0F];
		tempArr[1] = Digit[b & 0X0F];
		String s = new String(tempArr);
		return s;
	}
	
}
