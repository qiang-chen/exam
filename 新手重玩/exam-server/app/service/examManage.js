const {
    Service
} = require("egg");

class TypeTest extends Service {
    async getExamType() {
        const result = await this.app.mysql.select('timeTest');
        return result;
    }
    async getCourse() {
        const result = await this.app.mysql.select('classtype');
        return result;
    }
    async createExam(opt) {
        let data = {
            exam_id: opt.id,
            exam_name: opt.name1,
            time_id: opt.select,
            class_id: opt.select2,
            question_num: opt.num,
            start_exam: opt.begintime,
            end_exam: opt.endtime,
            uid: opt.uid
        }
        //console.log(data, "这是什么的");
        const result = await this.app.mysql.insert('exam', data);
        return result;
    }
    //获取所有的考试列表
    async getTestList() {
        const results = await this.app.mysql.select('test', { // 搜索 post 表
            columns: ['tid', 'title'], // 要查询的表字段
        });
        return results;
    }
    async getExamType() {
        const $sql = 'select * from timetest'
        const result = await this.app.mysql.query($sql);
        return result;
    }
    async getCourse() {
        const $sql = 'select * from classtype'
        const result = await this.app.mysql.query($sql);
        return result;
    }
    async getExamList() {
        const $sql = `select exam_id , exam_name ,start_exam , end_exam,username  from exam,user where exam.uid=user.uid `;
        const result = await this.app.mysql.query($sql);
        return result
    }
    async getSearchList() {
        const $sql = `select exam_id , exam_name ,start_exam,timeType, end_exam,username,classType from exam,user,grade,timetest where exam.uid=user.uid and grade.classId=exam.class_id and timetest.timeId =exam.time_id and timetest.timeType = '?'`;
        const result = await this.app.mysql.query($sql);
        return result
    }
    async getExamListDetail(id) {
        const $sql = `select question from exam where exam_id = ${id}`;
        const result = await this.app.mysql.query($sql);
        return result
    }
    async questiondetail(data) {
        let msg = [];
        for (let i = 0; i < data.length; i++) {
            let $sql = `select * from test where tid =?`;
            let result = await this.app.mysql.query($sql, [data[i]]);
            msg.push(result[0])
        }
        return msg
    }
}

module.exports = TypeTest