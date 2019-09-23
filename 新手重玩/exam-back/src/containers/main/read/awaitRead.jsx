import React, { Component } from 'react'
import "@/common/css/readCss/read.css"
import { Table, Divider, Tag } from "antd";
import { getpaperlist } from '@/api/index'
const { Column } = Table;

export default class AwaitRead extends Component {
    state = {
        data: [],
        visible: false
    };
    correct(record) {
        console.log(record)
        this.props.history.push("/main/read/detailRead/id=" + record.exam_id)
    }
    componentDidMount() {
        getpaperlist().then(res => {
            console.log(res);
            this.setState({
                data: res.result.map((item, index) => {
                    item.key = index
                    return item
                })
            })
        })

    }
    render() {
        const { columns, data } = this.state;
        return (
            <div className="rea">
                <Table dataSource={data}>
                    <Column title="试卷名称" dataIndex="exam_name" key="exam_name" />
                    <Column title="科目" dataIndex="classType" key="classType" />
                    <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                            <span>
                                <a onClick={this.correct.bind(this, record)}>阅卷</a>
                            </span>
                        )}
                    />
                </Table>
            </div>
        )
    }
}
