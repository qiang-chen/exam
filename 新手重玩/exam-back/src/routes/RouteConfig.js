import React from 'react';
import Main from '@/containers/main';
import Login from '@/containers/user/login';

const RouteConfig = [{
	path: '/main',
	component: Main,
	name: "主页",
	id: 1,
	children: [{
		path: '/main/test',
		component: React.lazy(() =>
			import('@/containers/main/test')),
		name: "试题管理",
		id: 2,
		children: [{
			path: '/main/test/addTest/:id',
			name: "试题管理",
			id: 3,
			component: React.lazy(() =>
				import('@/containers/main/test/addTest.jsx')
			)
		},
		{
			path: '/main/test/typeTest',
			name: "试题管理",
			id: 4,
			component: React.lazy(() =>
				import('@/containers/main/test/typeTest.jsx')
			)
		},
		{
			path: '/main/test/lookTest',
			name: "试题管理",
			id: 5,
			component: React.lazy(() =>
				import('@/containers/main/test/lookTest.jsx')
			)
		},
		]
	},
	{
		path: '/main/user',
		component: React.lazy(() =>
			import('@/containers/main/user')),
		name: "用户管理",
		id: 6,
		children: [{
			path: '/main/user/addUser',
			name: "用户管理",
			id: 7,
			component: React.lazy(() =>
				import('@/containers/main/user/addUser.jsx')
			)
		},
		{
			path: '/main/user/showUser',
			name: "用户管理",
			id: 8,
			component: React.lazy(() =>
				import('@/containers/main/user/showUser.jsx')
			)
		}
		]
	},
	{
		path: '/main/exam',
		id: 9,
		component: React.lazy(() =>
			import('@/containers/main/exam')),
		name: "考试管理",
		children: [{
			path: '/main/exam/addExam',
			name: "考试管理",
			id: 10,
			component: React.lazy(() =>
				import('@/containers/main/exam/addExam.jsx')
			)
		},
		{
			path: '/main/exam/examList',
			name: "考试管理",
			id: 11,
			component: React.lazy(() =>
				import('@/containers/main/exam/examList.jsx')
			)
		},
		{
			path: '/main/exam/addExamTest/:id',
			name: "考试管理",
			id: 12,
			component: React.lazy(() =>
				import('@/containers/main/exam/addExamTest.jsx')
			)
		}, {
			path: '/main/exam/examDetail/:id',
			name: "考试管理",
			id: 25,
			component: React.lazy(() =>
				import('@/containers/main/exam/examDetail.jsx')
			)
		}
		]
	},
	{
		path: '/main/class',
		id: 13,
		component: React.lazy(() =>
			import('@/containers/main/class')),
		name: "班级管理",
		children: [{
			path: '/main/class/banClass',
			name: "班级管理",
			id: 14,
			component: React.lazy(() =>
				import('@/containers/main/class/banClass.jsx')
			)
		},
		{
			path: '/main/class/roomClass',
			name: "班级管理",
			id: 15,
			component: React.lazy(() =>
				import('@/containers/main/class/roomClass.jsx')
			)
		},
		{
			path: '/main/class/studentClass',
			name: "班级管理",
			id: 16,
			component: React.lazy(() =>
				import('@/containers/main/class/studentClass.jsx')
			)
		},
		]
	},
	{
		path: '/main/read',
		name: "阅卷管理",
		id: 17,
		component: React.lazy(() =>
			import('@/containers/main/read')),
		children: [{
			path: '/main/read/awaitRead',
			name: "阅卷管理",
			id: 18,
			component: React.lazy(() =>
				import('@/containers/main/read/awaitRead.jsx')
			)
		},
		{
			path: '/main/read/detailRead/:id',
			name: "阅卷管理",
			id: 19,
			component: React.lazy(() =>
				import('@/containers/main/read/detailRead.jsx')
			)
		}
		]
	},
	{
		path: '/main/student',
		name: "学生主页",
		id: 20,
		component: React.lazy(() =>
			import('@/containers/main/student')),
		children: [{
			path: '/main/student/attend',
			name: "学生主页",
			id: 21,
			component: React.lazy(() =>
				import('@/containers/main/student/attend.jsx')
			)
		},
		{
			path: '/main/student/detailStudent/:id',
			name: "学生主页",
			id: 22,
			component: React.lazy(() =>
				import('@/containers/main/student/detailStudent.jsx')
			)
		}
		]
	}
	]
}, {
	path: "/login",
	name: "登录",
	id: 23,
	component: Login
},
{
	path: '/',
	id: 24,
	redirect: '/login'
}
];

export default RouteConfig;