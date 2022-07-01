export default [
    {
        label: '个人简历管理',
        to: '',
        children: [
            {
                label: '添加简历类型',
                to: '/admin/jianlileixingadd',
            },
            {
                label: '简历类型查询',
                to: '/admin/jianlileixing',
            },
            {
                label: '个人简历列表',
                to: '/admin/gerenjianli',
            },
        ]
    },
    {
        label: '信息管理与维护',
        to: '',
        children: [
            {
                label: '添加高校管理员',
                to: '/admin/gaoxiaoguanliyuanadd',
            },
            {
                label: '高校管理员管理',
                to: '/admin/gaoxiaoguanliyuan',
            },
            {
                label: '用人单位管理',
                to: '/admin/yongrendanwei',
            },
            {
                label: '学生信息管理',
                to: '/admin/xuesheng',
            },
        ]
    },
    {
        label: '高校信息管理',
        to: '',
        children: [
            {
                label: '高校信息查询',
                to: '/admin/gaoxiaoxinxi',
            },
        ]
    },
    // {
    //     label: '调查问卷管理',
    //     to: '',
    //     children: [
    //         {
    //             label: '添加类型',
    //             to: '/admin/leixingadd',
    //         },
    //         {
    //             label: '类型查询',
    //             to: '/admin/leixing',
    //         },
    //         {
    //             label: '添加调查问卷',
    //             to: '/admin/diaochawenjuanadd',
    //         },
    //         {
    //             label: '调查问卷列表',
    //             to: '/admin/diaochawenjuan',
    //         },
    //         {
    //             label: '问卷题目列表',
    //             to: '/admin/shiti',
    //         },
    //         {
    //             label: '答题详情列表',
    //             to: '/admin/jieguo',
    //         },
    //         {
    //             label: '问卷结果列表',
    //             to: '/admin/wenjuanjieguo',
    //         },
    //     ]
    // },
    {
        label: '招聘信息管理',
        to: '',
        children: [
            {
                label: '招聘信息列表',
                to: '/admin/zhaopinxinxi',
            },
        ]
    },
    // {
    //     label: '在线测试管理',
    //     to: '',
    //     children: [
    //         {
    //             label: '测试试卷列表',
    //             to: '/admin/ceshishijuan',
    //         },
    //         {
    //             label: '测试试题列表',
    //             to: '/admin/ceshishiti',
    //         },
    //         {
    //             label: '测试结果列表',
    //             to: '/admin/ceshijieguo',
    //         },
    //         {
    //             label: '测试成绩查询',
    //             to: '/admin/ceshichengji',
    //         },
    //     ]
    // },
    {
        label: '求职申请管理',
        to: '',
        children: [
            {
                label: '求职申请',
                to: '/admin/qiuzhishenqing',
            },
            {
                label: '申请审核',
                to: '/admin/shenqingshenhe',
            },
            {
                label: '面试通知',
                to: '/admin/mianshitongzhi',
            },
            {
                label: '面试结果',
                to: '/admin/mianshijieguo',
            },
        ]
    },
    {
        label: '统计管理',
        to: '',
        children: [
            {
                label: '就业人数统计',
                to: '/admin/total?src=to_jiuye.jsp',
            },
            {
                label: '招聘人数统计',
                to: '/admin/total?src=to_zhaopinrenshu.jsp',
            },
        ]
    },

    // {
    //     label: '新闻管理',
    //     to: '',
    //     children: [
    //         {
    //             label: '分类添加',
    //             to: '/admin/xinwenfenleiadd',
    //         },
    //         {
    //             label: '分类查询',
    //             to: '/admin/xinwenfenlei',
    //         },
    //         {
    //             label: '新闻添加',
    //             to: '/admin/xinwenxinxiadd',
    //         },
    //         {
    //             label: '新闻查询',
    //             to: '/admin/xinwenxinxi',
    //         },
    //     ]
    // },
    {
        label: '交流管理',
        to: '',
        children: [
            {
                label: '交流管理',
                to: '/admin/jiaoliu',
            },
        ]
    },
    {
        label: '操作日志管理',
        to: '',
        children: [
            {
                label: '操作日志列表',
                to: '/admin/logs',
            },
        ]
    },
    {
        label: '账号管理',
        to: '',
        children: [
            {
                label: '管理员账号管理',
                to: '/admin/admins',
            },
            {
                label: '管理员账号添加',
                to: '/admin/adminsadd',
            },
            {
                label: '密码修改',
                to: '/admin/mod',
            },
        ]
    },
    {
        label: '系统管理',
        to: '',
        children: [
            {
                label: '友情链接添加',
                to: '/admin/youqinglianjieadd',
            },
            {
                label: '友情链接管理',
                to: '/admin/youqinglianjie',
            },
            {
                label: '轮播图添加',
                to: '/admin/lunbotuadd',
            },
            {
                label: '轮播图管理',
                to: '/admin/lunbotu',
            },
        ]
    },
]
