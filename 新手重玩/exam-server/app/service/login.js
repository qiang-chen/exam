    const {
        Service
    } = require("egg");

    class User extends Service {
        //查找函数
        async find(username) {
            const results = await this.app.mysql.get('user', {
                username
            });
            return results;
        }
        async upload(username, portrait) {
            const row = {
                portrait,
            };
            const options = {
                where: {
                    username
                }
            };
            const result = await this.app.mysql.update('user', row, options);
            return result;
        }
        async getImg(uid) {
            //根据uid去找对应的头像去
            const $sql = `select portrait from user where uid=${uid}`;
            const result = await this.app.mysql.query($sql);
            return result;
        }
    }

    module.exports = User;