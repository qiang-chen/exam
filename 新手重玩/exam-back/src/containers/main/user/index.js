/*
 * @Author: chenqiang 
 * @Date: 2019-09-08 11:17:23 
 * @Last Modified by:   chenqiang 
 * @Last Modified time: 2019-09-08 11:17:23 
 */
import React, {
	Component
} from 'react';
import RouteView from '@/routes/RouteView';

export default class User extends Component {
	render() {
		return <RouteView children = {
			this.props.children
		}
		/>;
	}
}