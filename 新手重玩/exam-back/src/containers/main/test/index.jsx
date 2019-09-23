/*
 * @Author: chenqiang 
 * @Date: 2019-09-03 23:19:41 
 * @Last Modified by: GF
 * @Last Modified time: 2019-09-08 20:40:45
 */
import React, { Component } from 'react';
import RouteView from '@/routes/RouteView';

export default class Test extends Component {
	render() {
		return <RouteView children={ this.props.children } />;
	}
}
