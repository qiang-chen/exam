const {
    Controller
} = require("egg");

class TypeTest extends Controller {
    //获取每个题的类型
    async getTitleType(ctx) {
        //查找数据库去
        let code = 1,
            msg = [];
            try {
                let data = await ctx.service.typeTest.getTitleType();
                msg = data;
            } catch (error) {
                console.log(error)
                code=0;
                msg = "服务器错误请重试"
            }
        ctx.body = {
            code,
            msg
        }
    }
}

module.exports = TypeTest;