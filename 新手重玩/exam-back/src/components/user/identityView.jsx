/*
 * 给身份设置视图权限
 * @Author: yixian
 * @Date: 2019-09-03 11:50:43

 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-07 17:55:32
 */
import React, { Component } from 'react';
import { Button, Form, Select } from 'antd';

const { Option } = Select;

@Form.create()
class IdentityView extends Component {
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFieldsAndScroll((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
            }
        });
    };
    render() {
        const { getFieldDecorator } = this.props.form;
        const { identityId, viewAuthority } = this.props;
        return (
            <Form onSubmit={this.handleSubmit}>
                <Form.Item className='addUserItem'>
                    {getFieldDecorator('identityId', {
                        rules: [
                            {
                                required: true,
                                message: '请选择身份id!'
                            }
                        ]
                    })(
                        <Select placeholder='请选择身份id'>
                            {identityId
                                ? identityId.map(item => (
                                      <Option
                                          key={item.key}
                                          value={item.identity_id}>
                                          {item.identity_text}
                                      </Option>
                                  ))
                                : null}
                        </Select>
                    )}
                </Form.Item>
                <Form.Item className='addUserItem'>
                    {getFieldDecorator('viewId', {
                        rules: [
                            {
                                required: true,
                                message: '请选择视图权限id!'
                            }
                        ]
                    })(
                        <Select placeholder='请选择视图权限id'>
                            {viewAuthority
                                ? viewAuthority.map(item => (
                                      <Option
                                          key={item.view_authority_id}
                                          value={item.view_id}>
                                          {item.view_authority_text}
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
export default IdentityView;
