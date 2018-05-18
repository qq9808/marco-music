package com.marco.music.controller.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marco.music.common.code.CodeAndMsg;
import com.marco.music.common.keyword.Keyword;
import com.marco.music.common.string.StringTool;
import com.marco.music.model.user.User;
import com.marco.music.service.user.UserService;

import net.sf.json.JSONObject;

import sun.misc.BASE64Decoder;  

/**
 * @author Marco
 * @date 2017年5月30日 上午2:17:19
 * 上传Controller.
 */
@Controller
public class UploadController {

	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UserService userService;
	
	/**
	 * 上传头像div
	 */
	@RequestMapping("/upload/touxiang/page")
	public String uploadTouxiangPage(HttpServletRequest request, HttpServletResponse response) {
		return "/userCenter/upload_page";
	}
	
	/**
	 * 上传头像
	 */
	@RequestMapping(value="/upload/touxiang", produces="application/json; charset=utf-8")
	@ResponseBody
	public String uploadTouxiang(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			Object userObj = request.getSession().getAttribute(Keyword.USER);
			
			if(userObj == null) {
				result.put("state", CodeAndMsg.USER_NOT_EXIST);
				result.put("msg", CodeAndMsg.USER_NOT_EXIST_MSG);
				JSONObject jsonObject = JSONObject.fromObject(result);
				return jsonObject.toString();
			}
			
			String strImage = request.getParameter("strImage");
			User user = (User)userObj;
					
			boolean uploadResult = false;
			String imgName = "";
			if(StringTool.isNotEmpty(strImage)) {
				if(user.getId() != null) {
					imgName = user.getId().toString() + System.currentTimeMillis() + ".jpg";
				}
				uploadResult = GenerateImage(strImage, imgName);
			}
			else {
				result.put("state", CodeAndMsg.EXCEPTION_CODE);
				result.put("msg", CodeAndMsg.EXCEPTION_MSG);
			}		
			
			//成功上传之后
			if(uploadResult) {		
				//保存对象头像到数据库
				user.setTxImg(imgName);
				userService.update(user);				
				result.put("state", CodeAndMsg.SUCCESS_CODE);
				result.put("msg", CodeAndMsg.SUCCESS_MSG);
			}
			else {
				result.put("state", CodeAndMsg.EXCEPTION_CODE);
				result.put("msg", CodeAndMsg.EXCEPTION_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("上传图像失败", e.fillInStackTrace());
			result.put("state", CodeAndMsg.EXCEPTION_CODE);
			result.put("msg", CodeAndMsg.EXCEPTION_MSG);
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}

	/**
	 * base64字符串转化成图片  
	 */
    public static boolean GenerateImage(String imgStr, String imgName) {   //对字节数组字符串进行Base64解码并生成图片  
        
    	//图像数据为空  
    	if(StringTool.isEmpty(imgStr) || StringTool.isEmpty(imgName)) {   		
    		return false;
    	}
  
        BASE64Decoder decoder = new BASE64Decoder();  
        
        try {               	
        	//Base64解码  
            byte[] b = decoder.decodeBuffer(imgStr);  
            for(int i=0;i<b.length;++i) {  
                if(b[i]<0)  
                {//调整异常数据  
                    b[i]+=256;  
                }  
            }  
            //生成jpg图片  
            String imgFilePath = Keyword.TX_PATH + File.separator + imgName;
            OutputStream out = new FileOutputStream(imgFilePath);      
            out.write(b);  
            out.flush();  
            out.close();  
            return true;  
        }   
        catch (Exception e) {  
            e.printStackTrace();   	
        }  
        
        return false;  
    }  
	
	/*上传头像
	@RequestMapping(value="/upload/touxiang", produces="application/json; charset=utf-8")
	@ResponseBody
	public String uploadTouxiang(HttpServletRequest request, HttpServletResponse response) {
		
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
			
			if (ServletFileUpload.isMultipartContent(request)) {  
				   
		        //1.创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录  
		        DiskFileItemFactory factory = new DiskFileItemFactory();  
		        factory.setRepository(new File(Keyword.TX_TEMP_PATH)); //设置磁盘缓冲路径
		        factory.setSizeThreshold(1024*1024); //设置创建缓冲大小 
		  
		        //2.创建ServletFileUpload对象，并设置上传文件的大小限制。  
		        ServletFileUpload sfu = new ServletFileUpload(factory);  
		        sfu.setSizeMax(Keyword.TX_MAX_SIZE * 1024 * 1024);   //不能超过10M 
		        sfu.setHeaderEncoding("utf-8");  
		  
		        //3.调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。  
		        @SuppressWarnings("unchecked")  
		        List<FileItem> fileItemList = sfu.parseRequest(request);  
		        Iterator<FileItem> fileItems = fileItemList.iterator();  
		  
		        // 4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件  
		        while(fileItems.hasNext()) {  
		        	FileItem fileItem = fileItems.next();  
		            // 普通表单元素  
		            if (fileItem.isFormField()) {  
			            String name = fileItem.getFieldName();     //name属性值  
			            String value = fileItem.getString("utf-8");//name对应的value值  	  
			            System.out.println(name + " = " + value);  
		            }  
		            else {  
			            String fileName = fileItem.getName();    //文件名称  
			            System.out.println("原文件名：" + fileName); //头像.jpg  
			  
			            String suffix = fileName.substring(fileName.lastIndexOf('.'));  
			            System.out.println("扩展名：" + suffix);// .jpg  
			  
			            //新文件名（唯一）  
			            Date date = new Date();
			            String newFileName = user.getId() + date.getTime() + suffix;  
			            System.out.println("新文件名：" + newFileName);
			  
			            //5.调用FileItem的write()方法，写入文件  
			            File file = new File(Keyword.TX_PATH + File.separator + newFileName);  
			            System.out.println(file.getAbsolutePath());  
			            fileItem.write(file);  
			  
			            //6.调用FileItem的delete()方法，删除临时文件  
			            fileItem.delete();  			
			            String imgURL = Keyword.TX_URL + newFileName;
			            result.put("imgURL", imgURL);
			            result.put("state", CodeAndMsg.SUCCESS_CODE);
						result.put("msg", CodeAndMsg.SUCCESS_MSG);
		            }  
		        }  		  		          	  
		    }  			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObject = JSONObject.fromObject(result);
		return jsonObject.toString();
	}*/
	
}
