import React from 'react';
import { Switch, Route, Redirect, withRouter } from 'dva/router';
//引入高阶组件并将其挂载到页面上
import jurisdiction from '@/hoc/jurisdiction';

export default class RouteView extends React.Component {
    render() {
        return (
            <Switch>
                {this.props.children.map((item, index) => {
                    //console.log(item.id);
                    if (item.redirect) {
                        return (
                            <Redirect
                                key={item.id}
                                from={item.path}
                                to={item.redirect}
                            ></Redirect>
                        );
                    } else {
                        if (this.props.jurisdiction.view_authority) {
                            if (
                                this.props.jurisdiction.view_authority
                                    .split(',')
                                    .includes(item.name)
                            ) {
                                return (
                                    <Route
                                        key={item.id}
                                        path={item.path}
                                        render={props => {
                                            return (
                                                <item.component
                                                    key={item.id}
                                                    {...props}
                                                    children={item.children}
                                                ></item.component>
                                            );
                                        }}
                                    ></Route>
                                );
                            }
                        } else {
                            return (
                                <Route
                                    key={item.id}
                                    path={item.path}
                                    render={props => {
                                        return (
                                            <item.component
                                                key={item.id}
                                                {...props}
                                                children={item.children}
                                            ></item.component>
                                        );
                                    }}
                                ></Route>
                            );
                        }
                    }
                })}
            </Switch>
        );
    }
}

RouteView = jurisdiction()(RouteView);
