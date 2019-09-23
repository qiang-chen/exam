import React, { Component, Suspense } from 'react';
import RouteView from '@/routes/RouteView';
import { Layout, Menu, Breadcrumb, Icon, message, Upload } from 'antd';
import tabBar from '@/config/tabBar';
import Loading from '@/components/loading.jsx';
import * as api from '@/api/index';
import { connect } from 'dva';
import jwt from 'jwt-simple';

const { SubMenu } = Menu;
const { Header, Sider } = Layout;

function getBase64(img, callback) {
    const reader = new FileReader();
    reader.addEventListener('load', () => callback(reader.result));
    reader.readAsDataURL(img);
}

function beforeUpload(file) {
    const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png';
    if (!isJpgOrPng) {
        message.error('您只能上传 JPG/PNG 格式的文件!');
    }
    const isLt2M = file.size / 1024 / 1024 < 2;
    if (!isLt2M) {
        message.error('图像必须小于2MB!');
    }
    return isJpgOrPng && isLt2M;
}

export default class Main extends Component {
    state = {
        collapsed: false,
        theme: 'dark',
        current: '1',
        title: '添加试题',
        loading: false,
        user: '尊贵的用户',
        jurisdiction: []
    };

    handleChange = info => {
        if (info.file.status === 'uploading') {
            this.setState({ loading: true });
            return;
        }
        if (info.file.status === 'done') {
            // Get this url from response in real world.
            this.setState({
                user: info.file.response.user
            });
            getBase64(info.file.originFileObj, imageUrl =>
                this.setState({
                    imageUrl,
                    loading: false
                })
            );
        }
    };
    render() {
        const uploadButton = (
            <div>
                <Icon type={this.state.loading ? 'loading' : 'plus'} />
            </div>
        );
        const { imageUrl } = this.state;
        return (
            <div className='wrap'>
                <Layout className='main'>
                    <Header className='header headerNav'>
                        <div className='logoLeft'>
                            <img
                                src='https://www.tsinghua.edu.cn/publish/thu2018/images/logo_1.svg'
                                alt='八维网'
                            />
                        </div>
                        <div className='logoRight'>
                            <div className='upload'>
                                <Upload
                                    name='avatar'
                                    listType='picture-card'
                                    className='avatar-uploader'
                                    showUploadList={false}
                                    action='/upload'
                                    beforeUpload={beforeUpload}
                                    onChange={this.handleChange}
                                    data={{
                                        token: this.props.token
                                    }}
                                >
                                    {imageUrl ? (
                                        <img
                                            src={imageUrl}
                                            alt='avatar'
                                            style={{ width: '100%' }}
                                        />
                                    ) : (
                                        uploadButton
                                    )}
                                </Upload>
                            </div>
                            <div className='personage'>{this.state.user}</div>
                        </div>
                    </Header>
                    <Layout>
                        <Sider width={200} className='silderNav'>
                            <Menu
                                theme='dark'
                                mode='inline'
                                defaultSelectedKeys={['1']}
                            >
                                {tabBar.map(item => {
                                    if (
                                        this.state.jurisdiction.includes(
                                            item.name
                                        )
                                    ) {
                                        return item.children &&
                                            item.children.length ? (
                                            <SubMenu
                                                key={item.id}
                                                title={
                                                    <span>
                                                        <Icon
                                                            type={item.icon}
                                                        />
                                                        {/* 一级展示 */}
                                                        <span>{item.name}</span>
                                                    </span>
                                                }
                                            >
                                                {item.children.map(el => {
                                                    return (
                                                        <Menu.Item
                                                            key={el.id}
                                                            onClick={() => {
                                                                this.props.history.push(
                                                                    el.path
                                                                );
                                                                this.setState({
                                                                    title:
                                                                        el.name
                                                                });
                                                            }}
                                                        >
                                                            <span>
                                                                <Icon
                                                                    type={
                                                                        el.icon
                                                                    }
                                                                />
                                                                {/* 二级展示 */}
                                                                <span>
                                                                    {el.name}
                                                                </span>
                                                            </span>
                                                        </Menu.Item>
                                                    );
                                                })}
                                            </SubMenu>
                                        ) : (
                                            <Menu.Item
                                                key={item.key}
                                                onClick={() => {
                                                    this.props.history.push(
                                                        item.path
                                                    );
                                                }}
                                            >
                                                <span>
                                                    <Icon type={item.icon} />
                                                    {/* 二级展示 */}
                                                    <span>{item.name}</span>
                                                </span>
                                            </Menu.Item>
                                        );
                                    }
                                })}
                            </Menu>
                        </Sider>
                        <Layout style={{ padding: '0 24px 24px' }}>
                            <Breadcrumb style={{ margin: '16px 0' }}>
                                <Breadcrumb.Item>
                                    {this.state.title}
                                </Breadcrumb.Item>
                            </Breadcrumb>
                            <Suspense fallback={<Loading />}>
                                <div className='box'>
                                    <RouteView children={this.props.children} />
                                </div>
                            </Suspense>
                        </Layout>
                    </Layout>
                </Layout>
            </div>
        );
    }
    async componentDidMount() {
        //根据用户uid获取用户的头像
        let img = await api.getImg(this.props.uid);
        console.log(img);
        let secret = 'uuu';
        let user = jwt.decode(this.props.token, secret);
        //发送请求 获取页面视图权限问题
        let data = await api.authorization(this.props.uid);
        this.setState({
            jurisdiction: data.msg.view_authority.split(','),
            user
        });
    }
}

const mapStateToProps = state => {
    return {
        uid: state.authorization.uid,
        token: state.authorization.token
    };
};

Main = connect(mapStateToProps)(Main);
// Main = jurisdiction()(Main);
