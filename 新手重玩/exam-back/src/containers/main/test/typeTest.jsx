/*
 * @Author: chenqiang
 * @Date: 2019-09-03 23:19:48
 * @Last Modified by: GF
 * @Last Modified time: 2019-09-10 15:44:53
 */
import React, { Component } from 'react';
import { Modal, Button, Table, Form, message, Input } from 'antd';

import * as api from '@/api/index';

const columns = [
    {
        title: '类型ID',
        dataIndex: 'titleId',
        key: 'titleId',
        render: text => <b>{text}</b>
    },
    {
        title: '类型名称',
        dataIndex: 'titleType',
        key: 'titleType'
    }
];

@Form.create()
class TypeTest extends Component {
    state = {
        visible: false,
        data: []
    };
    showModal = () => {
        this.setState({
            visible: true
        });
    };
    success = () => {
        message.success('添加成功');
    };
    handleOk = e => {
        e.preventDefault();
        this.props.form.validateFields((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
                api.addTestType(values).then(res => {
                    console.log(res);
                });
                this.success();
                this.setState(
                    {
                        visible: false
                    },
                    async () => {
                        let data = await api.getTitleType();
                        this.setState({
                            data: data.msg.map((item, index) => {
                                item.index = index + 'a';
                                item.key = index;
                                return item;
                            })
                        });
                    }
                );
            }
        });
    };

    handleCancel = e => {
        console.log(e);
        this.setState({
            visible: false
        });
    };
    render() {
        const { getFieldDecorator } = this.props.form;
        return (
            <div className='title' style={{ marginBottom: '20px' }}>
                <Button type='primary' onClick={this.showModal}>
                    添加类型
                </Button>
                <Modal
                    title='添加类型'
                    visible={this.state.visible}
                    onOk={this.handleOk}
                    onCancel={this.handleCancel}
                    onClick={this.success}
                >
                    <Form onSubmit={this.handleOk} className='login-form'>
                        <Form.Item>
                            {getFieldDecorator('testType', {
                                rules: [
                                    {
                                        required: true,
                                        message: '请输入试题类型'
                                    }
                                ]
                            })(<Input placeholder='试题类型' />)}
                        </Form.Item>
                        <Form.Item>
                            {getFieldDecorator('titleID', {
                                rules: [
                                    { required: true, message: '请输入试题ID' }
                                ]
                            })(<Input placeholder='试题ID' />)}
                        </Form.Item>
                    </Form>
                </Modal>
                <Table columns={columns} dataSource={this.state.data} />
            </div>
        );
    }
    async componentDidMount() {
        let data = await api.getTitleType();
        this.setState({
            data: data.msg.map((item, index) => {
                item.index = index + 'a';
                item.key = index;
                return item;
            })
        });
    }
}
export default TypeTest;
