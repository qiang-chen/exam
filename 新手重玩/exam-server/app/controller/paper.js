const { Controller } = require('egg');

class paperController extends Controller {
    async getpaperlist() {
        const {ctx} = this
        const result = await this.ctx.service.paper.getpaperlist();
        ctx.body = {
            code: 1,
            msg: 'success',
            result
        }
        console.log(result)

    }
}

module.exports = paperController;