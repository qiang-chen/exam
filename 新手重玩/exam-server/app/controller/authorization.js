const {
    Controller
} = require("egg");

class Authorization extends Controller {
    async getauthorization(ctx) {
        let {
            uid
        } = ctx.request.query;
        let code = 1,
            msg = {};
        try {
            let result = await ctx.service.authorization.getauthorization(uid);
            if (result.length) {
                msg = result[0];
            }
        } catch (error) {
            console.log(error);
            code = 0;
            msg = "查询失败"
        }
        ctx.body = {
            code,
            msg
        }
    }
}

module.exports = Authorization;