

export default [
        {
        label:'学生管理',
        to:'',
        children:[
                        {
                label:'添加学生',
                to:'/admin/xueshengadd',
            },
                        {
                label:'学生查询',
                to:'/admin/xuesheng',
            },
                        {
                label:'学生导入',
                to:'/admin/xueshengimport',
            },
                    ]
    },
        {
        label:'高校信息管理',
        to:'',
        children:[
                        {
                label:'添加高校信息',
                to:'/admin/gaoxiaoxinxiadd',
            },
                        {
                label:'我的高校信息',
                to:'/admin/gaoxiaoxinxi_faburen',
            },
                    ]
    },
        {
        label:'招聘信息管理',
        to:'',
        children:[
                        {
                label:'招聘信息查询',
                to:'/admin/zhaopinxinxi',
            },
                    ]
    },
    //     {
    //     label:'调查问卷管理',
    //     to:'',
    //     children:[
    //                     {
    //             label:'添加类型',
    //             to:'/admin/leixingadd',
    //         },
    //                     {
    //             label:'类型查询',
    //             to:'/admin/leixing',
    //         },
    //                     {
    //             label:'添加调查问卷',
    //             to:'/admin/diaochawenjuanadd',
    //         },
    //                     {
    //             label:'调查问卷列表',
    //             to:'/admin/diaochawenjuan_faburen',
    //         },
    //                     {
    //             label:'问卷题目列表',
    //             to:'/admin/shiti_faburen',
    //         },
    //                     {
    //             label:'答题详情列表',
    //             to:'/admin/jieguo',
    //         },
    //                     {
    //             label:'问卷结果列表',
    //             to:'/admin/wenjuanjieguo',
    //         },
    //                 ]
    // },
        {
        label:'个人中心',
        to:'',
        children:[
                        {
                label:'修改个人资料',
                to:'/admin/gaoxiaoguanliyuanupdtself',
            },
                        {
                label:'修改密码',
                to:'/admin/mod',
            },
                    ]
    },
    ]
