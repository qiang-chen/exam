import React, { Component } from 'react'
import "@/common/css/classCss/class.css"
import { getZuiHouQuestions, getTest, saveStudentAnswer } from '@/api/index'
import { connect } from 'dva';

export default class componentName extends Component {
    state = {
        data: [],
        valArr: [],
    }
    componentDidMount() {
        console.log(this.props, "//////////////")
        let id = this.props.match.params.id
        getZuiHouQuestions(id).then(res => {
            getTest().then(ress => {
                let str = []
                JSON.parse(res.result[0].question).map(item => {
                    str.push(...ress.result.filter(it => it.tid == item))
                })
                this.setState({
                    data: str
                })
            })
        })
    }
    sub() {
        console.log(this.state.valArr)
        let arr = this.state.valArr
        let obj = {}
        for (var i = 0; i < arr.length; i++) {
            obj[`val${i}`] = arr[i];
        }
        console.log(JSON.stringify(obj))
        let str = {
            obj,
            id: this.props.match.params.id,
            s_id: this.props.uid
        }
        console.log(str, "**************")
        saveStudentAnswer(str).then(res => {
            console.log(res)
        })
    }

    render() {
        return (
            <div className="cls">
                {
                    this.state.data.map((item, index) => {
                        return <div>
                            <p>问题：{item.content}</p>
                            <p>回答：<input type="text" value={this.state[`val${index}`]} onChange={(e) => {
                                let valInd = `val${index}`
                                console.log(e.target.value)
                                this.state.valArr[index] = e.target.value;
                                this.setState({
                                    valInd: e.target.value
                                })

                            }} /></p>
                        </div>
                    })
                }
                <button onClick={() => this.sub()}>提交</button>
            </div>
        )
    }
}

const mapStateToProps = state => {
    return {
        uid: state.authorization.uid
    };
};

componentName = connect(mapStateToProps)(componentName);
