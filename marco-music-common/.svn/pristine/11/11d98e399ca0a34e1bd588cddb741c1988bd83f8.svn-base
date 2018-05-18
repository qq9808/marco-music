package com.marco.music.common.http;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpStatus;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

/**
 * @author Marco
 * @date 2017年6月6日 上午11:18:53
 * HttpClient发送请求.
 */
public class Http {
	
	public static String doGet(String url){
        try {
        	HttpClient client = new DefaultHttpClient();
            //发送get请求
            HttpGet request = new HttpGet(url);
            HttpResponse response = client.execute(request);
 
            /**请求发送成功，并得到响应**/
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                /**读取服务器返回过来的json字符串数据**/
                String strResult = EntityUtils.toString(response.getEntity());
                
                return strResult;
            }
        } 
        catch (IOException e) {
        	e.printStackTrace();
        }
        
        return null;
	}

	public static String post(String url, Map params){
		
		BufferedReader in = null;  
		
		try {  
            // 定义HttpClient  
            HttpClient client = new DefaultHttpClient();  
            // 实例化HTTP方法  
            HttpPost request = new HttpPost();  
            request.setURI(new URI(url));
            
            //设置参数
            List<NameValuePair> nvps = new ArrayList<NameValuePair>(); 
            for (Iterator iter = params.keySet().iterator(); iter.hasNext();) {
    			String name = (String) iter.next();
    			String value = String.valueOf(params.get(name));
    			nvps.add(new BasicNameValuePair(name, value));
    		}
            request.setEntity(new UrlEncodedFormEntity(nvps,HTTP.UTF_8));
            
            HttpResponse response = client.execute(request);  
            int code = response.getStatusLine().getStatusCode();
            if(code == 200){	//请求成功
            	in = new BufferedReader(new InputStreamReader(response.getEntity().getContent(),"utf-8"));
                StringBuffer sb = new StringBuffer("");  
                String line = "";  
                String NL = System.getProperty("line.separator");  
                while ((line = in.readLine()) != null) {  
                    sb.append(line + NL);  
                }                
                in.close();                  
                return sb.toString();
            }
            else{	
            	System.out.println("状态码：" + code);
            	return null;
            }
        }
        catch(Exception e){
        	e.printStackTrace();      	
        	return null;
        }	
	}
	
	/**
	 * 
	 * @param method
	 *            请求方法
	 * @param param请求参数
	 * @param url
	 * @param charset字符集
	 * @return 返回请求结果
	 * @throws IOException
	 */
	public static String sendHttpReq(String method, String param, String url, String charset) throws IOException {

		BufferedOutputStream bufout = null;
		StringBuilder sb = null;
		BufferedReader bufrd = null;
		HttpURLConnection conn = null;
		try {
			URL urlobj = new URL(url);
			conn = (HttpURLConnection) urlobj.openConnection();
			conn.setDoInput(true);// 读取指定URL服务器资源
//			conn.setRequestMethod(method);
			if (param != null) {
				conn.setDoOutput(true);// 写入数据到指定url服务器
			}
			conn.setUseCaches(false);// 设置是否缓存
			conn.setConnectTimeout(1000 * 60);// 毫秒，连接一分钟超时
			conn.setReadTimeout(1000 * 60);// 读数据一分钟超时
			if (param != null) {
				bufout = new BufferedOutputStream(conn.getOutputStream());
				bufout.write(param.getBytes(charset));
				bufout.flush();
			}

			bufrd = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));
			String line = null;
			sb = new StringBuilder();
			while ((line = bufrd.readLine()) != null) {
				sb.append(line).append("\n");
			}
			return sb.toString();
		} finally {
			closeAll(bufrd,null, bufout, conn);
		}
	}
	
	public static void closeAll(Reader in,InputStream input, OutputStream out, HttpURLConnection conn) {
		if (in != null) {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (input != null) {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (out != null) {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			conn.disconnect();
		}
	}
	
}
