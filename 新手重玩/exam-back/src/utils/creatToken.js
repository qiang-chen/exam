/*
 * @Author: chenqiang 
 * @Date: 2019-09-04 07:51:59 
 * @Last Modified by:   chenqiang 
 * @Last Modified time: 2019-09-04 07:51:59 
 */
import Cookies from 'js-cookie';

export function getCookie() {
	return Cookies.get('token');
}
export function setCookie(data) {
	Cookies.set('token', data, { expires: 3 });
}
