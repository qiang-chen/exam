/*
 * 此文件的作用是检验用户权限 在跳转每一个路由的时候判断一下该用户是不是有权限进行访问
 * 防止该用户进行链接进行跳转
 * @Author: chenqiang
 * @Date: 2019-09-08 12:15:52
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-08 19:55:36
 */
import React, { Component } from 'react';
import * as api from '@/api/index';
import { getCookie } from '@/utils/creatToken';

export default function() {
    return Com => {
        return class jurisdiction extends Component {
            constructor(props) {
                super(props);
                this.state = {
                    jurisdiction: {
                        view_authority: ''
                    }
                };
            }
            async componentDidMount() {
                let opt = {};
                if (getCookie()) {
                    opt = JSON.parse(getCookie());
                }

                let data = await api.authorization(opt.uid);
                //console.log(data.msg.view_authority, '000000000000000000000');
                if (data.msg.view_authority) {
                    this.setState({
                        jurisdiction: data.msg
                    });
                } else {
                    this.setState({
                        jurisdiction: {}
                    });
                }
                //console.log(this.state.jurisdiction, '刷新');
            }
            render() {
                return (
                    <div>
                        <Com
                            {...this.props}
                            jurisdiction={this.state.jurisdiction}
                        ></Com>
                    </div>
                );
            }
        };
    };
}
