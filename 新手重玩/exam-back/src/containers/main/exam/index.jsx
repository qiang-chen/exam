import React, { Component } from 'react';
import RouteView from '@/routes/RouteView';

export default class Exam extends Component {
	render() {
		return <RouteView children={this.props.children} />;
	}
}
