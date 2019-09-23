import React from 'react';
import { Router } from 'dva/router';
import RouteView from '@/routes/RouteView';
import RouteConfig from '@/routes/RouteConfig';
import '@/common/css/App.css';

export default function App({ history }) {
    return (
        <Router history={history}>
            <RouteView children={RouteConfig}></RouteView>
        </Router>
    );
}
