import React, { Component } from 'react'
import "@/common/css/classCss/class.css"
import { Form, Table } from 'antd';
import { studentExamList } from '@/api/index'

const { Column } = Table;


@Form.create({ name: 'attend' })

class Student extends Component {
    state = {
        data: []
    }
    componentDidMount() {
        studentExamList().then(res => {
            console.log(res)
            this.setState({
                data: res.result.map((item, index) => {
                    item.key = index + 1
                    item.start_exam = this.getLocalTime(item.start_exam)
                    item.end_exam = this.getLocalTime(item.end_exam)
                    return item
                })
            });
        })
    }
    getLocalTime(nS) {
        return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/, ' ');
    }

    //点击参加考试事件跳
    alter(record) {
        console.log(record)
        this.props.history.push("/main/student/detailStudent/" + record.exam_id, { query: record })
    }
    render() {
        const { data } = this.state;
        return (
            <div className="cls">
                <div className="btn">
                    <Table dataSource={data}>
                        <Column title="考试名称" dataIndex="exam_name" key="exam_name" />
                        <Column title="课程科目" dataIndex="classType" key="classType" />
                        <Column title="开始时间" dataIndex="start_exam" key="start_exam" />
                        <Column title="截止时间" dataIndex="end_exam" key="end_exam" />
                        <Column
                            title="操作"
                            render={(text, record) => (
                                <span>
                                    <a onClick={this.alter.bind(this, record)}>参加考试</a>
                                </span>
                            )}
                        />
                    </Table>
                </div>
            </div>
        )
    }
}
export default Student
