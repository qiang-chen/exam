/*
 * @Author: chenqiang
 * @Date: 2019-09-08 11:17:29
 * @Last Modified by: GF
 * @Last Modified time: 2019-09-09 20:39:17
>>>>>>> f1ed840c803db19c3a67bba04f49379a5d734317
 */
import React, { Component } from 'react';
import { Radio } from 'antd';
import '@/common/css/userCss/showUser.css';
import ShowUserList from '@/components/user/showUserList';
import { userName, identityId, apiAuthority, viewAuthority, identityAuthority } from '@/api';
import {
    userData,
    identityColumns,
    apiAuthorityColumns,
    identityApiColumns,
    viewAuthorityColumns
} from '@/config/showUser';

class ShowUser extends Component {
    state = {
        size: '用户数据',
        userList: [],
        identityList: [],
        apiAuthorityList: [],
        identityApiList: [],
        viewAuthorityList: []
    };
    handleSizeChange = e => {
        this.setState({ size: e.target.value });
    };
    render() {
        const {
            size,
            userList,
            identityList,
            apiAuthorityList,
            identityApiList,
            viewAuthorityList
        } = this.state;
        return (
            <div className='showUser'>
                <Radio.Group value={ size } onChange={ this.handleSizeChange }>
                    <Radio.Button value='用户数据'>用户数据</Radio.Button>
                    <Radio.Button value='身份数据'>身份数据</Radio.Button>
                    <Radio.Button value='api接口权限'>api接口权限</Radio.Button>
                    <Radio.Button value='身份和api接口关系'>
                        身份和api接口关系
                    </Radio.Button>
                    <Radio.Button value='视图接口权限'>
                        视图接口权限
                    </Radio.Button>
                    <Radio.Button value='身份和视图权限关系'>
                        身份和视图权限关系
                    </Radio.Button>
                </Radio.Group>
                <h2 className='showUserTitles'>{ size }</h2>
                <div className='showUserList'>
                    { size === '用户数据' ? (
                        <ShowUserList columns={ userData } data={ userList } />
                    ) : null }
                    { size === '身份数据' ? (
                        <ShowUserList
                            columns={ identityColumns }
                            data={ identityList }
                        />
                    ) : null }
                    { size === 'api接口权限' ? (
                        <ShowUserList
                            columns={ apiAuthorityColumns }
                            data={ apiAuthorityList }
                        />
                    ) : null }
                    { size === '身份和api接口关系' ? (
                        <ShowUserList
                            columns={ identityApiColumns }
                            data={ identityApiList }
                        />
                    ) : null }
                    { size === '视图接口权限' ? (
                        <ShowUserList
                            columns={ viewAuthorityColumns }
                            data={ viewAuthorityList }
                        />
                    ) : null }
                    { size === '身份和视图权限关系' ? (
                        <ShowUserList
                            columns={ viewAuthorityColumns }
                            data={ viewAuthorityList }
                        />
                    ) : null }
                </div>
            </div>
        );
    }
    componentDidMount() {
        userName().then(res => {
            this.setState({
                userList: res.map(item => {
                    switch (item.identity_id) {
                        case '63no9p-8y0k4':
                            item.identity_id = '管理员';
                            break;
                        case 'uf81yn-hv8uvv':
                            item.identity_id = '出题者';
                            break;
                        case 'zi0gu7-v7dy08':
                            item.identity_id = '浏览者';
                            break;
                    }
                    return item;
                })
            });
        });
        identityId().then(res => {
            this.setState({
                identityList: res
            });
        });
        apiAuthority().then(res => {
            this.setState({
                apiAuthorityList: res
            });
        });
        viewAuthority().then(res => {
            // console.log(res)
        })
        identityAuthority().then(res => {
            console.log(res, 'ressss我是res  联合查询')
            this.setState({
                identityApiList: res
            })
        })
    }
}
export default ShowUser;
