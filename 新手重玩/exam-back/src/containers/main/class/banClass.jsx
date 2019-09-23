
import React, { Component } from 'react'
import "@/common/css/classCss/class.css"

import { banClass, addBanClass, getRoom, delGrade, updateGrade, getSubject } from "@/api"

import { Form, Input, Select, Table, Divider, Button, Modal, Popconfirm } from 'antd';

const { Option } = Select;
const { Column } = Table;
@Form.create({ name: 'class' })

class componentName extends Component {
    state = {
        size: 'large',
        visible: false,
        visible2: false,
        rooms: [],
        subjects: [],
        data: [],
        guard: '',
        sub: '',
        rom: ''
    };

    componentDidMount() {
        banClass().then(res => {
            console.log(res)
            this.setState({
                data: res.result.map((item, index) => {
                    item.key = index
                    return item
                })
            })
        })
        getRoom().then(res => {
            console.log(res)
            this.setState({
                rooms: res.result
            });
        });
        getSubject().then(res => {
            console.log(res)
            this.setState({
                subjects: res.result
            });
        });
    }

    //添加班级
    addGuade(params) {
        addBanClass(params).then(res => {
            console.log(res, '添加班级成功了');
            banClass().then(res => {
                console.log(res)
                this.setState({
                    data: res.result.map((item, index) => {
                        item.key = index
                        return item
                    })
                })
            })
        });
    }

    showModal = () => {
        this.setState({
            visible: true,
            confirmDirty: false
        });
    };

    handleOk = e => {
        this.setState({
            visible: false
        });
        e.preventDefault();
        this.props.form.validateFieldsAndScroll((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
                this.addGuade(values);

            }
        });
    };

    handleCancel = e => {
        this.setState({
            visible: false,
        });
    };
    //删除
    delBan(record) {
        console.log(record.grade_name)
        delGrade(record.grade_name).then(res => {
            console.log(res)
            banClass().then(res => {
                console.log(res)
                this.setState({
                    data: res.result.map((item, index) => {
                        item.key = index
                        return item
                    })
                })
            })
        })
    }
    //修改
    alter(record) {
        console.log(record)
        this.setState({
            visible2: true,
            guard: record.grade_name,
            rom: record.room_text,
            sub: record.classType
        });
    }
    handleOk2 = e => {
        this.setState({
            visible2: false,
        });
        e.preventDefault();
        this.props.form.validateFieldsAndScroll((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
                updateGrade(values).then(res => {
                    console.log(res)
                    banClass().then(res => {
                        console.log(res)
                        this.setState({
                            data: res.result.map((item, index) => {
                                item.key = index
                                return item
                            })
                        })
                    })
                })
            }
        });
    };

    handleCancel2 = e => {
        this.setState({
            visible2: false,
        });
    };
    cancelFn() {

    }
    render() {
        const { size, data } = this.state;
        const { getFieldDecorator } = this.props.form;
        const formItemLayout = {
            labelCol: {
                xs: { span: 5 },
                sm: { span: 5 },
            },
            wrapperCol: {
                xs: { span: 8 },
                sm: { span: 16 },
            },
        };
        return (
            <div className="cls">
                <div className="btn">
                    <Button
                        type="primary"
                        style={ { padding: "0 40px" } }
                        size={ size }
                        onClick={ this.showModal }
                    >+ 添加班级</Button>
                    <Modal
                        title="添加班级"
                        visible={ this.state.visible }
                        onOk={ this.handleOk }
                        onCancel={ this.handleCancel }
                        okButtonProps cancelButtonProps
                        okText="提交" cancelText="取消" >
                        <Form { ...formItemLayout } onSubmit={ this.handleSubmit }>
                            <Form.Item label="班级名">
                                { getFieldDecorator('ban', {
                                    rules: [
                                        {
                                            required: true,
                                            message: '请选择班级号!',
                                        },
                                    ],
                                })(<Input placeholder="请选择班级号" />) }
                            </Form.Item>
                            <Form.Item label="教室号" >
                                { getFieldDecorator('room', {
                                    rules: [
                                        {
                                            required: true,
                                            message: '请选择教室号!',
                                        },
                                    ],
                                })(
                                    <Select placeholder="请选择教室号" >
                                        {
                                            this.state.rooms.map((item, index) => {
                                                return <Option value={ item.room_text } key={ item.room_id }>{ item.room_text }</Option>
                                            })
                                        }
                                    </Select>
                                ) }
                            </Form.Item>
                            <Form.Item label="课程名" >
                                { getFieldDecorator('subject', {
                                    rules: [
                                        {
                                            required: true,
                                            message: '请选择课程名!',
                                        },
                                    ],
                                })(
                                    <Select placeholder="请选择课程名">
                                        {
                                            this.state.subjects.map((item, index) => {
                                                return <Option value={ item.classType } key={ item.classId }>{ item.classType }</Option>
                                            })
                                        }
                                    </Select>,
                                ) }
                            </Form.Item>
                        </Form>
                    </Modal>
                </div>
                <Table dataSource={ data }>
                    <Column title="班级名" dataIndex="grade_name" key="grade_name" />
                    <Column title="课程名" dataIndex="classType" key="classType" />
                    <Column title="教室号" dataIndex="room_text" key="room_text" />
                    <Column
                        title="操作"
                        render={ (text, record) => (
                            <span>
                                <a onClick={ this.alter.bind(this, record) }>修改 { record.lastName }</a>
                                <Divider type="vertical" />
                                <Popconfirm
                                    title="你确定删除？"
                                    okText="Yes"
                                    cancelText="No"
                                    onCancel={ () => this.cancelFn(record) }
                                    onConfirm={ this.delBan.bind(this, record) }
                                >
                                    <a href="#">删除</a>
                                </Popconfirm>
                            </span>
                        )
                        }
                    />
                </Table>
                <Modal
                    title="修改班级"
                    visible={ this.state.visible2 }
                    onOk={ this.handleOk2 }
                    onCancel={ this.handleCancel2 }
                    okButtonProps cancelButtonProps
                    okText="提交" cancelText="取消" >
                    <Form { ...formItemLayout } onSubmit={ this.handleSubmit }>
                        <Form.Item label="班级名">
                            { getFieldDecorator('ban', { initialValue: `${this.state.guard}` }, {
                                rules: [
                                    {
                                        required: true,
                                        message: '请选择班级号!',
                                    },
                                ],
                            })(<Input placeholder="请选择班级号" disabled />) }
                        </Form.Item>
                        <Form.Item label="教室号" >
                            { getFieldDecorator('room', {
                                rules: [
                                    {
                                        required: true,
                                        message: '请选择教室号!',
                                    },
                                ],
                            })(
                                <Select placeholder="请选择教室号" >
                                    {
                                        this.state.rooms.map((item, index) => {
                                            return <Option value={ item.room_text } key={ item.room_id }>{ item.room_text }</Option>
                                        })
                                    }
                                </Select>
                            ) }
                        </Form.Item>
                        <Form.Item label="课程名" >
                            { getFieldDecorator('subject', {
                                rules: [
                                    {
                                        required: true,
                                        message: '请选择课程名!',
                                    },
                                ],
                            })(
                                <Select placeholder="请选择课程名">
                                    {
                                        this.state.subjects.map((item, index) => {
                                            return <Option value={ item.classType } key={ item.classId }>{ item.classType }</Option>
                                        })
                                    }
                                </Select>,
                            ) }
                        </Form.Item>
                    </Form>
                </Modal>
            </div>
        )
    }

}
export default componentName;
