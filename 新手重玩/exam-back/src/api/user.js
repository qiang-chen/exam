/*
 * @Author: chenqiang
 * @Date: 2019-09-03 17:16:29
 * @Last Modified by: yixian
 * @Last Modified time: 2019-09-03 23:10:43
 */
import * as port from './port/port';
import request from '@/utils/request';

/**
 * 登录
 * @param {data} Object
 */
export function Login(data) {
	return request.post(port.login, data);
}
/**
 * 获取图形验证码
 */
export function Verify() {
	return request.get(port.verify);
}
