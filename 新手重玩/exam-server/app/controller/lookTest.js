const {
    Controller
} = require("egg");

class LookTest extends Controller {
    //获取课程类型
    async getClassType(ctx) {
        //查找数据库去
        let code = 1,
            msg = [];
        try {
            let data = await ctx.service.lookTest.getClassType();
            msg = data;
        } catch (error) {
            console.log(error)
            code = 0;
            msg = "服务器错误请重试"
        }
        ctx.body = {
            code,
            msg
        }
    }
    //获取周考一这些时间类型
    async getTestType(ctx) {
        let code = 1,
            msg = [];
        try {
            let data = await ctx.service.lookTest.getTestType();
            msg = data;
        } catch (error) {
            console.log(error)
            code = 0;
            msg = "服务器错误请重试"
        }
        ctx.body = {
            code,
            msg
        }
    }
    //获取题目列表
    async getQuestions(ctx) {
        let code = 1,
            msg = [];
        try {
            let data = await ctx.service.lookTest.getQuestions();
            msg = data;
        } catch (error) {
            console.log(error)
            code = 0;
            msg = "服务器错误请重试"
        }
        ctx.body = {
            code,
            msg
        }
    }
    async searchQuestion(ctx) {
        const {
            timeTset,
            count,
            questionType
        } = ctx.request.body;
        let code = 1,
            msg = [];
        try {
            const result = await ctx.service.lookTest.searchQuestion(timeTset, count, questionType);
            msg = result;
        } catch (error) {
            code = 0;
        }
        ctx.body = {
            msg,
            code
        }

    }
    async Qsn(ctx) {
        const {
            Cid
        } = ctx.request.body
        const result = await ctx.service.lookTest.Qsn(Cid)
        ctx.body = {
            result
        }
    }
    async addType(ctx){
        const{testType,titleID}=ctx.request.body
        const result =await ctx.service.lookTest.addType(testType,titleID)
        console.log(result)
        ctx.body = {
          msg:'插入成功'
        }
    }
}

module.exports = LookTest;