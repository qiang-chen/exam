import React, { Component } from 'react';
import RouteView from '@/routes/RouteView';

export default class Class extends Component {
	render() {
		return <RouteView children={this.props.children} />;
	}
}
