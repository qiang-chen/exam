const {
    Service
} = require("egg");

class LookTest extends Service {
    //查找题目分类
    async getClassType() {
        //查找
        const results = await this.app.mysql.select('classType');
        return results;
    }
    async getTestType() {
        //查找
        const results = await this.app.mysql.select('timeTest');
        return results;
    }
    async getQuestions() {
        //进行多表查询返回数据
        const $sql = `select title,classType,timeType,titleType,username,tid from test,classType,testtitletype,timetest,user where test.timeId=timetest.timeId and test.classId=classType.classId and test.titleId=testtitletype.titleId and test.uid=user.uid`
        const results = await this.app.mysql.query($sql);
        return results;
    }
    async searchQuestion(timeTset, count, questionType) {
        const arr = [timeTset,
            count,
            questionType
        ];
        console.log(timeTset, count, questionType, "传过来的三个数");
        let $TmT;

        // const $sql =`select title,classType,titleType,timeType,username from test,classtype,testtitletype,timetest,user  where test.classId=classType.classId and test.timeId=timetest.timeId and test.titleId=testtitletype.titleId and test.uid=user.uid`
        switch (true) {
            case (timeTset.length != 0 && count.length != 0 && questionType.length != 0):
                console.log("timeTset.length != 0 && count.length != 0 && questionType.length != 0");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.classId='${count}' and test.titleId ='${questionType}' and test.timeId='${timeTset}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break;
            case (timeTset.length != 0 && count.length != 0):
                console.log("timeTset && count");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.classId='${count}' and test.timeId='${timeTset}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break
            case (timeTset.length != 0 && questionType.length != 0):
                console.log("timeTset && questionType");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.titleId ='${questionType}' and test.timeId='${timeTset}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break;
            case (count.length != 0 && questionType.length != 0):
                console.log("count && questionType");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.classId='${count}' and test.titleId ='${questionType}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break;
            case (count.length != 0):
                //证明查询到了class类那些
                console.log("count");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.classId='${count}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break
            case (timeTset.length != 0):
                console.log("进了一个条件timeTset？");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.timeId='${timeTset}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break
            case (questionType.length != 0):
                console.log("questionType");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.titleId ='${questionType}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break
            default:
                console.log("走了这里的是不是");
                $TmT = `select tid,title,classType,titleType,timeType,username from test,classtype,timetest,testtitletype,user where test.classId='${count}' and test.titleId ='${questionType}' and test.timeId='${timeTset}' and test.uid=user.uid and test.classId=classtype.classId and test.titleId =testtitletype.titleId and test.timeId=timetest.timeId`;
                break;
        }
        const result = await this.app.mysql.query($TmT)
        return result
    }
    async Qsn(Cid) {
        const $SQL = `select * from test where classId='${Cid}'`
        const result = await this.app.mysql.query($SQL)
        return result
    }
    async addType(testType,titleID){
        const $SQL ='insert into testtitletype (titleType,titleId) values (?,?)'
        const result =await this.app.mysql.query($SQL,[testType,titleID])
        return result
    }
}

module.exports = LookTest