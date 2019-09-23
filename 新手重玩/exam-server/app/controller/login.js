const {
    Controller
} = require("egg");
//另一款加密工具
const jwt = require("jwt-simple");
//生成随机验证码图片使用的插件包
const svgCaptcha = require('svg-captcha');
const client = require("../utils/redis.js");
//引入保存图片的函数
const {
    saveImg
} = require("../utils/saveImg");

//验证验证码
function LoginVerify(Verify, keyId) {
    return new Promise((resolve, reject) => {
        client.get(keyId, (err, succ) => {
            if (!succ) {
                reject()
            } else {
                //检验证码
                console.log(Verify.toUpperCase(), succ.toUpperCase())
                if (Verify.toUpperCase() === succ.toUpperCase()) {
                    resolve("成功")
                } else {
                    reject()
                }
            }
        })
    })
}



class User extends Controller {
    //登录接口
    async login(ctx) {
        //首先去数据库查询该用户是否存在
        let code = 1,
            msg = "";
        let token = "";
        let uid = "";
        let type = "";
        let {
            username,
            password,
            keyId,
            Verify
        } = ctx.request.body;
        try {
            //根据用户名去数据库查询
            let result = await ctx.service.login.find(username);
            if (result) {
                //证明数据库有这个用户
                //对传过来的密码进行解密与数据库的密码进行解密然后比较是不是相等
                let secret = "xxx";
                let pwd = jwt.decode(password, secret);
                //console.log(result,"前端密码解密");
                let mysqlPwd = jwt.decode(result.password, secret);
                //console.log(mysqlPwd,"数据库密码解密");
                if (pwd === mysqlPwd) {
                    //console.log("这里进来了吗");
                    //生成一个token返给前端
                    let secret = "uuu";
                    //console.log(username,"登录的用户");
                    token = jwt.encode(username, secret);
                    uid = result.uid;
                    type = result.type;
                    msg = "登陆成功"
                } else {
                    code = 0;
                    msg = "用户名和密码不匹配"
                }
            } else {
                code = 0;
                msg = "该用户还未注册"
            }
        } catch (error) {
            console.log(error)
            code = 0;
            msg = "服务器错误，请稍后重试"
        }

        //这个函数是异步

        try {
            let data = await LoginVerify(Verify, keyId);
            console.log(data, "这个结果是什么");
        } catch (error) {
            code = 0;
            msg = "验证码不正确";
        }
        ctx.body = {
            code,
            msg,
            uid,
            token,
            type
        }
    }
    //获取图形验证码功能的函数
    async verify(ctx) {
        var captcha = svgCaptcha.create({});
        //此时text生成的就是随机的四位数验证码 真正的验证码
        let text = captcha.text;
        let keyId = new Date().getTime();
        let temp = {
            keyId: keyId,
            captcha: captcha.data,
        }
        client.set(keyId, text, 'EX', 60);
        ctx.body = {
            code: 1,
            temp
        }
    }
    //上传头像接口
    async upload(ctx) {
        //上传接口处理
        let user;
        let code = 1,
            msg = "上传成功";
        let {
            token
        } = ctx.request.body;
        let {
            filename,
            filepath
        } = ctx.request.files[0];
        let fileName = new Date().getTime() + "_" + filename;
        try {
            let data = await saveImg(fileName, filepath);
            //操作数据库保存头像地址
            let filePath = "/public/" + fileName;
            let secret = "uuu";
            user = jwt.decode(token, secret);
            let result = await ctx.service.login.upload(user, filePath);
            console.log(result, "返回值有了吗");
        } catch (error) {
            console.log(error, "是不是报错了");
            code = 0;
            msg = "上传失败"
        }
        ctx.body = {
            code,
            msg,
            user
        }
    }
    //获取用户头像
    async getImg(ctx) {
        let code = 1,
            msg = "";
        try {
            let resut = await ctx.service.login.getImg(ctx.request.query.uid * 1);
            msg = resut;
        } catch (error) {
            code = 0;
            msg = "获取失败"
        }
        ctx.body = {
            code,
            msg
        }
    }
}

module.exports = User;;