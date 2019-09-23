/*
 * 更新用户
 * @Author: chenqiang
 * @Date: 2019-09-08 11:34:00
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-08 12:10:26
 */
import React, { Component } from 'react';
import { Button, Form, Input, Select, message } from 'antd';
import { userName, updateUser } from '@/api';

const { Option } = Select;

@Form.create()
class UpdateUser extends Component {
    state = {
        userName: []
    };
    componentDidMount() {
        userName().then(res => {
            this.setState({
                userName: res
            });
        });
    }
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFieldsAndScroll(async (err, values) => {
            if (!err) {
                let data = await updateUser(values);
                if (data.code) {
                    message.success(data.msg);
                    this.props.form.resetFields();
                } else {
                    message.error(data.msg);
                }
            }
        });
    };
    render() {
        const { userName } = this.state;
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
                    {getFieldDecorator('identityId', {
                        rules: [
                            {
                                required: true,
                                message: '请选择身份id'
                            }
                        ]
                    })(
                        <Select placeholder='请选择身份id'>
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
export default UpdateUser;
