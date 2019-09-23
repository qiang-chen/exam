
import React from 'react'
import { getExamType, getCourse, createExam } from "@/api"
import {
  Form,
  Select,
  InputNumber,
  Button,
  DatePicker,
  Input
} from 'antd';

import {connect} from "dva"

const { Option } = Select;

class AddUser extends React.Component {
  state = {
    examType: [],
    course: []
  };
  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFields(async (err, values) => {
      if (!err) {
        values.begintime = values.begintime * 1;
        values.endtime = values.endtime * 1;
        values.uid=this.props.uid;
        values.id=new Date().getTime()
        let result=await createExam(values);
        if(result.code){
          //携带者试题id跳到添加题目页面
          this.props.history.push("/main/exam/addExamTest/"+values.id)
        }else{
          alert("添加失败")
        }
        console.log(result)
      }
    });
  };

  normFile = e => {
    console.log('Upload event:', e);
    if (Array.isArray(e)) {
      return e;
    }
    return e && e.fileList;
  };
  async componentDidMount() {
    let data = await getExamType();
    let course = await getCourse();
    this.setState({
      examType: data.msg,
      course: course.msg
    })
  }
  render() {
    const { getFieldDecorator } = this.props.form;
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 },
    };
    return (
      <Form {...formItemLayout} onSubmit={this.handleSubmit}>
        <Form.Item required
          label="试卷名称"
        >
          {getFieldDecorator('name1', {
            rules: [
              { required: true, whitespace: true, message: '请输入名称!' },
            ],
          })(
            <Input placeholder="" id="" />)}
        </Form.Item>

        <Form.Item label="考试类型" hasFeedback>
          {getFieldDecorator('select', {
            rules: [{ required: true, message: '请输入考试类型！' }],
          })(
            <Select placeholder="请输入考试类型！">
              {
                this.state.examType.length && this.state.examType.map((item) => {
                  return <Option value={item.timeId} key={item.timeId}>{item.timeType}</Option>
                })
              }
            </Select>,
          )}
        </Form.Item>

        <Form.Item label="课程">
          {getFieldDecorator('select2', {
            rules: [
              { required: true, message: '请输入课程!' },
            ],
          })(
            <Select placeholder="请输入课程!">
              {
                this.state.course.length && this.state.course.map((item) => {
                  return <Option value={item.classId} key={item.classId}>{item.classType}</Option>
                })
              }
            </Select>
          )}
        </Form.Item>

        <Form.Item label="题量" required>
          {getFieldDecorator('num', { initialValue: 3 })(<InputNumber min={3} max={50} />)}
          <span className="ant-form-text"> 题</span>
        </Form.Item>

        <Form.Item required getFieldDecorator label="考试时间" style={{ marginBottom: 0 }}>
          <Form.Item required
            validateStatus=""
            help="请选择考试开始时间"
            style={{ display: 'inline-block', width: 'calc(50% - 12px)' }}
          >
            {getFieldDecorator('begintime', {
              rules: [
                { required: true, message: '请输入名称!' },
              ],
            })(<DatePicker showTime />)}
          </Form.Item>
          <span style={{ display: 'inline-block', width: '24px', textAlign: 'center' }}>-</span>
          <Form.Item required style={{ display: 'inline-block', width: 'calc(50% - 12px)' }} validateStatus="" help="请选择结束的时间">
            {getFieldDecorator('endtime', {
              rules: [
                { required: true, message: '请输入名称!' },
              ],
            })(<DatePicker showTime />)}

          </Form.Item>
        </Form.Item>

        <Form.Item wrapperCol={{ span: 12, offset: 6 }}>
          <Button type='primary' htmlType='submit'>
            Submit
					</Button>
        </Form.Item>
      </Form>
    );
  }
}

const mapStateToProps=state=>{
  return {
    uid:state.authorization.uid
  }
}

AddUser=connect(mapStateToProps)(AddUser);


const AddUsers = Form.create({ name: 'validate_other' })(AddUser);
export default AddUsers;
