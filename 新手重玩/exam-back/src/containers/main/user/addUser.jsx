/*
 * @Author: chenqiang
 * @Date: 2019-09-08 11:17:15
 * @Last Modified by: GF
 * @Last Modified time: 2019-09-08 19:16:53
>>>>>>> f1ed840c803db19c3a67bba04f49379a5d734317
 */
import React, { Component } from 'react';
import '@/common/css/userCss/addUser.css';
import { Button, Radio, Form } from 'antd';
import AddUsers from '@/components/user/addUser';
import UpdateUser from '@/components/user/updateUser';
import AddIdentity from '@/components/user/addIdentity';
import AddApi from '@/components/user/addApi';
import View from '@/components/user/view';
import IdentityApi from '@/components/user/identityApi';
import IdentityView from '@/components/user/identityView';
import { identityId, viewAuthority } from '@/api';
import Item from 'antd/lib/list/Item';

@Form.create()
class AddUser extends Component {
    state = {
        size: '添加用户',
        identityId: [],
        viewAuthority: []
    };
    handleSizeChange = e => {
        this.setState({ size: e.target.value });
    };
    render() {
        const { size, identityId, viewAuthority } = this.state;
        return (
            <div className='addUser'>
                <div
                    className='
                                addUser_wrapper 
                                addUser_wrapper_left 
                                addUser_wrapper_top 
                                addUser_wrapper_right 
                                addUser_wrapper_bottom
                '>
                    <div className='addUserItem'>
                        <Radio.Group
                            value={size}
                            onChange={this.handleSizeChange}>
                            <Radio.Button value='添加用户'>
                                添加用户
                            </Radio.Button>
                            <Radio.Button value='更新用户'>
                                更新用户
                            </Radio.Button>
                        </Radio.Group>
                    </div>
                    {size === '添加用户' ? (
                        <AddUsers identityId={identityId} />
                    ) : (
                        <UpdateUser identityId={identityId} />
                    )}
                </div>
                <div
                    className='
                                addUser_wrapper
                                addUser_wrapper_top 
                                addUser_wrapper_right 
                                addUser_wrapper_bottom
                '>
                    <div className='addUserItem'>
                        <Button type='primary' ghost>
                            添加身份
                        </Button>
                    </div>
                    <AddIdentity />
                </div>
                <div
                    className='
                                addUser_wrapper 
                                addUser_wrapper_top 
                                addUser_wrapper_right 
                                addUser_wrapper_bottom
                '>
                    <div className='addUserItem'>
                        <Button type='primary' ghost>
                            添加api接口权限
                        </Button>
                    </div>
                    <AddApi />
                </div>
                <div
                    className='
                                addUser_wrapper 
                                addUser_wrapper_left 
                                addUser_wrapper_right 
                                addUser_wrapper_bottom
                '>
                    <div className='addUserItem'>
                        <Button type='primary' ghost>
                            添加视图接口权限
                        </Button>
                    </div>
                    <View viewAuthority={viewAuthority} />
                </div>
                <div
                    className='
                                addUser_wrapper 
                                addUser_wrapper_right 
                                addUser_wrapper_bottom
                '>
                    <div className='addUserItem'>
                        <Button type='primary' ghost>
                            给身份设置api接口权限
                        </Button>
                    </div>
                    <IdentityApi identityId={identityId} />
                </div>
                <div
                    className='
                                addUser_wrapper 
                                addUser_wrapper_right 
                                addUser_wrapper_bottom
                '>
                    <div className='addUserItem'>
                        <Button type='primary' ghost>
                            给身份设置试图权限
                        </Button>
                    </div>
                    <IdentityView
                        identityId={identityId}
                        viewAuthority={viewAuthority}
                    />
                </div>
            </div>
        );
    }
    componentDidMount() {
        //获取所有的身份ID
        identityId().then(res => {
            this.setState({
                identityId: res.map((item, index) => {
                    return {
                        ...item,
                        key: item.id
                    };
                })
            });
        });

        // viewAuthority().then(res => {
        //     this.setState({
        //         viewAuthority: res.map((item, index) => {
        //             return {
        //                 ...item,
        //                 key: index
        //             };
        //         })
        //     });
        // });
    }
}
export default AddUser;
