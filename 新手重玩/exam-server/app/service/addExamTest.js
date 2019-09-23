const {
    Service
} = require("egg");

class AddExamTest extends Service {
    async updateExam(data, id) {
        const row = {
            question: data
        };
        const options = {
            where: {
                exam_id: id,
            }
          };
        const result = await this.app.mysql.update('exam', row,options);
        return result;
    }
}

module.exports = AddExamTest