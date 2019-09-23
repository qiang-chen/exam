const { Controller } = require("egg")
class StudentController extends Controller {
    async getList(ctx) {
        let code = 1,
            msg = "学生考试列表数据获取成功",
            result
        try {
            result = await ctx.service.student.getList()
        } catch (error) {
            code = 0,
                msg = "没有数据"
        }

        ctx.body = {
            code,
            msg,
            result
        }
    }
    async getQuestions(ctx) {
        let { id } = ctx.request.query
        let code = 1,
            msg = "获取问题成功",
            result

        try {
            result = await ctx.service.student.getQuestions(id)
        } catch (error) {
            code = 0,
                msg = "没有数据"
        }

        ctx.body = {
            code,
            msg,
            result
        }
    }
    async getTest(ctx) {
        let code = 1,
            msg = "获取Test成功",
            result
        try {
            result = await ctx.service.student.getTest()
        } catch (error) {
            code = 0,
                msg = "没有数据"
        }

        ctx.body = {
            code,
            msg,
            result
        }
    }
    async saveStudentAnswer(ctx) {
        let code = 1,
            msg = "保存答案成功",
            result
        const { id, obj, s_id } = ctx.request.body
        console.log(id, obj, s_id, "*******")
        try {
            result = await ctx.service.student.saveStudentAnswer(id, obj, s_id)
        } catch (error) {
            code = 0,
                msg = "失败"
        }

        ctx.body = {
            code,
            msg
        }
    }
}
module.exports = StudentController