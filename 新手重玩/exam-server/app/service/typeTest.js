const {Service} =require("egg");

class TypeTest extends Service{
    //查找题目分类
    async getTitleType(){
        //查找
        const results = await this.app.mysql.select('testTitleType');
        return results;
    }
}

module.exports=TypeTest