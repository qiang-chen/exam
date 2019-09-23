import React, { Component } from 'react';
import { Table, Button, message } from 'antd';

import * as api from '@/api/index';

const columns = [
    {
        title: 'tid',
        dataIndex: 'tid',
        render: text => <a>{text}</a>
    },
    {
        title: 'title',
        dataIndex: 'title'
    }
];

// rowSelection object indicates the need for row selection
class AddExamTest extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: [],
            selectedRows: []
        };
    }
    async componentDidMount() {
        let result = await api.getTestList();
        //console.log(result)
        this.setState({
            data: result.msg.map((item, index) => {
                item.key = index;
                return item;
            })
        });
    }
    render() {
        return (
            <div>
                <h1>添加试题</h1>
                <Table
                    rowSelection={{
                        onChange: (selectedRowKeys, selectedRows) => {
                            this.setState({
                                selectedRows
                            });
                            //console.log(`selectedRowKeys: ${selectedRowKeys}`, 'selectedRows: ', selectedRows);
                        },
                        getCheckboxProps: record => ({
                            disabled: record.name === 'Disabled User', // Column configuration not to be checked
                            name: record.name
                        })
                    }}
                    columns={columns}
                    dataSource={this.state.data}
                />
                <Button onClick={this.add.bind(this)}>
                    点击添加选中的题目
                </Button>
            </div>
        );
    }
    async add() {
        let data = this.state.selectedRows.map(item => item.tid);
        //发送请求将这个题存到对应试卷列表中
        let { id } = this.props.match.params;
        let opj = {
            data,
            id
        };
        let result = await api.updateExam(opj);
        if (result.code) {
            message.success(result.msg, 1, () => {
                //再次跳回试卷列表页面
                this.props.history.push('/main/exam/examList');
            });
        } else {
            message.error(result.msg, 1);
        }
    }
}

export default AddExamTest;
