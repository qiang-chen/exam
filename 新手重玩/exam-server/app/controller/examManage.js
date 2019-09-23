const {
    Controller
} = require("egg");

class TypeTest extends Controller {
    async getExamType(ctx) {
        let code = 1,
            msg = [];
        try {
            let data = await ctx.service.examManage.getExamType();
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
    async getCourse(ctx) {
        let code = 1,
            msg = [];
        try {
            let data = await ctx.service.examManage.getCourse();
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
    async createExam(ctx) {
        let code = 1,
            msg = "添加成功了";
        try {
            //console.log(ctx.request.body, "这是什么");
            const result = await ctx.service.examManage.createExam(ctx.request.body);
        } catch (error) {
            //console.log(error, "这个错误是什么");
            code = 0;
            msg = "添加失败"
        }
        ctx.body = {
            code,
            msg
        }

    }
    async getExamList() {
        const {
            ctx
        } = this;
        const result = await ctx.service.examManage.getExamList();
        ctx.body = {
            code: 1,
            msg: 'success',
            result
        }
    }

    //获取所有的试题
    async getTestList(ctx) {
        let code = 1,
            msg = [];
        try {
            let result = await ctx.service.examManage.getTestList();
            msg = result;
        } catch (error) {
            code = 0;
            msg = "获取数据失败"
        }
        ctx.body = {
            code,
            msg
        }
    }
    async getSearchList() {
        const {
            ctx
        } = this;
        const result = await ctx.service.examManage.getSearchList();
        ctx.body = {
            code: 1,
            msg: 'success',
            result
        }
    }
    async getExamListDetail() {
        const { ctx } = this;
        const { id } = ctx.request.query;
        const result = await ctx.service.examManage.getExamListDetail(id);
        const data = await ctx.service.examManage.questiondetail(JSON.parse(result[0].question));
        ctx.body = {
            code: 1,
            msg: 'success',
            result:data
        }

    }
}

module.exports = TypeTest;