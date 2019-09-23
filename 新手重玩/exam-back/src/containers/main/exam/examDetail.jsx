import React, { Component } from 'react';
import { Form, List, Modal, Button, Select } from 'antd';
import { getExamListDetail, banClass } from '@/api/index';

const { Option } = Select;
@Form.create({ name: 'horizontal_login' })
class examDetail extends Component {
    state = {
        data: [],
        visible: false,
        banlist: []
    };

    showModal = () => {
        this.setState({
            visible: true
        });
    };

    handleOk = e => {
        console.log(e);
        this.setState({
            visible: false
        });
    };

    handleCancel = e => {
        console.log(e);
        this.setState({
            visible: false
        });
    };
    handleChange(value) {
        console.log(`selected ${value}`);
    }
    componentDidMount() {
        // console.log(this.props.match.params.id)
        const id = this.props.match.params.id;
        getExamListDetail(id).then(res => {
            this.setState({
                data: res.result
            });
        });
        banClass().then(res => {
            this.setState({
                banlist: res.result
            });
        });
    }

    render() {
        const { data, banlist } = this.state;
        const { getFieldDecorator } = this.props.form;
        return (
            <div>
                <Form
                    layout='inline'
                    onSubmit={this.handleSubmit}
                    style={{ marginBottom: '20px' }}
                >
                    <Form.Item>
                        {getFieldDecorator('data', {
                            rules: [{ required: true }]
                        })(
                            <List
                                style={{ border: 'none' }}
                                bordered
                                dataSource={data}
                                renderItem={item => (
                                    <div>
                                        <h3>{item.title}:</h3>
                                        <List.Item>{item.content}</List.Item>
                                    </div>
                                )}
                            />
                        )}
                    </Form.Item>
                </Form>
                <div className='btns'>
                    <Button type='primary' onClick={this.showModal}>
                        提交试题
                    </Button>
                    <Modal
                        title='Basic Modal'
                        visible={this.state.visible}
                        onOk={this.handleOk}
                        onCancel={this.handleCancel}
                    >
                        <Select style={{ width: 120 }}>
                            {banlist.map((item, index) => {
                                return (
                                    <Option value={item.grade_name} key={index}>
                                        {item.grade_name}
                                    </Option>
                                );
                            })}
                        </Select>
                    </Modal>
                </div>
            </div>
        );
    }
}

export default examDetail;
