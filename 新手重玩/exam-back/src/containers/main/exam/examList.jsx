import React from 'react';
import {
    getExamType,
    getCourse,
    getExamList,
    getSearchlist
} from '@/api/index';
import { Form, Select, Table, Button } from 'antd';
import { NavLink } from 'dva/router';

const { Option } = Select;

class AddUser extends React.Component {
    state = {
        columns: [
            {
                title: '试卷信息',
                dataIndex: 'exam_name',
                key: 'exam_id'
                // render: text => <a>{text}</a>
            },
            {
                title: '创建人',
                dataIndex: 'username',
                key: 'username'
            },
            {
                title: '开始',
                key: 'start_exam',
                dataIndex: 'start_exam'
            },
            {
                title: '结束',
                key: 'end_exam',
                dataIndex: 'end_exam'
            },
            {
                title: '操作',
                key: '',
                dataIndex: 'exam_id',
                render: (text, record) => (
                    <span>
                        <NavLink to={`/main/exam/examDetail/${record.exam_id}`}>
                            详情
                        </NavLink>
                    </span>
                )
            }
        ],
        examType: [],
        course: [],
        examList: []
    };
    getLocalTime(nS) {
        return new Date(parseInt(nS))
            .toLocaleString()
            .replace(/年|月/g, '-')
            .replace(/日/g, ' ');
    }
    handleSubmit = e => {
        e.preventDefault();
        this.props.form.validateFields((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
                getSearchlist(values).then(res => {
                    console.log(res);
                    this.setState({
                        examList: res.result
                    });
                });
            }
        });
    };
    normFile = e => {
        if (Array.isArray(e)) {
            return e;
        }
        return e && e.fileList;
    };
    componentDidMount() {
        getExamType().then(res => {
            this.setState({
                examType: res.msg
            });
        });
        getCourse().then(res => {
            this.setState({
                course: res.msg
            });
        });
        getExamList().then(res => {
            console.log(res);
            const arr = res.result;
            this.setState({
                examList: arr.map(item => {
                    return {
                        ...item,
                        start_exam: this.getLocalTime(item.start_exam),
                        end_exam: this.getLocalTime(item.end_exam)
                    };
                })
            });
        });
    }
    render() {
        const { columns, examList } = this.state;
        const { getFieldDecorator } = this.props.form;
        return (
            <div>
                <div
                    className='top'
                    style={{ background: '#fff', padding: '20px' }}
                >
                    <Form onSubmit={this.handleSubmit} layout='inline'>
                        <Form.Item label='考试类型' hasFeedback>
                            {getFieldDecorator('select', {
                                rules: [{ required: true }]
                            })(
                                <Select
                                    class='ant-select-selection--single'
                                    style={{ width: 140 }}
                                >
                                    {this.state.examType.map((item, index) => {
                                        return (
                                            <Option
                                                value={item.timeType}
                                                key={item.timeId}
                                            >
                                                {item.timeType}
                                            </Option>
                                        );
                                    })}
                                </Select>
                            )}
                        </Form.Item>

                        <Form.Item label='课程'>
                            {getFieldDecorator('select-multiple', {
                                rules: [{ required: true }]
                            })(
                                <Select
                                    class='ant-select-selection--single'
                                    style={{ width: 130 }}
                                >
                                    {this.state.course.length &&
                                        this.state.course.map((item, index) => {
                                            return (
                                                <Option key={index}>
                                                    {item.classType}
                                                </Option>
                                            );
                                        })}
                                </Select>
                            )}
                        </Form.Item>

                        <Form.Item wrapperCol={{ span: 12, offset: 6 }}>
                            <Button type='primary' htmlType='submit'>
                                查询
                            </Button>
                        </Form.Item>
                    </Form>
                </div>
                <div
                    className='bottom'
                    style={{ background: '#fff', padding: '20px' }}
                >
                    <Table
                        columns={columns}
                        dataSource={examList}
                        size='middle'
                        rowKey={item => item.exam_id}
                    />
                </div>
            </div>
        );
    }
}

const AddUsers = Form.create({ name: 'validate_other' })(AddUser);
export default AddUsers;
