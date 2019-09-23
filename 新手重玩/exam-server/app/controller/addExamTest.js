const {
    Controller
} = require("egg");

class AddExamTest extends Controller {
    async updateExam(ctx) {
        //console.log("进来了吗");
        let {
            data,
            id
        } = ctx.request.body;
        data = JSON.stringify(data)
        let code = 1,
            msg = "添加成功";
        try {
            let result = await ctx.service.addExamTest.updateExam(data, id);
            //console.log(result);
        } catch (error) {
            console.log(error, "为什么失败了");
            code = 0;
            msg = "添加失败"
        }
        ctx.body = {
            code,
            msg
        }
    }
}

module.exports = AddExamTest