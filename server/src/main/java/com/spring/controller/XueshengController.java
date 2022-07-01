package com.spring.controller;

import com.spring.dao.XueshengMapper;
import com.spring.entity.Xuesheng;
import com.spring.service.XueshengService;
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
 * 学生 */
@Controller
public class XueshengController extends BaseController
{
    @Autowired
    private XueshengMapper dao;
    @Autowired
    private XueshengService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/xuesheng_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Xuesheng.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();          // 创建一个扩展搜索条件类
        String where = " 1=1 ";   // 创建初始条件为：1=1
        where += getWhere();      // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where);   // 将条件写进上面的扩展条件类中
        if(sort.equals("desc")){        // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc();  // 把sql 语句的列表顺序设置成倒序
        }else{
            example.orderBy(order).asc();   // 把 sql语句顺序 设置成正序
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));  // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1 , page);  // 取两个数的最大值，防止page 小于1
        //service查询数据库，并将数据列表封装在example返回
        List<Xuesheng> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
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
            if(!Request.get("xuehao").equals("")) {
            where += " AND xuehao LIKE '%"+Request.get("xuehao")+"%' ";
        }
                if(!Request.get("xingming").equals("")) {
            where += " AND xingming LIKE '%"+Request.get("xingming")+"%' ";
        }
                if(!Request.get("xingbie").equals("")) {
            where += " AND xingbie ='"+Request.get("xingbie")+"' ";
        }
                if(!Request.get("shouji").equals("")) {
            where += " AND shouji LIKE '%"+Request.get("shouji")+"%' ";
        }
                if(!Request.get("shenfenzheng").equals("")) {
            where += " AND shenfenzheng LIKE '%"+Request.get("shenfenzheng")+"%' ";
        }
            return where;
    }





        /**
    *  导入模版文件
    */
    @RequestMapping("/xuesheng_import")
    public String imports()
    {
        util.Execl xls = new util.Execl(); // 生成导入类
                                        xls.addCol("xuehao","学号");
                                                            xls.addCol("mima","密码");
                                                            xls.addCol("xingming","姓名");
                                            xls.addCol("xingbie","性别");
                                                            xls.addCol("shouji","手机");
                                                            xls.addCol("youxiang","邮箱");
                                                            xls.addCol("shenfenzheng","身份证");
                                            xls.addCol("shifoujiuye","是否就业");
                                                        // 插入一个空数据列，执行导出文件

        List<HashMap> list = xls.imports(Request.get("xls") , request);

        for(HashMap map : list){
                                                                                                                                                                                                                                                                map.put("addtime",Info.getDateStr());
                                    Query.make("xuesheng").insert(map);
        }
        if(isAjax()){
            return jsonResult("ok");
        }
        return "success";
    }
    /**
    *  生成导入模版文件
    */
    @RequestMapping("/xuesheng_importfile")
    public String importFile()
    {
        util.Execl xls = new util.Execl(); // 生成导入导出类
        xls.addCol("xuehao","学号");//添加属性列
           xls.addCol("mima","密码");
           xls.addCol("xingming","姓名");
           xls.addCol("xingbie","性别");
           xls.addCol("shouji","手机");
           xls.addCol("youxiang","邮箱");
           xls.addCol("shenfenzheng","身份证");
           xls.addCol("shifoujiuye","是否就业");
           // 插入一个空数据列，执行导出文件
        List<Map> list = new ArrayList();
        xls.addData(list);
        xls.export("xueshengtemplate",response);
        return "success";
    }
    @RequestMapping("/xuesheng_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/xuesheng_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Xuesheng mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    @RequestMapping("/xuesheng_updtself")
    public String updtself()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 更新个人资料
        int id = (int)request.getSession().getAttribute("id");
        Xuesheng mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 1);
            return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/xueshenginsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        Xuesheng post = new Xuesheng();  // 创建实体类post
        // 设置前台提交上来的数据到实体类中
        post.setXuehao(Request.get("xuehao"));
        post.setMima(Request.get("mima"));
        post.setXingming(Request.get("xingming"));
        post.setXingbie(Request.get("xingbie"));
        post.setShouji(Request.get("shouji"));
        post.setYouxiang(Request.get("youxiang"));
        post.setShenfenzheng(Request.get("shenfenzheng"));
        post.setShifoujiuye(Request.get("shifoujiuye"));
        post.setTouxiang(Request.get("touxiang"));
        post.setAddtime(Info.getDateStr());

            service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('学生' , '新增' , '学号："+request.getParameter("xuehao")+"<br>姓名："+request.getParameter("xingming")+"<br>手机："+request.getParameter("shouji")+"<br>邮箱："+request.getParameter("youxiang")+"<br>身份证："+request.getParameter("shenfenzheng")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");

        if(isAjax()){
            return jsonResult(post);

        }
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/xueshengupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Xuesheng post = new Xuesheng();
        // 将前台表单数据填充到实体类
        if(!Request.get("xuehao").equals(""))
        post.setXuehao(Request.get("xuehao"));
                if(!Request.get("mima").equals(""))
        post.setMima(Request.get("mima"));
                if(!Request.get("xingming").equals(""))
        post.setXingming(Request.get("xingming"));
                if(!Request.get("xingbie").equals(""))
        post.setXingbie(Request.get("xingbie"));
                if(!Request.get("shouji").equals(""))
        post.setShouji(Request.get("shouji"));
                if(!Request.get("youxiang").equals(""))
        post.setYouxiang(Request.get("youxiang"));
                if(!Request.get("shenfenzheng").equals(""))
        post.setShenfenzheng(Request.get("shenfenzheng"));
                if(!Request.get("shifoujiuye").equals(""))
        post.setShifoujiuye(Request.get("shifoujiuye"));
                if(!Request.get("touxiang").equals(""))
        post.setTouxiang(Request.get("touxiang"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('学生' , '更新' , '学号："+request.getParameter("xuehao")+"<br>姓名："+request.getParameter("xingming")+"<br>手机："+request.getParameter("shouji")+"<br>邮箱："+request.getParameter("youxiang")+"<br>身份证："+request.getParameter("shenfenzheng")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");



        if(isAjax()){
            return jsonResult(post);
        }
                if(Request.getInt("updtself") == 1){
            return showSuccess("保存成功" , "xuesheng_updtself.do");
        }
        
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
        /**
    *  删除
    */
    @RequestMapping("/xuesheng_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("xuesheng").find(id);

                service.delete(id);// 根据id 删除某行数据
        Query.execute("INSERT INTO logs(module,operationtype,operationcontent,cx,username) values('学生' , '删除' , '学号："+map.get("xuehao")+"<br>姓名："+map.get("xingming")+"<br>手机："+map.get("shouji")+"<br>邮箱："+map.get("youxiang")+"<br>身份证："+map.get("shenfenzheng")+"' , '"+request.getSession().getAttribute("cx")+"' , '"+request.getSession().getAttribute("username")+"')");


        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
