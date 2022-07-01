package com.spring.controller;

import dao.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import util.Request;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ChatController extends BaseController{
    @RequestMapping("/chatMessage")
    public String chatMessage()
    {
        String chatid = request.getParameter("chatid");
        int pageNumber = Request.getInt("pageNumber" , 1);
        int pageSize = Request.getInt("pageSize" , 20);
        String offsetMax = Request.get("offsetMax" , "");
        String offsetMin = Request.get("offsetMin" , "");
        String type = Request.get("type");
        List list = new ArrayList();
        if(type.equals("one")){
            // 第一次加载
            list = Query.make("liaotianjilu").where("jiaoliuid",chatid).order("id desc").limit(pageSize).select();
        }else if(type.equals("top")){
            list = Query.make("liaotianjilu").where("jiaoliuid" , chatid)
                    .order("id desc").limit(pageSize)
                    .where("id" ,"<" , offsetMin).select();
        }else if(type.equals("new")){
            list = Query.make("liaotianjilu").where("jiaoliuid" , chatid)
                    .order("id desc").limit(pageSize)
                    .where("id" ,">" , offsetMax).select();
        }
        return jsonResult(list);
    }


}
