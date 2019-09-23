import React, { Component } from 'react';
import '@/common/css/classCss/student.css';
import {
    getStudent,
    getRoom,
    banClass,
    delStudent,
    searchStudent
} from '@/api';
import { Form, Input, Button, Select, Table, Popconfirm } from 'antd';

const { Option } = Select;
const { Column } = Table;

@Form.create({ name: 'student' })
class student extends Component {
    state = {
        data: [],
        rooms: [],
        bans: [],
        gra: []
    };
    componentDidMount() {
        getStudent().then(res => {
            console.log(res);
            this.setState({
                data: res.result.map((item, index) => {
                    item.key = index;
                    return item;
                })
            });
        });
        getRoom().then(res => {
            console.log(res);
            this.setState({
                rooms: res.result
            });
        });
        banClass().then(res => {
            console.log(res);
            this.setState({
                bans: res.result
            });
        });
    }
    //确定删除
    delBan(record) {
        console.log(record, 'reccccccc');
        delStudent(record.student_id).then(res => {
            getStudent().then(res => {
                this.setState({
                    data: res.result.map((item, index) => {
                        item.key = index;
                        return item;
                    })
                });
            });
        });
    }
    //取消删除
    cancelFn() {}
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFields((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
                searchStudent(values).then(res => {
                    console.log(res);
                    this.setState({
                        data: res.result.map((item, index) => {
                            item.key = index;
                            return item;
                        })
                    });
                });
            }
        });
    };
    reset = () => {
        this.props.form.setFieldsValue({
            name: '',
            room: '' || undefined,
            grade: '' || undefined
        });
        getStudent().then(res => {
            console.log(res);
            this.setState({
                data: res.result.map((item, index) => {
                    item.key = index;
                    return item;
                })
            });
        });
    };
    render() {
        const { getFieldDecorator } = this.props.form;
        const { data } = this.state;

        return (
            <div className='cls'>
                <div className='btn'>
                    <Form onSubmit={this.handleSubmit} layout='inline'>
                        <Form.Item>
                            {getFieldDecorator('name', {
                                initialValue: '郭永鹏'
                            })(<Input placeholder='请输入姓名' />)}
                        </Form.Item>
                        <Form.Item>
                            {getFieldDecorator('grade')(
                                <Select placeholder='请选择班级名'>
                                    {this.state.bans.map((item, index) => {
                                        return (
                                            <Option
                                                value={item.grade_name}
                                                key={index}
                                            >
                                                {item.grade_name}
                                            </Option>
                                        );
                                    })}
                                </Select>
                            )}
                        </Form.Item>
                        <Form.Item>
                            {getFieldDecorator('room')(
                                <Select placeholder='请选择教室号'>
                                    {this.state.rooms.map((item, index) => {
                                        return (
                                            <Option
                                                value={item.room_text}
                                                key={item.room_id}
                                            >
                                                {item.room_text}
                                            </Option>
                                        );
                                    })}
                                </Select>
                            )}
                        </Form.Item>
                        <Button type='primary' htmlType='submit'>
                            搜索
                        </Button>
                        &nbsp;
                        <Button type='primary' onClick={this.reset.bind(this)}>
                            重置
                        </Button>
                    </Form>
                </div>
                <Table dataSource={data}>
                    <Column
                        title='姓名'
                        dataIndex='student_name'
                        key='student_name'
                    />
                    <Column
                        title='学号'
                        dataIndex='student_id'
                        key='student_id'
                    />
                    <Column
                        title='班级'
                        dataIndex='grade_name'
                        key='grade_name'
                    />
                    <Column
                        title='教室'
                        dataIndex='room_text'
                        key='room_text'
                    />
                    <Column
                        title='密码'
                        dataIndex='student_pwd'
                        key='student_pwd'
                    />
                    <Column
                        title='操作'
                        render={(text, record) => (
                            <Popconfirm
                                title='你确定删除？'
                                okText='Yes'
                                cancelText='No'
                                onCancel={() => this.cancelFn(record)}
                                onConfirm={this.delBan.bind(this, record)}
                            >
                                <a href='#'>删除</a>
                            </Popconfirm>
                        )}
                    />
                </Table>
            </div>
        );
    }
}
export default student;
