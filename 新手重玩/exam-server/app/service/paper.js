const { Service } = require('egg');

class paperService extends Service {
    async getpaperlist() {
        const $sql = `select * from saveanswer,exam,classtype where saveanswer.exam_id=exam.exam_id and exam.class_id=classtype.classId`;
        console.log($sql);
        const result = await this.app.mysql.query($sql);
        return result;
    }

}

module.exports = paperService