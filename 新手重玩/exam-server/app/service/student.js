const { Service } = require("egg")
class StudentService extends Service {
    async getList() {
        let $sql = 'select * from exam,publish,classtype where exam.exam_id=publish.exam_id and exam.class_id=classtype.classId '
        let result = await this.app.mysql.query($sql)
        return result
    }
    async getQuestions(id) {
        let $sql = 'select question from exam where exam.exam_id=?'
        let result = await this.app.mysql.query($sql, [id])
        return result
    }
    async getTest() {
        let $sql = 'select * from test'
        let result = await this.app.mysql.query($sql)
        return result
    }
    async saveStudentAnswer(id, obj, s_id) {
        console.log(id, obj, "serrrrrrrrrrrrrrrrrrrr")
        let $sql = 'insert into saveanswer (answer,exam_id,s_id) values (?,?,?)'
        let result = await this.app.mysql.query($sql, [JSON.stringify(obj), id, s_id])
        return result
    }
}
module.exports = StudentService