package com.spring.controller;

import com.spring.dao.GerenjianliMapper;
import com.spring.entity.Gerenjianli;
import com.spring.service.GerenjianliService;
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
 * 个人简历 */
@Controller
public class GerenjianliController extends BaseController
{
    @Autowired
    private GerenjianliMapper dao;
    @Autowired
    private GerenjianliService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/gerenjianli_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Gerenjianli.class); //  创建一个扩展搜索类
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
        List<Gerenjianli> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
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
            return where;
    }

    /**
     * 添加人列表
     */
    @RequestMapping("/gerenjianli_list_tianjiaren")
    public String listtianjiaren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Gerenjianli.class);  //  创建一个扩展搜索类
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

            List<Gerenjianli> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }




        @RequestMapping("/gerenjianli_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据

                    assign("jianlileixingList" , new CommDAO().select("SELECT * FROM jianlileixing ORDER BY id desc"));
        return json();   // 将数据写给前端
    }

    @RequestMapping("/gerenjianli_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Gerenjianli mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

                    assign("jianlileixingList" , new CommDAO().select("SELECT * FROM jianlileixing ORDER BY id desc"));
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/gerenjianliinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Gerenjianli post = new Gerenjianli();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
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

        post.setAddtime(Info.getDateStr());
    

        

                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('个人简历' , '新增' , '简历编号："+request.getParameter("jianlibianhao")+"<br>姓名："+request.getParameter("xingming")+"<br>电子邮箱："+request.getParameter("dianziyouxiang")+"<br>联系电话："+request.getParameter("lianxidianhua")+"<br>学历："+request.getParameter("xueli")+"<br>毕业院校："+request.getParameter("biyeyuanxiao")+"<br>所学专业："+request.getParameter("suoxuezhuanye")+"<br>工作经历："+request.getParameter("gongzuojingli")+"<br>自我评价："+request.getParameter("ziwopingjia")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");




        if(isAjax()){
            return jsonResult(post);

        }
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/gerenjianliupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Gerenjianli post = new Gerenjianli();
        // 将前台表单数据填充到实体类
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
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('个人简历' , '更新' , '简历编号："+request.getParameter("jianlibianhao")+"<br>姓名："+request.getParameter("xingming")+"<br>电子邮箱："+request.getParameter("dianziyouxiang")+"<br>联系电话："+request.getParameter("lianxidianhua")+"<br>学历："+request.getParameter("xueli")+"<br>毕业院校："+request.getParameter("biyeyuanxiao")+"<br>所学专业："+request.getParameter("suoxuezhuanye")+"<br>工作经历："+request.getParameter("gongzuojingli")+"<br>自我评价："+request.getParameter("ziwopingjia")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");



        if(isAjax()){
            return jsonResult(post);
        }
        
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/gerenjianli_detail")
    public String detail()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Gerenjianli map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map" , map);  // 把数据写到前台
            return json();   // 将数据写给前端
    }
        /**
    *  删除
    */
    @RequestMapping("/gerenjianli_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("gerenjianli").find(id);

                service.delete(id);// 根据id 删除某行数据
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('个人简历' , '删除' , '简历编号："+map.get("jianlibianhao")+"<br>姓名："+map.get("xingming")+"<br>电子邮箱："+map.get("dianziyouxiang")+"<br>联系电话："+map.get("lianxidianhua")+"<br>学历："+map.get("xueli")+"<br>毕业院校："+map.get("biyeyuanxiao")+"<br>所学专业："+map.get("suoxuezhuanye")+"<br>工作经历："+map.get("gongzuojingli")+"<br>自我评价："+map.get("ziwopingjia")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
