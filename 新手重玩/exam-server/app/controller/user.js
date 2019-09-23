'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
	async identityId() {
		const resquest = await this.ctx.service.user.identityId();
		this.ctx.body = resquest;
	}
	async addUser() {
		const params = this.ctx.request.body;
		const res = await this.ctx.service.user.isUser(params);
		if (res.length) {
			//此用户已存在
			this.ctx.status = 401;
			this.ctx.body = {
				code: 0,
				msg: '此用户已存在'
			};
		} else {
			//添加新用户
			this.ctx.status = 200;
			const resquest = await this.ctx.service.user.addUser({
				...params
			});
			this.ctx.body = {
				code: 1,
				msg: '添加成功'
			};
		}
	}
	async userName() {
		const res = await this.ctx.service.user.userName();
		this.ctx.body = res;
	}
	async updateUser() {
		//先查找用户是不是存在 在更新
		let code = 1,
			msg = "更新成功";
		const params = this.ctx.request.body;
		try {
			const res = await this.ctx.service.user.isUser(params);
			if (res.length) {
				//证明此用户存在数据库 
				//比较密码是不是相等
				//对数据库的密码进行解密在更新
				//根据这个uid去更新types字段 也就是用户的一个身份
				const resquest = await this.ctx.service.user.updateUser(res[0].uid, params);
			} else {
				code = 0;
				msg = "该用户不存在，无法更新";
			}
		} catch (error) {
			code = 0;
			msg = "更新失败请重试";
		}
		this.ctx.body = {
			code,
			msg
		};
	}
	//添加身份
	async addIdentity() {
		const {
			identityName,
			typeId
		} = this.ctx.request.body
		// console.log(typeId, 'iddddddddd')
		const result = await this.ctx.service.user.isIdentity(identityName)
		console.log(result, 'resssssssssssssssssssss')
		if (!result.length) {
			this.ctx.status = 200;
			const resquest = await this.ctx.service.user.addIdentity(identityName, typeId);
			this.ctx.body = {
				code: 1,
				msg: '添加成功'
			};
		} else {
			this.ctx.status = 401;
			this.crx.body = {
				code: 0,
				msg: '此身份已存在'
			}
		}
	}

	//添加api接口权限
	async addApi() {
		const params = this.ctx.request.body;
		//先判断数据库内有没有改接口
		const res = await this.ctx.service.user.existApi(params);
		console.log(res, '查看是否有改数据,查看我到底有什么')
		if (res.length) {
			this.ctx.status = 401
			this.ctx.body = {
				code: 0,
				msg: '该接口已存在!'
			}
		} else {
			const result = await this.ctx.service.user.addtApi(params);
			this.ctx.body = {
				code: 1,
				msg: '添加成功!'
			}
		}
	}
	//api接口权限
	async apiAuthority() {
		const res = await this.ctx.service.user.apiAuthority();
		this.ctx.body = res;
	}
	//视图接口权限
	async viewAuthority() {
		const res = await this.ctx.service.user.viewAuthority();
		this.ctx.body = res;
	}
	//身份和api接口
	async identityAuthority() {
		const res = await this.ctx.service.user.identityAuthority();
		this.ctx.body = res;
	}
}

module.exports = HomeController;