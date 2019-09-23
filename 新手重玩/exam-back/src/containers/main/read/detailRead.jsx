import React, { Component } from 'react'
import "@/common/css/readCss/read.css"
import { Form, Button, Select, Table } from 'antd';
import { banClass } from "@/api"
const { Option } = Select;
const { Column } = Table;

@Form.create({ name: 'detailRead' })

class detailRead extends Component {
    state = {
        bans: [],
        data: []
    }
    componentDidMount() {
        banClass().then(res => {
            console.log(res)
            this.setState({
                bans: res.result.map((item, index) => {
                    item.key = index
                    return item
                })
            })
        })
    }

    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFields((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
            }
        });
    };

    render() {
        const { getFieldDecorator } = this.props.form
        const { data } = this.state;

        return (
            <div className="rea">
                <div className="btn">
                    <Form onSubmit={this.handleSubmit} layout="inline">
                        <Form.Item label="状态">
                            {getFieldDecorator('status')(
                                <Select>
                                    <Option value="200">200</Option>
                                </Select>
                            )}
                        </Form.Item>
                        <Form.Item label="班级">
                            {getFieldDecorator('class')(
                                <Select placeholder="请选择班级名">
                                    {
                                        this.state.bans.map((item, index) => {
                                            return <Option value={item.grade_name} key={item.grade_id}>{item.grade_name}</Option>
                                        })
                                    }
                                </Select>
                            )}
                        </Form.Item>
                        <Button type="primary" htmlType="submit">
                            查询
                        </Button>
                    </Form>
                </div>
                <Table dataSource={data} rowKey={item => item.grade_id}>
                    <Column title="班级" dataIndex="grade_id" key="grade_id" />
                    <Column title="姓名" dataIndex="student_name" key="student_name" />
                    <Column title="阅卷状态" dataIndex="marking_status" key="marking_status" />
                    <Column title="开始时间" dataIndex="start_time" key="start_time" />
                    <Column title="结束时间" dataIndex="end_time" key="end_time" />
                    <Column title="成材率" dataIndex="yield" key="yield" />
                    <Column
                        title="操作"
                        render={(text, record) => (
                            <span>
                                <a>批卷</a>
                            </span>
                        )}
                    />
                </Table>
            </div>
        )
    }
}
export default detailRead
