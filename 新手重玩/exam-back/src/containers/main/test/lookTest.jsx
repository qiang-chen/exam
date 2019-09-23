/*
 * @Author: chenqiang
 * @Date: 2019-09-03 23:19:44
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-09 19:41:54
 */
import React from 'react';
import { Form, Table, Tag } from 'antd';
import { Select, Button } from 'antd';
import '@/common/css/testCss/lookTest.css';
import * as api from '@/api/index'; //引入api

const { Option } = Select;

const columns = [
    {
        title: '试卷题目',
        dataIndex: 'opj',
        key: 'opj',
        render: text => (
            <ul>
                <li>{text.title}</li>
                <li>
                    <Tag color='cyan'>{text.classType}</Tag>
                    <Tag color='geekblue'>{text.titleType}</Tag>
                    <Tag color='gold'>{text.timeType}</Tag>
                </li>
                <li>{text.username}发布</li>
            </ul>
        )
    },
    {
        title: '操作',
        key: 'btn',
        dataIndex: 'btn'
    }
];

class LookTest extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            classData: [], //课程数组储存位置
            timeTest: [], //考试时间储存位置
            titleDdata: [], //存储题目类型
            getQuestions: [], //试卷题目储存单位
            count: '', //给上面的东西添加类名使用
            flag: false,
            timeTset: '', //考试类型
            questionType: '' //题目类型
        };
    }
    async componentDidMount() {
        //发起网络请求 获取课程数据
        let result = await api.getClassType();
        //console.log(result)
        this.setState({
            classData: result.msg
        });

        //获取考试时间
        let timeResult = await api.getTestType();
        this.setState({
            timeTest: timeResult.msg
        });

        //获取考试题目类型
        let titleDdata = await api.getTitleType();
        this.setState({
            titleDdata: titleDdata.msg
        });

        //获取试卷题目列表
        let getQuestions = await api.getQuestions();

        let newGetQuestions = getQuestions.msg.map((item, index) => {
            item.key = index;
            item.opj = item;
            item.btn = '编辑';
            return item;
        });
        this.setState({
            getQuestions: newGetQuestions
        });
    }
    render() {
        return (
            <div className='demo-infinite-container'>
                <div className='top'>
                    <div className='top-item'>
                        <div className='left'>
                            <span>课程类型</span>
                        </div>
                        <div className='right-one'>
                            <span
                                className={this.state.flag ? 'active' : ''}
                                onClick={() => {
                                    this.setState({
                                        flag: true,
                                        count: ''
                                    });
                                }}
                            >
                                All
                            </span>
                            {this.state.classData.map((item, index) => {
                                return (
                                    <span
                                        key={index}
                                        className={
                                            item.classId === this.state.count ||
                                            this.state.flag
                                                ? 'active'
                                                : ''
                                        }
                                        onClick={() => {
                                            //console.log(item.classId, '点击ID');
                                            this.setState({
                                                count: item.classId,
                                                flag: false
                                            });
                                        }}
                                    >
                                        {item.classType}
                                    </span>
                                );
                            })}
                        </div>
                    </div>
                    <div className='top-item'>
                        <div className='left-two'>
                            <span>考试类型</span>
                        </div>
                        <div className='right'>
                            <div className='item'>
                                <p>请选择考试类型：</p>

                                <Select
                                    defaultValue='周考一'
                                    style={{ width: 120 }}
                                    onChange={this.handleChangeTest.bind(this)}
                                >
                                    {this.state.timeTest.map((item, index) => {
                                        return (
                                            <Option
                                                value={item.timeId}
                                                key={index}
                                            >
                                                {item.timeType}
                                            </Option>
                                        );
                                    })}
                                </Select>
                            </div>
                            <div className='item'>
                                <p>请选择题目类型 :</p>
                                <Select
                                    defaultValue='解答题'
                                    style={{ width: 120 }}
                                    onChange={this.handleChangeTitle.bind(this)}
                                >
                                    {this.state.titleDdata.map(
                                        (item, index) => {
                                            return (
                                                <Option
                                                    value={item.titleId}
                                                    key={index}
                                                >
                                                    {item.titleType}
                                                </Option>
                                            );
                                        }
                                    )}
                                </Select>
                            </div>
                            <div className='item'>
                                <Button
                                    type='primary'
                                    icon='search'
                                    onClick={this.mySearch.bind(this)}
                                >
                                    搜索
                                </Button>
                            </div>
                        </div>
                    </div>
                </div>
                <Table
                    columns={columns}
                    dataSource={this.state.getQuestions}
                    onRow={record => {
                        return {
                            onClick: event => {
                                event.persist();
                                //record 是每一行的一个参数
                                //携带者题目id跳到登录页面
                                this.props.history.push(
                                    '/main/test/addTest/' + record.tid
                                );
                            } // 点击行
                        };
                    }}
                />
            </div>
        );
    }
    handleChangeTest(value) {
        this.setState({
            timeTset: value
        });
    }
    handleChangeTitle(value) {
        this.setState({
            questionType: value
        });
    }
    async mySearch() {
        const parmas = {
            timeTset: this.state.timeTset,
            count: this.state.count,
            questionType: this.state.questionType
        };
        let data = await api.searchQuestion(parmas);
        console.log(data);
        let newGetQuestions = data.msg.map((item, index) => {
            item.key = index;
            item.opj = item;
            item.btn = '编辑';
            return item;
        });
        this.setState({
            getQuestions: newGetQuestions
        });
    }
}

export default LookTest;
