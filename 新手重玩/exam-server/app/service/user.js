const {
	Service
} = require('egg');

class User extends Service {
	async identityId() {
		const $sql = `select * from identity`;
		const user = await this.app.mysql.query($sql);
		return user;
	}
	async addUser(params) {
		const {
			addUserName,
			addPassWord,
			identityId
		} = params;
		const $sql = `insert into user (username, password, type) values (?,?,?);`;
		const user = await this.app.mysql.query($sql, [
			addUserName,
			addPassWord,
			identityId
		]);
		return user;
	}
	async isUser(params) {
		const {
			addUserName
		} = params;
		const $sql = `select * from user where username='${addUserName}'`;
		const user = await this.app.mysql.query($sql);
		return user;
	}
	async userName() {
		const $sql = `select * from user`;
		const user = await this.app.mysql.query($sql);
		return user;
	}
	/**
	 * 根据输入的用户名修改更新用户信息
	 * @param {表单中的数据} params 
	 */
	async updateUser(uid, params) {
		const {
			identityId
		} = params;
		const $sql = `update user set  type='${identityId}' WHERE  uid=${uid};`;
		const user = await this.app.mysql.query($sql);
		return user;
	}
	/**
	 * 添加身份
	 * @param {身份信息} identityName 
	 */
	async isIdentity(identityName) {
		// console.log(identityName, 'identityName')
		const $sql = `select * from identity where identity='${identityName}'`;
		const result = await this.app.mysql.query($sql, [identityName]);
		return result;
	}

	async addIdentity(identityName, typeId) {
		// console.log(identityName, 'identityName')
		const $sql = `insert into identity (identity,type_id) values (?,?);`;
		const result = await this.app.mysql.query($sql, [identityName, typeId]);
		return result;
	}

	//添加api权限接口
	async existApi(params) {
		// apiName: '获取123', apiUrl: '/user/addApi', apiMethod: 'get'
		const {
			apiName,
			apiUrl,
			apiMethod
		} = params
		const $sql = `select * from api_authority where api_authority_text='${apiName}' and api_authority_url='${apiUrl}' and api_authority_method='${apiMethod}'`
		const result = await this.app.mysql.query($sql)
		return result
	}
	async addtApi(params) {
		const {
			apiName,
			apiUrl,
			apiMethod
		} = params
		const $sql = `insert into api_authority (api_authority_text,api_authority_url,api_authority_method) values (?,?,?)`
		const $params = [apiName, apiUrl, apiMethod]
		const result = this.app.mysql.query($sql, $params)
		return result
	}
	async apiAuthority() {
		const $sql = `select * from api_authority`;
		const user = await this.app.mysql.query($sql);
		return user;
	}
	async viewAuthority() {
		const $sql = `select * from view_authority`;
		const user = await this.app.mysql.query($sql);
		return user;
	}

	//身份和api接口关系
	async identityAuthority() {
		const $sql = `select identity,api_authority_text,api_authority_url,api_authority_method from identity,api_authority where api_authority.identity_id=identity.type_id`;
		const user = await this.app.mysql.query($sql);
		return user;
	}
}

module.exports = User;