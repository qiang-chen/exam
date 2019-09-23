/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
	/**
	 * built-in config
	 * @type {Egg.EggAppConfig}
	 **/
	const config = (exports = {});

	// use for cookie sign key, should change to your own and keep security
	config.keys = appInfo.name + '_1567152216538_6048';

	// add your middleware config here
	config.middleware = [];
	// add your user config here
	const userConfig = {
		// myAppName: 'egg',
		security: {
			csrf: {
				enable: false
			}
		},
		mysql: {
			// 单数据库信息配置
			client: {
				// host  连接别人的数据库
				//host: '169.254.19.8',
				host: 'localhost',
				// 端口号
				port: '3306',
				// 用户名
				user: 'root',
				// 密码
				password: 'root',
				// 数据库名
				database: 'chongxin'
			},
			// 是否加载到 app 上，默认开启
			app: true,
			// 是否加载到 agent 上，默认关闭
			agent: false
		},
		multipart: {
			mode: 'file',
		}
	};

	return {
		...config,
		...userConfig
	};
};