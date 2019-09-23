/*
 * @Author: GF 
 * @Date: 2019-09-06 17:09:30 
 * @Last Modified by: GF
 * @Last Modified time: 2019-09-09 20:09:05
 */
import React, { Component } from 'react';
import { Table } from 'antd';

class ShowUserList extends Component {
	render() {
		const { columns, data } = this.props;
		return (
			<div>
				<Table columns={ columns } dataSource={ data } />
			</div>
		);
	}
}
export default ShowUserList;
