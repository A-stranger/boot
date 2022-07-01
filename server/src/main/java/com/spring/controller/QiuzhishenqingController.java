package com.spring.controller;

import com.spring.dao.QiuzhishenqingMapper;
import com.spring.entity.Qiuzhishenqing;
import com.spring.service.QiuzhishenqingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;
import dao.CommDAO;

import com.spring.entity.Zhaopinxinxi;
import com.spring.service.ZhaopinxinxiService;

/**
 * 求职申请 */
@Controller
public class QiuzhishenqingController extends BaseController
{
    @Autowired
    private QiuzhishenqingMapper dao;
    @Autowired
    private QiuzhishenqingService service;

    @Autowired
    private ZhaopinxinxiService serviceRead;
    /**
     *  后台列表页
     *
     */
    @RequestMapping("/qiuzhishenqing_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Qiuzhishenqing.class); //  创建一个扩展搜索类
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
        List<Qiuzhishenqing> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
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
        // 判断URL 参数zhaopinxinxiid是否大于0
        if( Request.getInt("zhaopinxinxiid") > 0 ) {
            // 大于0 则写入条件
            where += " AND zhaopinxinxiid='"+Request.getInt("zhaopinxinxiid")+"' ";
        }
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
            if(!Request.get("bianhao").equals("")) {
            where += " AND bianhao LIKE '%"+Request.get("bianhao")+"%' ";
        }
                if(!Request.get("biaoti").equals("")) {
            where += " AND biaoti LIKE '%"+Request.get("biaoti")+"%' ";
        }
                if(!Request.get("gerenjianli").equals("")) {
            where += " AND gerenjianli LIKE '%"+Request.get("gerenjianli")+"%' ";
        }
                if(!Request.get("jianlibianhao").equals("")) {
            where += " AND jianlibianhao LIKE '%"+Request.get("jianlibianhao")+"%' ";
        }
                if(!Request.get("xingbie").equals("")) {
            where += " AND xingbie ='"+Request.get("xingbie")+"' ";
        }
                if(!Request.get("xueli").equals("")) {
            where += " AND xueli LIKE '%"+Request.get("xueli")+"%' ";
        }
                if(!Request.get("suoxuezhuanye").equals("")) {
            where += " AND suoxuezhuanye LIKE '%"+Request.get("suoxuezhuanye")+"%' ";
        }
                if(!Request.get("beizhu").equals("")) {
            where += " AND beizhu LIKE '%"+Request.get("beizhu")+"%' ";
        }
                if(!Request.get("shenqingren").equals("")) {
            where += " AND shenqingren LIKE '%"+Request.get("shenqingren")+"%' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/qiuzhishenqing_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Qiuzhishenqing.class);  //  创建一个扩展搜索类
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

            List<Qiuzhishenqing> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }
    /**
     * 添加人列表
     */
    @RequestMapping("/qiuzhishenqing_list_tianjiaren")
    public String listtianjiaren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Qiuzhishenqing.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：添加人=当前登录用户
        String where = " tianjiaren='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Qiuzhishenqing> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }
    /**
     * 申请人列表
     */
    @RequestMapping("/qiuzhishenqing_list_shenqingren")
    public String listshenqingren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Qiuzhishenqing.class);  //  创建一个扩展搜索类
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

            List<Qiuzhishenqing> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }




        @RequestMapping("/qiuzhishenqing_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");  // 根据id 获取 招聘信息模块中的数据
        Zhaopinxinxi readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        assign("readMap" , readMap);

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/qiuzhishenqing_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Qiuzhishenqing mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/qiuzhishenqinginsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Qiuzhishenqing post = new Qiuzhishenqing();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setZhaopinxinxiid(Request.getInt("zhaopinxinxiid"));

        post.setBianhao(Request.get("bianhao"));

        post.setBiaoti(Request.get("biaoti"));

        post.setZhiweileixing(Request.get("zhiweileixing"));

        post.setFaburen(Request.get("faburen"));

        post.setGerenjianli(Request.getInt("gerenjianli"));

        post.setJianlibianhao(Request.get("jianlibianhao"));

        post.setJianlileixing(Request.get("jianlileixing"));

        post.setXingming(Request.get("xingming"));

        post.setXingbie(Request.get("xingbie"));

        post.setNianling(Request.getInt("nianling"));

        post.setDianziyouxiang(Request.get("dianziyouxiang"));

        post.setLianxidianhua(Request.get("lianxidianhua"));

        post.setXueli(Request.get("xueli"));

        post.setBiyeyuanxiao(Request.get("biyeyuanxiao"));

        post.setSuoxuezhuanye(Request.get("suoxuezhuanye"));

        post.setGongzuojingli(Request.get("gongzuojingli"));

        post.setZiwopingjia(Request.get("ziwopingjia"));

        post.setJianliwenjian(Request.get("jianliwenjian"));

        post.setTianjiaren(Request.get("tianjiaren"));

        post.setBeizhu(Request.get("beizhu"));

        post.setZhuangtai(Request.get("zhuangtai"));

        post.setShenqingren(Request.get("shenqingren"));

        post.setAddtime(Info.getDateStr());
    
        post.setZhaopinxinxiid(Request.getInt("zhaopinxinxiid"));

        

                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('求职申请' , '新增' , '编号："+request.getParameter("bianhao")+"<br>标题："+request.getParameter("biaoti")+"<br>备注："+request.getParameter("beizhu")+"<br>状态："+request.getParameter("zhuangtai")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");




        if(isAjax()){
            return jsonResult(post);

        }
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/qiuzhishenqingupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Qiuzhishenqing post = new Qiuzhishenqing();
        // 将前台表单数据填充到实体类
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
                if(!Request.get("gerenjianli").equals(""))
        post.setGerenjianli(Request.getInt("gerenjianli"));
            if(!Request.get("jianlibianhao").equals(""))
        post.setJianlibianhao(Request.get("jianlibianhao"));
                if(!Request.get("jianlileixing").equals(""))
        post.setJianlileixing(Request.get("jianlileixing"));
                if(!Request.get("xingming").equals(""))
        post.setXingming(Request.get("xingming"));
                if(!Request.get("xingbie").equals(""))
        post.setXingbie(Request.get("xingbie"));
                if(!Request.get("nianling").equals(""))
        post.setNianling(Request.getInt("nianling"));
            if(!Request.get("dianziyouxiang").equals(""))
        post.setDianziyouxiang(Request.get("dianziyouxiang"));
                if(!Request.get("lianxidianhua").equals(""))
        post.setLianxidianhua(Request.get("lianxidianhua"));
                if(!Request.get("xueli").equals(""))
        post.setXueli(Request.get("xueli"));
                if(!Request.get("biyeyuanxiao").equals(""))
        post.setBiyeyuanxiao(Request.get("biyeyuanxiao"));
                if(!Request.get("suoxuezhuanye").equals(""))
        post.setSuoxuezhuanye(Request.get("suoxuezhuanye"));
                if(!Request.get("gongzuojingli").equals(""))
        post.setGongzuojingli(Request.get("gongzuojingli"));
                if(!Request.get("ziwopingjia").equals(""))
        post.setZiwopingjia(Request.get("ziwopingjia"));
                if(!Request.get("jianliwenjian").equals(""))
        post.setJianliwenjian(Request.get("jianliwenjian"));
                if(!Request.get("tianjiaren").equals(""))
        post.setTianjiaren(Request.get("tianjiaren"));
                if(!Request.get("beizhu").equals(""))
        post.setBeizhu(Request.get("beizhu"));
                if(!Request.get("zhuangtai").equals(""))
        post.setZhuangtai(Request.get("zhuangtai"));
                if(!Request.get("shenqingren").equals(""))
        post.setShenqingren(Request.get("shenqingren"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('求职申请' , '更新' , '编号："+request.getParameter("bianhao")+"<br>标题："+request.getParameter("biaoti")+"<br>备注："+request.getParameter("beizhu")+"<br>状态："+request.getParameter("zhuangtai")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");



        if(isAjax()){
            return jsonResult(post);
        }
        
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
        /**
    *  删除
    */
    @RequestMapping("/qiuzhishenqing_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("qiuzhishenqing").find(id);

                service.delete(id);// 根据id 删除某行数据
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('求职申请' , '删除' , '编号："+map.get("bianhao")+"<br>标题："+map.get("biaoti")+"<br>备注："+map.get("beizhu")+"<br>状态："+map.get("zhuangtai")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
