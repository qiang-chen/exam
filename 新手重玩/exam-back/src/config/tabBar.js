const tabBar = [{
        id: 'test',
        name: '试题管理',
        path: '/main/test',
        icon: 'sliders',
        children: [{
                id: 'addTest',
                name: '添加试题',
                path: '/main/test/addTest/null',
                icon: 'smile'
            },
            {
                id: 'typeTest',
                name: '试题分类',
                path: '/main/test/typeTest',
                icon: 'smile'
            },
            {
                id: 'lookTest',
                name: '查看试题',
                path: '/main/test/lookTest',
                icon: 'smile'
            }
        ]
    },
    {
        id: 'user',
        name: '用户管理',
        path: '/main/user',
        icon: 'heart',
        children: [{
                id: 'addUser',
                name: '添加用户',
                path: '/main/user/addUser',
                icon: 'alert'
            },
            {
                id: 'showUser',
                name: '用户展示',
                path: '/main/user/showUser',
                icon: 'camera'
            }
        ]
    },
    {
        id: 'exam',
        name: '考试管理',
        path: '/main/exam',
        icon: 'profile',
        children: [{
                id: 'addExam',
                name: '添加考试',
                path: '/main/exam/addExam',
                icon: 'pie-chart'
            },
            {
                id: 'examList',
                name: '试卷列表',
                path: '/main/exam/examList',
                icon: 'fund'
            }
        ]
    },
    {
        id: 'class',
        name: '班级管理',
        path: '/main/class',
        icon: 'tags',
        children: [{
                id: 'banClass',
                name: '班级管理',
                path: '/main/class/banClass',
                icon: 'appstore'
            },
            {
                id: 'roomClass',
                name: '教室管理',
                path: '/main/class/roomClass',
                icon: 'database'
            },
            {
                id: 'studentClass',
                name: '学生管理',
                path: '/main/class/studentClass',
                icon: 'frown'
            }
        ]
    },
    {
        id: 'read',
        name: '阅卷管理',
        path: '/main/read',
        icon: 'wallet',
        children: [{
            id: "awaitRead",
            name: '待批班级',
            path: '/main/read/awaitRead',
            icon: 'account-book'
        }]
    },
    {
        id: 'student',
        name: '学生主页',
        path: '/main/student',
        icon: 'html5',
        children: [{
            id: "attend",
            name: '参加考试',
            path: '/main/student/attend',
            icon: 'copy'
        }]
    }
];
export default tabBar;