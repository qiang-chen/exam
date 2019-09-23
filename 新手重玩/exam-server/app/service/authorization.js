const {
    Service
} = require("egg");

class Authorization extends Service {
    async getauthorization(uid) {
        uid = uid * 1;
        const $sql = `select view_authority from view_authority,user where user.uid=${uid} and user.type=view_authority.view_authority_id`;
        let result = await this.app.mysql.query($sql);
        return result
    }
}

module.exports = Authorization