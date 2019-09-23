import React, { Component } from 'react';
import { Spin } from 'antd';
import '@/common/css/loading.css';

export default class Loading extends Component {
	render() {
		return (
			<div className="example">
				<Spin />
			</div>
		);
	}
}
