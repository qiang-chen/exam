import * as port from './port/port';
import request from '@/utils/request';

//根据登陆者自动获取用户头像
export function getImg(uid) {
    return request.get(port.getImg, {
        params: {
            uid
        }
    })
}

//获取登陆者的身份权限页面
export function authorization(uid) {
    return request.get(port.authorization, {
        params: {
            uid
        }
    })
}
//获取编辑页面所需要的题目信息
export function exitTest(tid) {
    return request.get(port.exitTest, {
        params: {
            tid
        }
    })
}
//编辑试题后更新试题接口
export function updateTest(data) {
    return request.post(port.updateTest, data)
}
//根据课程类型获取题目
export function getQsn(Tid) {
    //console.log(port.getQsn, "这是什么");
    return request.post(port.getQsn, Tid);
}
//上传头像
export function upload(data) {
    console.log(data, "data进来了吗");
    return request.post(port.upload, data)
}
//获取相应的题目
export function getSbjQsn(id) {
    return request.get(port.getSbjQsn + `${id}`);
}
//添加试题类型
export function addTestType(parmas) {
    return request.post(port.addTestType, parmas)
}
//获取对应的题目
export function searchQuestion(parmas) {
    return request.post(port.getSbjQsn, parmas);
}

//获取试题类型的接口
export function getTitleType() {
    return request.get(port.getTitleType);
}
//获取课程类型接口
export function getClassType() {
    return request.get(port.getClassType);
}
//获取考试时间
export function getTestType() {
    return request.get(port.getTestType);
}
//获取题目列表
export function getQuestions() {
    return request.get(port.getQuestions);
}

//获取每份试题的接口
export function getEveryTest(id) {
    return request.get(port.everyTest, {
        params: {
            id
        }
    })
}

//获取身份ID
export function identityId() {
    return request.get(port.identityId);
}
//添加试题
export function saveTest(data) {
    return request.post(port.saveTest, data);
}
//添加新用户
export function addUser(params) {
    return request.post(port.addUser, params);
}
//获取用户信息
export function userName() {
    return request.get(port.userName);
}
//更新用户
export function updateUser(params) {
    return request.post(port.updateUser, params);
}
//添加身份
export function addIdentity(params) {
    return request.post(port.addIdentity, params);
}
//添加api接口权限
export function addApi(params) {
    return request.post(port.addApi, params);
}
//获取api接口权限id
export function apiAuthority() {
    return request.get(port.apiAuthority);
}

//获取视图接口权限
export function viewAuthority() {
    return request.get(port.viewAuthority);
}
//身份和api接口权限
export function identityAuthority() {
    return request.get(port.identityAuthority);
}

//获取所有班级
export function banClass() {
    return request.post(port.banClass);
}
//直接获取班级
export function grade() {
    return request.post(port.grade);
}
//获取所有课程
export function getSubject() {
    return request.post(port.getSubject);
}
//添加班级
export function addBanClass(params) {
    return request.post(port.addBanClass, params);
}
//获取所有教室
export function getRoom() {
    return request.post(port.getRoom);
}
//添加教室
export function addRoom(params) {
    return request.post(port.addRoom, params);
}
//获取所有学生
export function getStudent() {
    return request.post(port.getStudent);
}
//搜索某个学生
export function searchStudent(params) {
    return request.post(port.searchStudent, params);
}
//删除班级
export function delGrade(name) {
    console.log(name, "api")
    return request.get(port.delGrade, {
        params: {
            name
        }
    });
}
//删除教室
export function delRoom(id) {
    return request.get(port.delRoom, {
        params: {
            id
        }
    });
}
//删除学生
export function delStudent(id) {
    return request.get(port.delStudent, {
        params: {
            id
        }
    });
}
//更新班级
export function updateGrade(params) {
    return request.post(port.updateGrade, params)
}
//考试管理/添加考试/  :获取考试类型
export function getExamType() {
    return request.get(port.getExamType)
}
//考试管理/添加考试/  :获取课程
export function getCourse() {
    return request.get(port.getCourse)
}
//考试管理/添加考试/   :创建考试试卷
export function createExam(params) {
    return request.post(port.createExam, params);
}

//在为创造的试卷页面中获取之前创造的所有题目
export function getTestList() {
    return request.get(port.getTestList)
}

export function updateExam(data) {
    return request.post(port.updateExam, data)
}


// 考试管理/试卷列表/渲染列表
export function getExamList() {
    return request.get(port.getExamList)
}

//阅卷管理的带【批班级
export function getpaperlist() {
    return request.get(port.getpaperlist)
}

//学生考试列表接口
export function studentExamList() {
    return request.get(port.studentExamList)
}

//得到问题最后
export function getZuiHouQuestions(id) {
    return request.get(port.getZuiHouQuestions, {
        params: {
            id
        }
    })
}

//获取test
export function getTest() {
    return request.get(port.getTest)
}
//保存学生答题答案
export function saveStudentAnswer(params) {
    console.log(params, "apiiiiii")
    return request.post(port.saveStudentAnswer, params)
}
// 模糊搜索
export function getSearchlist(params) {
    return request.post(port.getSearchList, params)
}
// 试题详情页面
export function getExamListDetail(id) {
    return request.get(port.getExamListDetail, {
        params: {
            id
        }
    })
}