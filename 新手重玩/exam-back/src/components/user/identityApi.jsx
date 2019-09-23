/*
 * 给身份设置api接口权限
 * @Author: yixian
 * @Date: 2019-09-03 11:50:29
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-08 11:21:29
 */
import React, { Component } from 'react';
import { Button, Form, Select } from 'antd';
import { apiAuthority } from '@/api/index';

const { Option } = Select;

@Form.create()
class IdentityApi extends Component {
    state = {
        apiAuthority: []
    };
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFieldsAndScroll((err, values) => {
            if (!err) {
                console.log(values);
            }
        });
    };
    render() {
        const { getFieldDecorator } = this.props.form;
        const { identityId } = this.props;
        const { apiAuthority } = this.state;
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
                    {getFieldDecorator('apiId', {
                        rules: [
                            {
                                required: true,
                                message: '请选择api接口权限id!'
                            }
                        ]
                    })(
                        <Select placeholder='请选择api接口权限id'>
                            {apiAuthority
                                ? apiAuthority.map(item => (
                                      <Option
                                          key={item.api_authority_id}
                                          value={item.api_authority_id}>
                                          {item.api_authority_text}
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
    componentDidMount() {
        // apiAuthority().then(res => {
        //     this.setState({
        //         apiAuthority: res.map(item => {
        //             return {
        //                 ...item,
        //                 key: item.api_authority_id
        //             };
        //         })
        //     });
        // });
    }
}
export default IdentityApi;
