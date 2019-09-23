/*
 * 添加用户
 * @Author: chenqiang
 * @Date: 2019-09-08 11:25:22
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-08 11:31:21
 */

import React, { Component } from 'react';
import { Button, Form, Input, Select, message } from 'antd';
import { addUser, identityId } from '@/api';
import jwt from 'jwt-simple';

const { Option } = Select;

@Form.create()
class AddUsers extends Component {
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFieldsAndScroll((err, values) => {
            if (!err) {
                let secret = 'xxx';
                values.addPassWord = jwt.encode(values.addPassWord, secret);
                console.log(values, 'values');

                addUser(values)
                    .then(res => {
                        if (res.code === 1) {
                            message.success('添加成功');
                            //添加成功后顺便清除
                            this.props.form.resetFields();
                        }
                    })
                    .catch(error => {
                        message.error('此用户已存在');
                    });
            }
        });
    };
    render() {
        const { getFieldDecorator } = this.props.form;
        return (
            <Form onSubmit={this.handleSubmit}>
                <Form.Item className='addUserItem'>
                    {getFieldDecorator('addUserName', {
                        rules: [
                            {
                                required: true,
                                message: 'Please input your username!'
                            }
                        ]
                    })(<Input placeholder='请输入用户名' />)}
                </Form.Item>
                <Form.Item className='addUserItem'>
                    {getFieldDecorator('addPassWord', {
                        rules: [
                            {
                                required: true,
                                message: 'Please input your password!'
                            }
                        ]
                    })(<Input placeholder='请输入密码' />)}
                </Form.Item>
                <Form.Item className='addUserItem'>
                    {getFieldDecorator('identityId', {
                        rules: [
                            {
                                required: true,
                                message: '请选择身份!'
                            }
                        ]
                    })(
                        <Select placeholder='请选择身份'>
                            {this.props.identityId
                                ? this.props.identityId.map(item => (
                                      <Option
                                          key={item.id}
                                          value={item.type_id}>
                                          {item.identity}
                                      </Option>
                                  ))
                                : null}
                        </Select>
                    )}
                </Form.Item>
                <Form.Item>
                    <Button type='primary' htmlType='submit'>
                        确定
                    </Button>
                    <Button
                        style={{ marginLeft: 8 }}
                        onClick={() => {
                            this.props.form.resetFields();
                        }}>
                        重置
                    </Button>
                </Form.Item>
            </Form>
        );
    }
}
export default AddUsers;
