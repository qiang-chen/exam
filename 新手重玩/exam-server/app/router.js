'use strict';
/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
    const {
        router,
        controller
    } = app;
    const jurisdiction = app.middleware.jurisdiction();

    //获取用户页面展示
    router.get("/user/authorization", controller.authorization.getauthorization);
    //获取用户头像的接口
    router.get("/getImg", controller.login.getImg)
    //上传头像接口开发
    router.post("/upload", controller.login.upload);
    //登录接口开发
    router.post("/login", controller.login.login);
    //获取验证码接口
    router.get("/verify", controller.login.verify);
    //编辑试题
    router.port("/test/updateTest", controller.addTest.updateTest)
    //获取编辑试题的页面接口
    router.get("/exitTest", controller.addTest.exitTest)
    //获取试题类型的接口
    router.get('/test/getTitleType', controller.typeTest.getTitleType);
    //获取课程类型接口
    router.get("/test/getClassType", controller.lookTest.getClassType);
    //获取对应的题目
    router.post('/test/search', controller.lookTest.searchQuestion);
    //根据课程类型获取题目
    router.post('/test/Qsn', controller.lookTest.Qsn)
    //添加试题类型
    router.post('/test/addTestType', controller.lookTest.addType)
    //获取考试时间
    router.get("/test/getTestType", controller.lookTest.getTestType);
    //获取题目列表
    router.get("/test/getQuestions", controller.lookTest.getQuestions);
    //保存试题
    router.post("/test/saveTest", controller.addTest.saveTest);
    //根据传过来的id获取保存好的某一份试题
    router.get("/test/everyTest", controller.addTest.everyTest)
    //获取身份id
    router.get('/user/identityId', controller.user.identityId);
    //添加新用户
    router.post('/user/addUser', controller.user.addUser);
    //获取所有用户
    router.get('/user/userName', controller.user.userName);
    //更新用户
    router.post('/user/updateUser', controller.user.updateUser);
    //添加身份
    router.post('/user/addIdentity', controller.user.addIdentity);

    //获取api接口权限id
    router.get('/user/apiAuthority', controller.user.apiAuthority);
    //获取视图接口权限
    router.get('/user/viewAuthority', controller.user.viewAuthority);
    //身份和api接口权限
    router.get('/user/identityAuthority', controller.user.identityAuthority);

    //获取所有班级
    router.post('/class/banClass', controller.class.banClass);
    //获取所有课程
    router.post('/class/getSubject', controller.class.getSubject);
    //添加班级
    router.post('/class/addBanClass', controller.class.addBanClass);
    //获取所有教室
    router.post('/class/getRoom', controller.class.getRoom);
    //添加教室
    router.post('/class/addRoom', controller.class.addRoom);
    //获取所有学生
    router.post('/class/getStudent', controller.class.getStudent);
    //搜索某个学生
    router.post('/class/searchStudent', controller.class.searchStudent);
    //删除班级
    router.get("/class/delGrade", controller.class.delGrade)
    //删除教室
    router.get("/class/delRoom", controller.class.delRoom)
    //删除学生
    router.get("/class/delStudent", controller.class.delStudent)
    //更新班级
    router.post("/class/updateGrade", controller.class.updateGrade)
    //获取考试类型
    router.get('/exam/getExamType', controller.examManage.getExamType);
    //获取课程
    router.get('/exam/getCourse', controller.examManage.getCourse);
    // 试卷列表
    router.get('/exam/getExamList', controller.examManage.getExamList);
    //创建考试
    router.post("/exam/createExam", controller.examManage.createExam);
    //往创建的试卷里面更新试卷题目
    router.post("/exam/updateExam", controller.addExamTest.updateExam)
    // 试卷列表的模糊搜索
    router.post('/exam/getSearchList', controller.examManage.getSearchList);

    //获取所有试题内容
    router.get("/exam/getTestList", controller.examManage.getTestList);
    //阅卷班级列表
    router.get("/paper/classlist", controller.paper.getpaperlist);

    //学生端 学生进入学生页面  渲染table接口
    router.get("/student/getList", controller.student.getList)

    //得到问题
    router.get("/student/getQuestions", controller.student.getQuestions)

    //获取Test
    router.get("/student/getTest", controller.student.getTest)
    // 跳转试题详情页面
    router.get('/exam/getExamListDetail', controller.examManage.getExamListDetail);

    //保存学生答案
    router.post("/student/saveStudentAnswer", controller.student.saveStudentAnswer)


};