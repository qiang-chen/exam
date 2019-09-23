/*
 * 添加身份
 * @Author: yixian
 * @Date: 2019-09-03 11:48:47
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-08 12:13:09
 */
import React, { Component } from 'react';
import { Button, Form, Input, message } from 'antd';
import { addIdentity } from '@/api';
@Form.create()
class AddIdentity extends Component {
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFieldsAndScroll((err, values) => {
            if (!err) {
                // console.log('Received values of form: ', values);
                addIdentity(values)
                    .then(res => {
                        if (res.code === 1) {
                            message.success('身份添加成功');
                        }
                    })
                    .catch(error => {
                        message.error('此身份已存在');
                    });
            }
        });
    };
    render() {
        const { getFieldDecorator } = this.props.form;
        return (
            <Form onSubmit={this.handleSubmit}>
                <Form.Item className='addUserItem'>
                    {getFieldDecorator('identityName', {
                        rules: [
                            {
                                required: true,
                                message: 'Please input your identityName!'
                            }
                        ]
                    })(<Input placeholder='请输入身份名称' />)}
                </Form.Item>
                <Form.Item className='typeId'>
                    {getFieldDecorator('typeId', {
                        rules: [
                            {
                                required: true,
                                message: 'Please input your typeId!'
                            }
                        ]
                    })(<Input placeholder='请输入身份type值' />)}
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
export default AddIdentity;
