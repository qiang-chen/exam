
import React, { Component } from 'react'
import "@/common/css/classCss/class.css"
import { getRoom, addRoom, delRoom } from "@/api"
import {
    Form,
    Input,
    Table,
    Button,
    Modal,
    Popconfirm
} from 'antd';


const { Column } = Table;

@Form.create({ name: 'room' })

class room extends Component {
    state = {
        size: 'large',
        visible: false,
        data: []
    };

    componentDidMount() {
        getRoom().then(res => {
            console.log(res);
            this.setState({
                data: res.result.map((item, index) => {
                    item.key = index
                    return item
                })
            });
        });
    }
    addRooms(params) {
        addRoom(params).then(res => {
            console.log(res);
            getRoom().then(res => {
                console.log(res);
                this.setState({
                    data: res.result.map((item, index) => {
                        item.key = index
                        return item
                    })
                });
            });
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
                this.addRooms(values);
            }
        });
    };


    handleCancel = e => {
        this.setState({
            visible: false,
        });
    };
    delRooms(record) {
        console.log(record)
        delRoom(record.room_id).then(res => {
            console.log(res)
            getRoom().then(res => {
                console.log(res);
                this.setState({
                    data: res.result.map((item, index) => {
                        item.key = index
                        return item
                    })
                });
            });
        })
    }
    render() {
        const { size, data } = this.state;
        const { getFieldDecorator } = this.props.form;
        const formItemLayout = {
            labelCol: {
                xs: { span: 24 },
                sm: { span: 6 },
            },
            wrapperCol: {
                xs: { span: 24 },
                sm: { span: 10 },
            },
        };
        return (
            <div className="cls">
                <div className="btn">
                    <Button type="primary" style={ { padding: "0 40px" } } size={ size } onClick={ this.showModal }>+ 添加教室</Button>
                    <Modal
                        title="添加教室"
                        visible={ this.state.visible }
                        onOk={ this.handleOk }
                        onCancel={ this.handleCancel }
                        okButtonProps cancelButtonProps
                        okText="提交" cancelText="取消" >
                        <Form { ...formItemLayout } onSubmit={ this.handleSubmit }>
                            <Form.Item label="教室号">
                                { getFieldDecorator('room', {
                                    rules: [
                                        {
                                            required: true,
                                            message: '请选择教室号!',
                                        },
                                    ],
                                })(<Input placeholder="请选择教室号" />) }
                            </Form.Item>
                        </Form>
                    </Modal>
                </div>
                <Table dataSource={ data }>
                    <Column title="教室号" dataIndex="room_text" key="room_text" />
                    <Column
                        title="操作"
                        render={ (text, record) => (
                            <Popconfirm
                                title="Are you sure？"
                                okText="Yes"
                                cancelText="No"
                                onCancel={ () => this.cancelFn(record) }
                                onConfirm={ this.delRooms.bind(this, record) }
                            >
                                <a href="#">删除</a>
                            </Popconfirm>
                        ) }
                    />
                </Table>
            </div>
        )
    }

}
export default room;
