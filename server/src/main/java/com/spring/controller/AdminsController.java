package com.spring.controller;

import com.spring.dao.AdminsMapper;
import com.spring.entity.Admins;
import com.spring.service.AdminsService;
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
 * 管理员 */
@Controller
public class AdminsController extends BaseController
{
    @Autowired
    private AdminsMapper dao;
    @Autowired
    private AdminsService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/admins_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Admins.class); //  创建一个扩展搜索类
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
        List<Admins> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
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
            if(!Request.get("username").equals("")) {
            where += " AND username LIKE '%"+Request.get("username")+"%' ";
        }
            return where;
    }





        @RequestMapping("/admins_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/admins_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Admins mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    @RequestMapping("/admins_updtself")
    public String updtself()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 更新个人资料
        int id = (int)request.getSession().getAttribute("id");
        Admins mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 1);
            return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/adminsinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Admins post = new Admins();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setUsername(Request.get("username"));

        post.setPwd(Request.get("pwd"));

        post.setAddtime(Info.getDateStr());
    

        

                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('管理员' , '新增' , '帐号："+request.getParameter("username")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");




        if(isAjax()){
            return jsonResult(post);

        }
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/adminsupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Admins post = new Admins();
        // 将前台表单数据填充到实体类
        if(!Request.get("username").equals(""))
        post.setUsername(Request.get("username"));
                if(!Request.get("pwd").equals(""))
        post.setPwd(Request.get("pwd"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('管理员' , '更新' , '帐号："+request.getParameter("username")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");



        if(isAjax()){
            return jsonResult(post);
        }
                if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "admins_updtself.do");
        }
        
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
        /**
    *  删除
    */
    @RequestMapping("/admins_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("admins").find(id);

                service.delete(id);// 根据id 删除某行数据
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('管理员' , '删除' , '帐号："+map.get("username")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
