package com.spring.controller;

import com.spring.dao.MianshitongzhiMapper;
import com.spring.entity.Mianshitongzhi;
import com.spring.service.MianshitongzhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;
import dao.CommDAO;

import com.spring.entity.Qiuzhishenqing;
import com.spring.service.QiuzhishenqingService;

/**
 * 面试通知 */
@Controller
public class MianshitongzhiController extends BaseController
{
    @Autowired
    private MianshitongzhiMapper dao;
    @Autowired
    private MianshitongzhiService service;

    @Autowired
    private QiuzhishenqingService serviceRead;
    /**
     *  后台列表页
     *
     */
    @RequestMapping("/mianshitongzhi_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Mianshitongzhi.class); //  创建一个扩展搜索类
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
        List<Mianshitongzhi> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
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
        // 判断URL 参数qiuzhishenqingid是否大于0
        if( Request.getInt("qiuzhishenqingid") > 0 ) {
            // 大于0 则写入条件
            where += " AND qiuzhishenqingid='"+Request.getInt("qiuzhishenqingid")+"' ";
        }
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
            if(!Request.get("bianhao").equals("")) {
            where += " AND bianhao LIKE '%"+Request.get("bianhao")+"%' ";
        }
                if(!Request.get("biaoti").equals("")) {
            where += " AND biaoti LIKE '%"+Request.get("biaoti")+"%' ";
        }
                if(!Request.get("shenqingren").equals("")) {
            where += " AND shenqingren LIKE '%"+Request.get("shenqingren")+"%' ";
        }
                if(!Request.get("mianshishijian_start").equals("")) {
            where += " AND mianshishijian >='"+Request.get("mianshishijian_start")+"' ";
        }
        if(!Request.get("mianshishijian_end").equals("")) {
            where += " AND mianshishijian <= '"+Request.get("mianshishijian_end")+"' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/mianshitongzhi_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Mianshitongzhi.class);  //  创建一个扩展搜索类
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

            List<Mianshitongzhi> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }
    /**
     * 申请人列表
     */
    @RequestMapping("/mianshitongzhi_list_shenqingren")
    public String listshenqingren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Mianshitongzhi.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：申请人=当前登录用户
        String where = " shenqingren='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Mianshitongzhi> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }




        @RequestMapping("/mianshitongzhi_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");  // 根据id 获取 求职申请模块中的数据
        Qiuzhishenqing readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        assign("readMap" , readMap);

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/mianshitongzhi_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Mianshitongzhi mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/mianshitongzhiinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Mianshitongzhi post = new Mianshitongzhi();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setQiuzhishenqingid(Request.getInt("qiuzhishenqingid"));

        post.setZhaopinxinxiid(Request.getInt("zhaopinxinxiid"));

        post.setBianhao(Request.get("bianhao"));

        post.setBiaoti(Request.get("biaoti"));

        post.setZhiweileixing(Request.get("zhiweileixing"));

        post.setFaburen(Request.get("faburen"));

        post.setShenqingren(Request.get("shenqingren"));

        post.setMianshishijian(Request.get("mianshishijian"));

        post.setMianshididian(Request.get("mianshididian"));

        post.setMianshiyaoqiu(Request.get("mianshiyaoqiu"));

        post.setAddtime(Info.getDateStr());
    
        post.setQiuzhishenqingid(Request.getInt("qiuzhishenqingid"));

        

                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('面试通知' , '新增' , '编号："+request.getParameter("bianhao")+"<br>标题："+request.getParameter("biaoti")+"<br>面试地点："+request.getParameter("mianshididian")+"<br>面试要求："+request.getParameter("mianshiyaoqiu")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


Query.execute("update qiuzhishenqing set zhuangtai='已通知' where id='"+request.getParameter("qiuzhishenqingid")+"'");




        if(isAjax()){
            return jsonResult(post);

        }
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/mianshitongzhiupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Mianshitongzhi post = new Mianshitongzhi();
        // 将前台表单数据填充到实体类
        if(!Request.get("qiuzhishenqingid").equals(""))
        post.setQiuzhishenqingid(Request.getInt("qiuzhishenqingid"));
            if(!Request.get("zhaopinxinxiid").equals(""))
        post.setZhaopinxinxiid(Request.getInt("zhaopinxinxiid"));
            if(!Request.get("bianhao").equals(""))
        post.setBianhao(Request.get("bianhao"));
                if(!Request.get("biaoti").equals(""))
        post.setBiaoti(Request.get("biaoti"));
                if(!Request.get("zhiweileixing").equals(""))
        post.setZhiweileixing(Request.get("zhiweileixing"));
                if(!Request.get("faburen").equals(""))
        post.setFaburen(Request.get("faburen"));
                if(!Request.get("shenqingren").equals(""))
        post.setShenqingren(Request.get("shenqingren"));
                if(!Request.get("mianshishijian").equals(""))
        post.setMianshishijian(Request.get("mianshishijian"));
                if(!Request.get("mianshididian").equals(""))
        post.setMianshididian(Request.get("mianshididian"));
                if(!Request.get("mianshiyaoqiu").equals(""))
        post.setMianshiyaoqiu(Request.get("mianshiyaoqiu"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('面试通知' , '更新' , '编号："+request.getParameter("bianhao")+"<br>标题："+request.getParameter("biaoti")+"<br>面试地点："+request.getParameter("mianshididian")+"<br>面试要求："+request.getParameter("mianshiyaoqiu")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");



        if(isAjax()){
            return jsonResult(post);
        }
        
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
        /**
    *  删除
    */
    @RequestMapping("/mianshitongzhi_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("mianshitongzhi").find(id);

                service.delete(id);// 根据id 删除某行数据
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('面试通知' , '删除' , '编号："+map.get("bianhao")+"<br>标题："+map.get("biaoti")+"<br>面试地点："+map.get("mianshididian")+"<br>面试要求："+map.get("mianshiyaoqiu")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
