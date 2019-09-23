//登录接口
export const login = "/login";
//获取头像
export const getImg = "/getImg";
//获取验证码
export const verify = "/verify";
//编辑题目请求接口
export const exitTest = "/exitTest"
//上传头像功能
export const upload = "/upload";
//用户登录进来获取登录权限问题 
export const authorization = "/user/authorization";
//更新试题接口
export const updateTest = "/test/updateTest";
//根据课程类型获取题目
export const getQsn = "/test/Qsn";
//获取相应的题目
export const getSbjQsn = "/test/search";
//添加试题类型
export const addTestType = "/test/addTestType"
//获取题目类型
export const getTitleType = "/test/getTitleType";
//获取课程类型
export const getClassType = "/test/getClassType";
//获取试卷类型
export const getTestType = "/test/getTestType";
//获取试题
export const getQuestions = "/test/getQuestions";
//保存试题
export const saveTest = "/test/saveTest"
//获取某一份试题的接口
export const everyTest = "/test/everyTest"
//获取身份id
export const identityId = '/user/identityId';
//添加新用户
export const addUser = '/user/addUser';
//获取用户信息
export const userName = '/user/userName';
//更新用户
export const updateUser = '/user/updateUser';
//添加身份
export const addIdentity = '/user/addIdentity';
//获取视图接口权限
export const addApi = '/user/addApi';
//获取api接口权限id
export const apiAuthority = '/user/apiAuthority';
//获取视图接口权限 
export const viewAuthority = '/user/viewAuthority';
//身份和api接口权限 
export const identityAuthority = '/user/identityAuthority';

//获取所有班级
export const banClass = '/class/banClass';
//直接获取班级
export const grade = '/class/grade';
//获取所有课程地址
export const getSubject = '/class/getSubject';
//添加班级地址
export const addBanClass = '/class/addBanClass';
//获取所有教室地址
export const getRoom = '/class/getRoom';
//添加教室地址
export const addRoom = '/class/addRoom';
//获取所有学生地址
export const getStudent = '/class/getStudent';
//搜索某个学生
export const searchStudent = '/class/searchStudent';
//删除班级地址
export const delGrade = '/class/delGrade';
//删除教室地址
export const delRoom = '/class/delRoom';
//删除学生地址
export const delStudent = '/class/delStudent';
//更新班级
export const updateGrade = "/class/updateGrade"
//获取考试类型
export const getExamType = '/exam/getExamType';
//获取课程
export const getCourse = '/exam/getCourse';
//创建考试试卷
export const createExam = '/exam/createExam';
//获取考试试题列表

export const getTestList = "/exam/getTestList";
//更新试卷内的题目
export const updateExam = "/exam/updateExam"
//学生考试列表地址
export const studentExamList = "/student/getList"
// 考试管理/试卷列表/渲染列表
export const getExamList = '/exam/getExamList';
//阅卷管理的带【批班级
export const getpaperlist = '/paper/classlist';
//得到问题最后
export const getZuiHouQuestions = '/student/getQuestions';
//获取test地址
export const getTest = '/student/getTest';
//保存学生答题答案
export const saveStudentAnswer = '/student/saveStudentAnswer';
//搜索
export const getSearchList = '/exam/getSearchList';
// 试题的详情页
export const getExamListDetail = '/exam/getExamListDetail';