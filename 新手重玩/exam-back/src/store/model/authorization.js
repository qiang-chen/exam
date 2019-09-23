//从本地取出cookie来给仓库进行默认赋值

import {
	getCookie
} from "@/utils/creatToken";
let opt = {}
if (getCookie()) {
	opt = JSON.parse(getCookie())
}
const state = {
	token: opt.token || '',
	uid: opt.uid || "",
	types: opt.type || ""
};
const reducers = {
	changeToken(state, action) {
		state.token = action.token;
		return {
			...state
		};
	},
	changeUid(state, action) {
		state.uid = action.uid;
		return {
			...state
		};
	},
	changeType(state, action) {
		state.types = action.types;
		return {
			...state
		};
	}
};
export default {
	namespace: 'authorization',
	state,
	reducers
};