import React, { Component } from 'react';
import RouteView from '@/routes/RouteView';

export default class Read extends Component {
	render() {
		return <RouteView children={this.props.children} />;
	}
}