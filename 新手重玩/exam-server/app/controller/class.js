const { Controller } = require("egg")
class ClassController extends Controller {
    async banClass() {
        const { ctx } = this
        const result = await ctx.service.class.banClass()
        ctx.body = {
            code: 1,
            msg: "获取班级成功",
            result
        }
    }
    async grade() {
        const { ctx } = this
        const result = await ctx.service.class.grade()
        ctx.body = {
            code: 1,
            msg: "直接获取班级成功",
            result
        }
    }
    async getSubject() {
        const { ctx } = this
        const result = await ctx.service.class.getSubject()
        ctx.body = {
            code: 1,
            msg: "获取所有课程成功",
            result
        }
    }
    async addBanClass() {
        const { ctx } = this
        const { ban, room, subject } = ctx.request.body
        console.log(ban, room, subject, "后台结构到了")
        const result = await ctx.service.class.addBanClass(ban, room, subject)
        ctx.body = {
            code: 1,
            msg: "班级添加成功",
            result
        }
    }
    async getRoom() {
        const { ctx } = this
        const result = await ctx.service.class.getRoom()
        ctx.body = {
            code: 1,
            msg: "获取所有教室成功",
            result
        }
    }
    async addRoom() {
        const { ctx } = this
        const { room } = ctx.request.body
        console.log(room, "con")
        const result = await ctx.service.class.addRoom(room)
        ctx.body = {
            code: 1,
            msg: "添加教室成功",
            result
        }
    }
    async getStudent() {
        const { ctx } = this
        const result = await ctx.service.class.getStudent()
        ctx.body = {
            code: 1,
            msg: "获取所有学生成功",
            result
        }
    }
    async searchStudent() {
        const { ctx } = this
        const { name, room, grade } = ctx.request.body
        const result = await ctx.service.class.searchStudent(name, room, grade)
        if (result.length) {
            ctx.status = 200
            ctx.body = {
                code: 1,
                msg: "搜索成功",
                result
            }
        } else {
            ctx.body = {
                code: 0,
                msg: "没有匹配项",
                result
            }
        }

    }
    async delGrade() {
        const { ctx } = this
        const { name } = ctx.request.query
        console.log(name, "con")
        const result = await ctx.service.class.delGrade(name)
        ctx.body = {
            code: 1,
            msg: "删除班级成功"
        }
    }
    async delRoom() {
        const { ctx } = this
        const { id } = ctx.request.query
        const result = await ctx.service.class.delRoom(id)
        ctx.body = {
            code: 1,
            msg: "删除教室成功"
        }
    }
    async delStudent() {
        const { ctx } = this
        const { id } = ctx.request.query
        const result = await ctx.service.class.delStudent(id)
        ctx.body = {
            code: 1,
            msg: "删除学生成功"
        }
    }
    async updateGrade() {
        const { ctx } = this
        const { ban, room, subject } = ctx.request.body
        const result = await ctx.service.class.updateGrade(ban, room, subject)
        ctx.body = {
            code: 1,
            msg: "修改教室成功",
            result
        }
    }
}
module.exports = ClassController