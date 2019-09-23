/*
 * @Author: chenqiang
 * @Date: 2019-09-03 23:19:37
 * @Last Modified by: chenqiang
 * @Last Modified time: 2019-09-11 15:35:46
 */
import React from 'react';
import { Card, Button, Modal, Input } from 'antd';
import '@/common/css/testCss/addTest.css';
import * as api from '@/api/index';
import { Select, message } from 'antd';
import E from 'wangeditor';
//从仓库取出身份id
import { connect } from 'dva';

const { Option } = Select;

const mapStateToProps = state => {
    return {
        uid: state.authorization.uid
    };
};
//import { inject, observer } from 'mobx-react'
//import { withRouter } from 'react-router-dom'

//@withRouter @inject('appStore') @observer
class AddTest extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            editorContent: '', //第一个文本框的内容
            editorContent2: '',
            one: '',
            two: '',
            title: '',
            titleDdata: [], //存储代码类型
            timeTest: [], //时间
            classData: [], //班级储存地方
            typeTime: 'T1', //考试时间字段
            classType: 'C1', //班级类型
            titleType: 'title1', //题目类型
            btn: '提交'
        };
    }
    //三个下拉菜单的值
    handleChangeTest(value) {
        //console.log(`selected ${value}`);
        this.setState({
            typeTime: value
        });
    }
    handleChangeText(value) {
        //console.log(`课程类型 ${value}`);
        this.setState({
            classType: value
        });
    }
    handleChangeTitle(value) {
        //console.log(`题目类型 ${value}`);
        this.setState({
            titleType: value
        });
    }

    async componentDidMount() {
        //判断下这个是添加试题页面还是编辑试题页面
        let { id } = this.props.match.params;
        if (id !== 'null') {
            //根据这个id去找对应的试卷去
            let exit = await api.exitTest(id);
            console.log(exit);
            this.setState({
                title: exit.msg.title,
                one: exit.msg.content,
                two: exit.msg.answer,
                btn: '编辑'
            });
        }
        let titleDdata = await api.getTitleType();
        this.setState({
            titleDdata: titleDdata.msg
        });

        // //获取考试时间
        let timeResult = await api.getTestType();
        //console.log(timeResult);
        this.setState({
            timeTest: timeResult.msg
        });

        // //发起网络请求 获取课程数据
        let result = await api.getClassType();
        //console.log(result);
        this.setState({
            classData: result.msg
        });

        //富文本
        const elemMenu = this.refs.editorElemMenu;
        const elemBody = this.refs.editorElemBody;

        const elemMenu2 = this.refs.editorElemMenu2;
        const elemBody2 = this.refs.editorElemBody2;

        const editor = new E(elemMenu, elemBody);
        const editor2 = new E(elemMenu2, elemBody2);
        // 使用 onchange 函数监听内容的变化，并实时更新到 state 中
        editor.customConfig.onchange = html => {
            console.log(editor.txt.html());
            this.setState({
                // editorContent: editor.txt.text()
                editorContent: editor.txt.html()
            });
        };

        editor2.customConfig.onchange = html => {
            console.log(editor2.txt.html());
            this.setState({
                // editorContent: editor.txt.text()
                editorContent2: editor2.txt.html()
            });
        };

        editor.customConfig.menus = [
            'head', // 标题
            'bold', // 粗体
            'fontSize', // 字号
            'fontName', // 字体
            'italic', // 斜体
            'underline', // 下划线
            'strikeThrough', // 删除线
            'foreColor', // 文字颜色
            'backColor', // 背景颜色
            'link', // 插入链接
            'list', // 列表
            'justify', // 对齐方式
            'quote', // 引用
            'emoticon', // 表情
            'image', // 插入图片
            'table', // 表格
            'video', // 插入视频
            'code', // 插入代码
            'undo', // 撤销
            'redo' // 重复
        ];
        editor2.customConfig.menus = [
            'head', // 标题
            'bold', // 粗体
            'fontSize', // 字号
            'fontName', // 字体
            'italic', // 斜体
            'underline', // 下划线
            'strikeThrough', // 删除线
            'foreColor', // 文字颜色
            'backColor', // 背景颜色
            'link', // 插入链接
            'list', // 列表
            'justify', // 对齐方式
            'quote', // 引用
            'emoticon', // 表情
            'image', // 插入图片
            'table', // 表格
            'video', // 插入视频
            'code', // 插入代码
            'undo', // 撤销
            'redo' // 重复
        ];
        editor.customConfig.uploadImgShowBase64 = true;
        editor.create();
        editor2.customConfig.uploadImgShowBase64 = true;
        editor2.create();
    }

    //点击确定按钮进行的操作
    async submit() {
        //console.log(this.state.editorContent.blocks[0],"第一个文本域");
        // console.log(this.state.editorContentTow, "第二个文本域");
        // console.log(this.state.title, "标题");
        // console.log(this.state.typeTime, "考试时间")
        // console.log(this.state.classType, "课程类型")
        // console.log(this.state.titleType, "题目类型")
        let data = {
            content: this.state.editorContent,
            answer: this.state.editorContent2,
            title: this.state.title,
            timeId: this.state.typeTime,
            classId: this.state.classType,
            titleId: this.state.titleType,
            uid: this.props.uid
        };
        console.log(data);
        //发送接口
        let result;

        if (this.state.btn === '提交') {
            result = await api.saveTest(data);
        } else {
            result = await api.updateTest(data);
        }

        if (result.code) {
            message.success(result.msg, 1);
        } else {
            message.error(result.msg, 1);
        }
    }

    render() {
        const { editorState, title, editorStateTow } = this.state;
        return (
            <div className='shop'>
                <h1>题目信息</h1>
                <div className='title'>
                    <h3>题干</h3>
                    <Input
                        value={title}
                        maxLength={20}
                        placeholder='请输入题目标题,不超过20个字'
                        onChange={e => {
                            this.setState({
                                title: e.target.value
                            });
                        }}
                        max={20}
                        len={20}
                    />
                </div>

                <div className='text-area'>
                    <div
                        ref='editorElemMenu'
                        style={{
                            backgroundColor: '#f1f1f1',
                            border: '1px solid #ccc'
                        }}
                        className='editorElem-menu'
                    ></div>
                    <div
                        style={{
                            padding: '0 10px',
                            overflowY: 'scroll',
                            height: 300,
                            border: '1px solid #ccc',
                            borderTop: 'none'
                        }}
                        ref='editorElemBody'
                        className='editorElem-body'
                    >
                        {this.state.one}
                    </div>
                </div>

                <div className='list'>
                    <div className='item'>
                        <p>请选择考试类型：</p>
                        <Select
                            defaultValue='周考一'
                            style={{ width: 220 }}
                            onChange={this.handleChangeTest.bind(this)}
                        >
                            {this.state.timeTest.map(item => {
                                return (
                                    <Option
                                        value={item.timeId}
                                        key={item.timeId}
                                    >
                                        {item.timeType}
                                    </Option>
                                );
                            })}
                        </Select>
                    </div>
                    <div className='item'>
                        <p>请选择课程类型：</p>
                        <Select
                            defaultValue='JavaScript上'
                            style={{ width: 220 }}
                            onChange={this.handleChangeText.bind(this)}
                        >
                            {this.state.classData.map(item => {
                                return (
                                    <Option
                                        value={item.classId}
                                        key={item.classId}
                                    >
                                        {item.classType}
                                    </Option>
                                );
                            })}
                        </Select>
                    </div>
                    <div className='item'>
                        <p>请选择题目类型</p>
                        <Select
                            defaultValue='解答题'
                            style={{ width: 220 }}
                            onChange={this.handleChangeTitle.bind(this)}
                        >
                            {this.state.titleDdata.map(item => {
                                return (
                                    <Option
                                        value={item.titleId}
                                        key={item.titleId}
                                    >
                                        {item.titleType}
                                    </Option>
                                );
                            })}
                        </Select>
                    </div>
                </div>

                <div className='text-area'>
                    <div
                        ref='editorElemMenu2'
                        style={{
                            backgroundColor: '#f1f1f1',
                            border: '1px solid #ccc'
                        }}
                        className='editorElem-menu'
                    ></div>
                    <div
                        style={{
                            padding: '0 10px',
                            overflowY: 'scroll',
                            height: 300,
                            border: '1px solid #ccc',
                            borderTop: 'none'
                        }}
                        ref='editorElemBody2'
                        className='editorElem-body'
                    >
                        {this.state.two}
                    </div>
                </div>
                <div className='submit'>
                    <Button
                        type='primary'
                        icon='plus'
                        onClick={this.submit.bind(this)}
                    >
                        {this.state.btn}
                    </Button>
                </div>
            </div>
        );
    }
}

export default connect(mapStateToProps)(AddTest);
