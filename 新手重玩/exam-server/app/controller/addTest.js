const {
    Controller
} = require("egg");

class AddTest extends Controller {
    updateTest(ctx) {
        let code = 1,
            msg = "更新成功";

        ctx.body = {
            code,
            msg
        }
    }
    async saveTest(ctx) {
        //将这些数据全部存到数据库的questions表中去
        let code = 1,
            msg = "添加试题成功";
        try {
            let saveResult = await ctx.service.addTest.saveTest(ctx.request.body);
        } catch (error) {
            code = 0;
            msg = "添加试题失败"
        }
        ctx.body = {
            code,
            msg
        }
    }
    async everyTest(ctx) {
        let {
            id
        } = ctx.request.query;
        let code = 1,
            msg = {};
        try {
            let result = await ctx.service.addTest.everyTest(id);
            msg = result;
        } catch (error) {
            console.log(error)
            code = 0;
            msg = "暂无数据返回"
        }
        ctx.body = {
            code,
            msg
        }
    }
    async exitTest(ctx) {
        let {
            tid
        } = ctx.request.query;
        let code = 1,
            msg = {};
        try {
            let result = await ctx.service.addTest.everyTest(tid);
            msg = result;
        } catch (error) {
            console.log(error)
            code = 0;
            msg = "暂无数据返回"
        }
        ctx.body = {
            code,
            msg
        }
    }
}

module.exports = AddTest