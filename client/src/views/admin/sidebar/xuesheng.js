export default [
    {
        label: '个人简历管理',
        to: '',
        children: [
            {
                label: '添加个人简历',
                to: '/admin/gerenjianliadd',
            },
            {
                label: '我的个人简历',
                to: '/admin/gerenjianli_tianjiaren',
            },
        ]
    },
    {
        label: '调查问卷管理',
        to: '',
        children: [
            {
                label: '我的结果',
                to: '/admin/jieguo_kaoshiren',
            },
            {
                label: '我的问卷结果',
                to: '/admin/wenjuanjieguo_kaoshiren',
            },
        ]
    },
    {
        label: '求职申请管理',
        to: '',
        children: [
            {
                label: '我的求职申请',
                to: '/admin/qiuzhishenqing_shenqingren',
            },
            {
                label: '申请审核查询',
                to: '/admin/shenqingshenhe_shenqingren',
            },
            {
                label: '面试通知查询',
                to: '/admin/mianshitongzhi_shenqingren',
            },
            {
                label: '面试结果查询',
                to: '/admin/mianshijieguo_shenqingren',
            },
        ]
    },
    {
        label: '测试结果管理',
        to: '',
        children: [
            {
                label: '我的测试结果',
                to: '/admin/ceshijieguo_kaoshiren',
            },
            {
                label: '我的测试成绩',
                to: '/admin/ceshichengji_kaoshiren',
            },
        ]
    },
    {
        label: '交流管理',
        to: '',
        children: [
            {
                label: '交流查询',
                to: '/admin/jiaoliu_shouxinren',
            },
        ]
    },
    {
        label: '个人中心',
        to: '',
        children: [
            {
                label: '修改个人资料',
                to: '/admin/xueshengupdtself',
            },
            {
                label: '修改密码',
                to: '/admin/mod',
            },
            {
                label: '我的收藏',
                to: '/admin/shoucangjilu',
            },
        ]
    },
]
