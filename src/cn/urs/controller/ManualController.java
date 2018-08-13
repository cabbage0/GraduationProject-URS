package cn.urs.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("manualController")
public class ManualController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	/**
	 * 用于主页面跳转
	 * @return
	 */
	@RequestMapping(value="/uploadManual")
	public String findClasses(){
		return "manual/uploadManual";
	}
	
	
	/**
	 * 文件上传
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/publishManual",method=RequestMethod.POST)  
    public String publishManual(MultipartFile file,HttpServletRequest request,HttpSession session) throws IOException{  
        
		String path = request.getSession().getServletContext().getRealPath("/")+"statics/upload";
		System.out.println("come into publishManual,path is:"+path);
		
        String fileName = file.getOriginalFilename();
        //把文件名放入seesion供下载时使用
        session.setAttribute("fileName", fileName);
        System.out.println("come into publishManual,session is :"+session);
        System.out.println("come into publishManual,fileName is:"+fileName);
        
        File dir = new File(path,fileName);          
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
        //MultipartFile自带的解析方法  
        file.transferTo(dir);  
        return "manual/uploadManual";  
    }  
	
	
	@RequestMapping(value="/downloadManual")
	public ModelAndView downloadManual(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{  
		
		String filename = (String) session.getAttribute("fileName");
		System.out.println("come into downloadManual,filename is :"+filename);
		boolean flag = false;
		if(null!=filename){
			flag = true;
	        String fileName = request.getSession().getServletContext().getRealPath("/")+"statics/upload/"+filename;  
	        //获取输入流  
	        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));  
	        //假如以中文名下载的话  
	        String chinesename = "下载文件.txt";  
	        //转码，免得文件名中文乱码  
	        chinesename = URLEncoder.encode(filename,"UTF-8");  
	        //设置文件下载头  
	        response.addHeader("Content-Disposition", "attachment;filename=" + chinesename);    
	        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
	        response.setContentType("multipart/form-data");   
	        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
	        int len = 0;  
	        while((len = bis.read()) != -1){  
	            out.write(len);  
	            out.flush();  
	        }  
	        out.close(); 
//	        session.removeAttribute("fileName");
	        return null;
		}else{
//			flag = false;
			ModelAndView model = new ModelAndView();
//			model.addObject("flag",flag);
			model.setViewName("login/login");
//			System.out.println("come into downloadManual,model is:"+model);
			return model;
		}
    }  
}
