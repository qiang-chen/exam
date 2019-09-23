const {
    Service
} = require("egg");

class AddTest extends Service {
    //保存题目
   async saveTest(opt) {
        const result = await this.app.mysql.insert('test', {
            content: opt.content,
            answer: opt.answer,
            title: opt.title,
            timeId: opt.timeId,
            classId: opt.classId,
            titleId: opt.titleId,
             uid:opt.uid
        })
        return result;
    }
    async everyTest(tid){
        //console.log(uid)
        const post = await this.app.mysql.get('test', { tid });
        return post;
    }
}

module.exports = AddTest;