(window["webpackJsonpexam-back"]=window["webpackJsonpexam-back"]||[]).push([[16],{745:function(e,t,a){},834:function(e,t,a){"use strict";a.r(t);var n,c=a(46),r=a(47),l=a(49),i=a(48),o=a(50),s=(a(347),a(68)),m=(a(742),a(741)),u=a(1),d=a.n(u),p=(a(745),a(96)),x=m.a.Column,y=s.a.create({name:"attend"})(n=function(e){function t(){var e,a;Object(c.a)(this,t);for(var n=arguments.length,r=new Array(n),o=0;o<n;o++)r[o]=arguments[o];return(a=Object(l.a)(this,(e=Object(i.a)(t)).call.apply(e,[this].concat(r)))).state={data:[]},a}return Object(o.a)(t,e),Object(r.a)(t,[{key:"componentDidMount",value:function(){var e=this;Object(p.L)().then(function(t){console.log(t),e.setState({data:t.result.map(function(t,a){return t.key=a+1,t.start_exam=e.getLocalTime(t.start_exam),t.end_exam=e.getLocalTime(t.end_exam),t})})})}},{key:"getLocalTime",value:function(e){return new Date(parseInt(e)).toLocaleString().replace(/:\d{1,2}$/," ")}},{key:"alter",value:function(e){console.log(e),this.props.history.push("/main/student/detailStudent/"+e.exam_id,{query:e})}},{key:"render",value:function(){var e=this,t=this.state.data;return d.a.createElement("div",{className:"cls"},d.a.createElement("div",{className:"btn"},d.a.createElement(m.a,{dataSource:t},d.a.createElement(x,{title:"\u8003\u8bd5\u540d\u79f0",dataIndex:"exam_name",key:"exam_name"}),d.a.createElement(x,{title:"\u8bfe\u7a0b\u79d1\u76ee",dataIndex:"classType",key:"classType"}),d.a.createElement(x,{title:"\u5f00\u59cb\u65f6\u95f4",dataIndex:"start_exam",key:"start_exam"}),d.a.createElement(x,{title:"\u622a\u6b62\u65f6\u95f4",dataIndex:"end_exam",key:"end_exam"}),d.a.createElement(x,{title:"\u64cd\u4f5c",render:function(t,a){return d.a.createElement("span",null,d.a.createElement("a",{onClick:e.alter.bind(e,a)},"\u53c2\u52a0\u8003\u8bd5"))}}))))}}]),t}(u.Component))||n;t.default=y}}]);
//# sourceMappingURL=16.e623505b.chunk.js.map