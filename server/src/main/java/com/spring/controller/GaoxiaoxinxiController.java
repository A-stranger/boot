package com.spring.controller;

import com.spring.dao.GaoxiaoxinxiMapper;
import com.spring.entity.Gaoxiaoxinxi;
import com.spring.service.GaoxiaoxinxiService;
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
 * 高校信息 */
@Controller
public class GaoxiaoxinxiController extends BaseController
{
    @Autowired
    private GaoxiaoxinxiMapper dao;
    @Autowired
    private GaoxiaoxinxiService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/gaoxiaoxinxi_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Gaoxiaoxinxi.class); //  创建一个扩展搜索类
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
        List<Gaoxiaoxinxi> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
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
                if(!Request.get("gaoxiaomingcheng").equals("")) {
            where += " AND gaoxiaomingcheng LIKE '%"+Request.get("gaoxiaomingcheng")+"%' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/gaoxiaoxinxi_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Gaoxiaoxinxi.class);  //  创建一个扩展搜索类
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

            List<Gaoxiaoxinxi> list = service.selectPageExample(example , page , pagesize);
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
    @RequestMapping("/gaoxiaoxinxilist")
    public String index()
    {
            String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Gaoxiaoxinxi.class);
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
                    List<Gaoxiaoxinxi> list = service.selectPageExample(example , page , 12);
            
            assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
        assign("where" , where);
        assign("orderby" , order);
        assign("sort" , sort);
        return json();
    }



        @RequestMapping("/gaoxiaoxinxi_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/gaoxiaoxinxi_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Gaoxiaoxinxi mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/gaoxiaoxinxiinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Gaoxiaoxinxi post = new Gaoxiaoxinxi();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setBianhao(Request.get("bianhao"));

        post.setGaoxiaomingcheng(Request.get("gaoxiaomingcheng"));

        post.setTupian(Request.get("tupian"));

        post.setGaoxiaodizhi(Request.get("gaoxiaodizhi"));

        post.setGaoxiaofuzeren(Request.get("gaoxiaofuzeren"));

        post.setLianxidianhua(Request.get("lianxidianhua"));

        post.setGaoxiaoxiangqing(util.DownloadRemoteImage.run(Request.get("gaoxiaoxiangqing")));

        post.setFaburen(Request.get("faburen"));

        post.setAddtime(Info.getDateStr());
    
        post.setIssh("否");

        

                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('高校信息' , '新增' , '编号："+request.getParameter("bianhao")+"<br>高校名称："+request.getParameter("gaoxiaomingcheng")+"<br>高校地址："+request.getParameter("gaoxiaodizhi")+"<br>高校负责人："+request.getParameter("gaoxiaofuzeren")+"<br>联系电话："+request.getParameter("lianxidianhua")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");




        if(isAjax()){
            return jsonResult(post);

        }
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/gaoxiaoxinxiupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Gaoxiaoxinxi post = new Gaoxiaoxinxi();
        // 将前台表单数据填充到实体类
        if(!Request.get("bianhao").equals(""))
        post.setBianhao(Request.get("bianhao"));
                if(!Request.get("gaoxiaomingcheng").equals(""))
        post.setGaoxiaomingcheng(Request.get("gaoxiaomingcheng"));
                if(!Request.get("tupian").equals(""))
        post.setTupian(Request.get("tupian"));
                if(!Request.get("gaoxiaodizhi").equals(""))
        post.setGaoxiaodizhi(Request.get("gaoxiaodizhi"));
                if(!Request.get("gaoxiaofuzeren").equals(""))
        post.setGaoxiaofuzeren(Request.get("gaoxiaofuzeren"));
                if(!Request.get("lianxidianhua").equals(""))
        post.setLianxidianhua(Request.get("lianxidianhua"));
                if(!Request.get("gaoxiaoxiangqing").equals(""))
        post.setGaoxiaoxiangqing(util.DownloadRemoteImage.run(Request.get("gaoxiaoxiangqing")));
            if(!Request.get("faburen").equals(""))
        post.setFaburen(Request.get("faburen"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('高校信息' , '更新' , '编号："+request.getParameter("bianhao")+"<br>高校名称："+request.getParameter("gaoxiaomingcheng")+"<br>高校地址："+request.getParameter("gaoxiaodizhi")+"<br>高校负责人："+request.getParameter("gaoxiaofuzeren")+"<br>联系电话："+request.getParameter("lianxidianhua")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");



        if(isAjax()){
            return jsonResult(post);
        }
        
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/gaoxiaoxinxi_detail")
    public String detail()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Gaoxiaoxinxi map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map" , map);  // 把数据写到前台
            return json();   // 将数据写给前端
    }
    /**
     *  前台详情
     */
    @RequestMapping("/gaoxiaoxinxidetail")
    public String detailweb()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Gaoxiaoxinxi map = service.find(id);
                        
                if(!checkLogin()){
            assign("isCollect" , false);
        }else{
            assign("isCollect" , Query.make("shoucangjilu").where("username",session.getAttribute("username")).where("biao" , "gaoxiaoxinxi").where("xwid",id).count()>0);
        }

        
        assign("map" , map);
        return json();   // 将数据写给前端
    }
        /**
    *  删除
    */
    @RequestMapping("/gaoxiaoxinxi_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("gaoxiaoxinxi").find(id);

                service.delete(id);// 根据id 删除某行数据
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('高校信息' , '删除' , '编号："+map.get("bianhao")+"<br>高校名称："+map.get("gaoxiaomingcheng")+"<br>高校地址："+map.get("gaoxiaodizhi")+"<br>高校负责人："+map.get("gaoxiaofuzeren")+"<br>联系电话："+map.get("lianxidianhua")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
