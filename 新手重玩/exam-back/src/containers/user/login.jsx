import React, { Component } from 'react';
import { Row, Col, Form, Icon, Input, Button, message } from 'antd';
import { connect } from 'dva'; //引入connect组件使用dva仓库
import { setCookie } from '@/utils/creatToken'; //引入本地存储值
import jwt from 'jwt-simple';
import * as api from '@/api/user'; //引入网络发送文件
import '@/common/css/loginCss/index.css';

const mapStateToProps = function(state) {
    return {
        token: state.authorization.token,
        types: state.authorization.types
    };
};

@Form.create({ name: 'normal_login' })
@connect(mapStateToProps)
class Login extends Component {
    constructor(props) {
        super(props);
        this.state = {
            Verify: '',
            keyId: ''
        };
    }
    render() {
        const { getFieldDecorator } = this.props.form;
        return (
            <div className='login'>
                <div className='login_wrapper'>
                    <h1 className='loginTitle'>考试平台登录</h1>
                    <Row>
                        <Col xs={{ span: 20, offset: 2 }}>
                            <Form
                                onSubmit={this.handleSubmit.bind(this)}
                                className='login-form'
                            >
                                <Form.Item>
                                    {getFieldDecorator('username', {
                                        rules: [
                                            {
                                                required: true,
                                                message:
                                                    '请输入您的用户名!'
                                            }
                                        ],
                                        initialValue: '陈强'
                                    })(
                                        <Input
                                            prefix={
                                                <Icon
                                                    type='user'
                                                    style={{
                                                        color: 'rgba(0,0,0,.25)'
                                                    }}
                                                />
                                            }
                                            placeholder='Username'
                                            className='ipts'
                                        />
                                    )}
                                </Form.Item>
                                <Form.Item>
                                    {getFieldDecorator('password', {
                                        rules: [
                                            {
                                                required: true,
                                                message:
                                                    '请输入您的密码!'
                                            }
                                        ],
                                        initialValue: '123321'
                                    })(
                                        <Input
                                            prefix={
                                                <Icon
                                                    type='lock'
                                                    style={{
                                                        color: 'rgba(0,0,0,.25)'
                                                    }}
                                                />
                                            }
                                            type='password'
                                            placeholder='Password'
                                        />
                                    )}
                                </Form.Item>
                                <Form.Item>
                                    {getFieldDecorator('Verify', {
                                        rules: [
                                            {
                                                required: true,
                                                message:
                                                    '请输入验证码!'
                                            }
                                        ]
                                    })(
                                        <Input
                                            prefix={
                                                <Icon
                                                    type='reddit'
                                                    style={{
                                                        color: 'rgba(0,0,0,.25)'
                                                    }}
                                                />
                                            }
                                            placeholder='Verify'
                                        />
                                    )}
                                    <div className='verify'>
                                        <div
                                            dangerouslySetInnerHTML={{
                                                __html: this.state.Verify
                                            }}
                                            className='verifyImg'
                                        ></div>
                                        <span
                                            onClick={this.verify.bind(this)}
                                            className='verifyWord'
                                        >
                                            看不清,换一张
                                        </span>
                                    </div>
                                </Form.Item>
                                <Form.Item>
                                    <Button
                                        type='primary'
                                        htmlType='submit'
                                        className='login-form-button'
                                        className='loginBtn'
                                    >
                                        登录
                                    </Button>
                                </Form.Item>
                            </Form>
                        </Col>
                    </Row>
                </div>
            </div>
        );
    }
    async componentDidMount() {
        //发送网络请求获取验证码
        let Verify = await api.Verify();
        this.setState({
            Verify: Verify.temp.captcha,
            keyId: Verify.temp.keyId
        });
    }
    //每次点击获取最新的验证码
    async verify() {
        let Verify = await api.Verify();
        this.setState({
            Verify: Verify.temp.captcha,
            keyId: Verify.temp.keyId
        });
    }
    handleSubmit(e) {
        e.preventDefault();
        this.props.form.validateFields((err, values) => {
            if (!err) {
                //console.log(values);
                let { username, password, Verify } = values;
                let secret = 'xxx';
                password = jwt.encode(password, secret);
                //发送登录的网络请求
                //将密码加密发送
                api.Login({
                    username,
                    password,
                    keyId: this.state.keyId,
                    Verify
                }).then(res => {
                    //console.log(res, '登录成功后的返回结果');
                    if (res.code) {
                        //顺带存到本地
                        setCookie({
                            token: res.token,
                            uid: res.uid,
                            type: res.type
                        });

                        //调用仓库方法将这个token存到仓库里面去
                        this.props.dispatch({
                            type: 'authorization/changeToken',
                            token: res.token
                        });
                        //调用仓库的方法将uid存到仓库里面去
                        this.props.dispatch({
                            type: 'authorization/changeUid',
                            uid: res.uid
                        });

                        //调用仓库的方法将type存到仓库中去
                        this.props.dispatch({
                            type: 'authorization/changeType',
                            types: res.type
                        });

                        message.success(res.msg, 1, () => {
                            //console.log('登录成功后的身份', this.props.types);
                            if (this.props.types * 1 === 0) {
                                //console.log('管理员登录');
                                this.props.history.push(
                                    '/main/test/addTest/null'
                                );
                            } else if (this.props.types * 1 === 1) {
                                //console.log('出题者登录');
                                this.props.history.push(
                                    '/main/test/addTest/null'
                                );
                            } else if (this.props.types * 1 === 2) {
                                //console.log('学生登录');
                                this.props.history.push('/main/student/attend');
                            }
                        });
                    } else {
                        message.error(res.msg, 1, async () => {
                            //取消清空
                            this.props.form.setFieldsValue({
                                Verify: ''
                            });
                            let Verify = await api.Verify();
                            this.setState({
                                Verify: Verify.temp.captcha,
                                keyId: Verify.temp.keyId
                            });
                        });
                    }
                });
            }
        });
    }
}

export default Login;
