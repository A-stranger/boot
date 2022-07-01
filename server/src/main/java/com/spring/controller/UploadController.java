package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 上传控制器
 */
@Controller
public class UploadController extends BaseController{

    /**
     * 上传文件
     * @param fujian
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/upload_re")
    public String Upload(MultipartFile fujian) throws Exception
    {
        String fileName = fujian.getOriginalFilename();//获取初始文件的文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));//获取文件的后缀
        fileName = UUID.randomUUID()+suffixName;//随机生成一个整数，加上后缀来命名
        String filePath = getFolder("upload");//指定文件保存的路径

        try{
            File file = new File(getPhysicalPath(filePath)+"/"+fileName);//文件保存路径
            fujian.transferTo(file);
            request.setAttribute("url",filePath+"/"+fileName);//将文件路径返回给前端
            if(isAjax())
            {
                return jsonResult(request.getAttribute("url"));
            }
            return "upload";
        }catch (Exception e){//捕获抛出异常
            return showError(e.getMessage());
        }
    }

    private String getFolder(String path) {
        //设置日期的格式
        SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
        //路径为当前目录加上时间日期
        path += "/" + formater.format(new Date());
        //文件的位置为得到的相对路径
        File dir = new File(this.getPhysicalPath(path));
        if (!dir.exists()) {
            try {
                dir.mkdirs();
            } catch (Exception e) {
                return "";
            }
        }
        return path;
    }

    /**
     * 根据传入的虚拟路径获取物理路径
     *
     * @param path
     * @return
     */
    private String getPhysicalPath(String path) {
        String servletPath = this.request.getServletPath();
        String realPath = this.request.getSession().getServletContext()
                .getRealPath(servletPath);
        return new File(realPath).getParent() +"/" +path;
    }
}
