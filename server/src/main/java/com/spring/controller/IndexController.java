package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import util.*;
import java.util.*;
import dao.CommDAO;
import net.jntoo.db.Query;
import com.alibaba.fastjson.*;

/**
 * 首页控制器
 */
@Controller
public class IndexController extends BaseController{

    // 首页
    @RequestMapping(value = {"/" , "index"})
    public String Index()
    {
                    
            ArrayList<HashMap> xinwenxinxilist3 = Query.make("xinwenxinxi").limit(6).order("id desc").select();
            assign("xinwenxinxilist3" , xinwenxinxilist3);
            
            
            ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select();
            assign("bhtList" , bhtList);
            
            
            ArrayList<HashMap> gaoxiaoxinxilist4 = Query.make("gaoxiaoxinxi").where("issh", "是").limit(1).order("id desc").select();
            assign("gaoxiaoxinxilist4" , gaoxiaoxinxilist4);
            
            
            ArrayList<HashMap> zhaopinxinxilist5 = Query.make("zhaopinxinxi").where("issh", "是").limit(3).order("id desc").select();
            assign("zhaopinxinxilist5" , zhaopinxinxilist5);
            
            
            ArrayList<HashMap> diaochawenjuanlist7 = Query.make("diaochawenjuan").limit(5).order("id desc").select();
            assign("diaochawenjuanlist7" , diaochawenjuanlist7);
                            if(isAjax())
        {
            return json();
        }
        return "index";
        
    }



}
