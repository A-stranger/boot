package com.spring.controller;

import com.spring.dao.ZhaopinxinxiMapper;
import com.spring.entity.Zhaopinxinxi;
import com.spring.service.ZhaopinxinxiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;
import dao.CommDAO;


/**
 * 招聘信息 */
@Controller
public class ZhaopinxinxiController extends BaseController
{
    @Autowired
    private ZhaopinxinxiMapper dao;
    @Autowired
    private ZhaopinxinxiService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/zhaopinxinxi_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Zhaopinxinxi.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();          // 创建一个扩展搜索条件类
        String where = " 1=1 ";   // 创建初始条件为：1=1
        where += getWhere();      // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where);   // 将条件写进上面的扩展条件类中
        if(sort.equals("desc")){        // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc();  // 把sql 语句设置成倒序
        }else{
            example.orderBy(order).asc();   // 把 sql 设置成正序
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));  // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1 , page);  // 取两个数的最大值，防止page 小于1
        List<Zhaopinxinxi> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
        // 将列表写给界面使用
        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        return json();   // 将数据写给前端
    }

    public String getWhere()
    {
        _var = new LinkedHashMap(); // 重置数据
        String where = " ";
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
            if(!Request.get("bianhao").equals("")) {
            where += " AND bianhao LIKE '%"+Request.get("bianhao")+"%' ";
        }
                if(!Request.get("biaoti").equals("")) {
            where += " AND biaoti LIKE '%"+Request.get("biaoti")+"%' ";
        }
                if(!Request.get("zhiweileixing").equals("")) {
            where += " AND zhiweileixing LIKE '%"+Request.get("zhiweileixing")+"%' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/zhaopinxinxi_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Zhaopinxinxi.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：发布人=当前登录用户
        String where = " faburen='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Zhaopinxinxi> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }

    /**
    *  前台列表页
    *
    */
    @RequestMapping("/zhaopinxinxilist")
    public String index()
    {
            String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Zhaopinxinxi.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
                    where += " AND issh='是' ";
                where += getWhere();
        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
                    List<Zhaopinxinxi> list = service.selectPageExample(example , page , 12);
            
            assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
        assign("where" , where);
        assign("orderby" , order);
        assign("sort" , sort);
        return json();
    }



        @RequestMapping("/zhaopinxinxi_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/zhaopinxinxi_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Zhaopinxinxi mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/zhaopinxinxiinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Zhaopinxinxi post = new Zhaopinxinxi();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setBianhao(Request.get("bianhao"));

        post.setBiaoti(Request.get("biaoti"));

        post.setTupian(Request.get("tupian"));

        post.setGongzi(Request.get("gongzi"));

        post.setXueli(Request.get("xueli"));

        post.setJingyan(Request.get("jingyan"));

        post.setZhaopinrenshu(Request.getInt("zhaopinrenshu"));

        post.setZhiweileixing(Request.get("zhiweileixing"));

        post.setGongsifuli(Request.get("gongsifuli"));

        post.setZhiweimiaoshu(util.DownloadRemoteImage.run(Request.get("zhiweimiaoshu")));

        post.setGongzuodidian(Request.get("gongzuodidian"));

        post.setGongsimingcheng(Request.get("gongsimingcheng"));

        post.setGongsijieshao(Request.get("gongsijieshao"));

        post.setFaburen(Request.get("faburen"));

        post.setAddtime(Info.getDateStr());
    
        post.setIssh("否");

        

                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('招聘信息' , '新增' , '编号："+request.getParameter("bianhao")+"<br>标题："+request.getParameter("biaoti")+"<br>工资："+request.getParameter("gongzi")+"<br>学历："+request.getParameter("xueli")+"<br>经验："+request.getParameter("jingyan")+"<br>工作地点："+request.getParameter("gongzuodidian")+"<br>公司名称："+request.getParameter("gongsimingcheng")+"<br>公司介绍："+request.getParameter("gongsijieshao")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");




        if(isAjax()){
            return jsonResult(post);

        }
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/zhaopinxinxiupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Zhaopinxinxi post = new Zhaopinxinxi();
        // 将前台表单数据填充到实体类
        if(!Request.get("bianhao").equals(""))
        post.setBianhao(Request.get("bianhao"));
                if(!Request.get("biaoti").equals(""))
        post.setBiaoti(Request.get("biaoti"));
                if(!Request.get("tupian").equals(""))
        post.setTupian(Request.get("tupian"));
                if(!Request.get("gongzi").equals(""))
        post.setGongzi(Request.get("gongzi"));
                if(!Request.get("xueli").equals(""))
        post.setXueli(Request.get("xueli"));
                if(!Request.get("jingyan").equals(""))
        post.setJingyan(Request.get("jingyan"));
                if(!Request.get("zhaopinrenshu").equals(""))
        post.setZhaopinrenshu(Request.getInt("zhaopinrenshu"));
            if(!Request.get("zhiweileixing").equals(""))
        post.setZhiweileixing(Request.get("zhiweileixing"));
                if(!Request.get("gongsifuli").equals(""))
        post.setGongsifuli(Request.get("gongsifuli"));
                if(!Request.get("zhiweimiaoshu").equals(""))
        post.setZhiweimiaoshu(util.DownloadRemoteImage.run(Request.get("zhiweimiaoshu")));
            if(!Request.get("gongzuodidian").equals(""))
        post.setGongzuodidian(Request.get("gongzuodidian"));
                if(!Request.get("gongsimingcheng").equals(""))
        post.setGongsimingcheng(Request.get("gongsimingcheng"));
                if(!Request.get("gongsijieshao").equals(""))
        post.setGongsijieshao(Request.get("gongsijieshao"));
                if(!Request.get("faburen").equals(""))
        post.setFaburen(Request.get("faburen"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('招聘信息' , '更新' , '编号："+request.getParameter("bianhao")+"<br>标题："+request.getParameter("biaoti")+"<br>工资："+request.getParameter("gongzi")+"<br>学历："+request.getParameter("xueli")+"<br>经验："+request.getParameter("jingyan")+"<br>工作地点："+request.getParameter("gongzuodidian")+"<br>公司名称："+request.getParameter("gongsimingcheng")+"<br>公司介绍："+request.getParameter("gongsijieshao")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");



        if(isAjax()){
            return jsonResult(post);
        }
        
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/zhaopinxinxi_detail")
    public String detail()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Zhaopinxinxi map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map" , map);  // 把数据写到前台
            return json();   // 将数据写给前端
    }
    /**
     *  前台详情
     */
    @RequestMapping("/zhaopinxinxidetail")
    public String detailweb()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Zhaopinxinxi map = service.find(id);
                            
            ArrayList<HashMap> ceshishijuanlist1 = Query.make("ceshishijuan").limit(1000).order("id desc").select();
            assign("ceshishijuanlist1" , ceshishijuanlist1);
                    
                if(!checkLogin()){
            assign("isCollect" , false);
        }else{
            assign("isCollect" , Query.make("shoucangjilu").where("username",session.getAttribute("username")).where("biao" , "zhaopinxinxi").where("xwid",id).count()>0);
        }

        
        assign("map" , map);
        return json();   // 将数据写给前端
    }
        /**
    *  删除
    */
    @RequestMapping("/zhaopinxinxi_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("zhaopinxinxi").find(id);

                service.delete(id);// 根据id 删除某行数据
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('招聘信息' , '删除' , '编号："+map.get("bianhao")+"<br>标题："+map.get("biaoti")+"<br>工资："+map.get("gongzi")+"<br>学历："+map.get("xueli")+"<br>经验："+map.get("jingyan")+"<br>工作地点："+map.get("gongzuodidian")+"<br>公司名称："+map.get("gongsimingcheng")+"<br>公司介绍："+map.get("gongsijieshao")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
