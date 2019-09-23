const { Service } = require("egg")
class ClassService extends Service {
    async banClass() {
        const $sql = 'select grade_name,`classType`,room_text from grade,classtype,room where room.room_id=grade.room_id and grade.classId=classtype.classId'
        const result = await this.app.mysql.query($sql)
        return result
    }
    async grade() {
        const $sql = 'select * from grade'
        const result = await this.app.mysql.query($sql)
        return result
    }
    async getSubject() {
        const $sql = 'select * from classtype'
        const result = await this.app.mysql.query($sql)
        return result
    }
    async addBanClass(ban, room, subject) {
        const rom = await this.app.mysql.query(`select * from room where room_text='${room}'`)
        const sub = await this.app.mysql.query(`select * from classtype where classType='${subject}'`)
        const $sql = 'insert into grade (grade_id,grade_name, room_id, classId) values (?,?,?,?)'
        const result = await this.app.mysql.query($sql, [+new Date(), ban, rom[0].room_id, sub[0].classId])
        return result
    }
    async getRoom() {
        const $sql = 'select * from room'
        const result = await this.app.mysql.query($sql)
        return result
    }
    async addRoom(room) {
        const $sql = 'insert into room (room_text,room_id) values (?,?)'
        const result = await this.app.mysql.query($sql, [room, +new Date()])
        return result
    }
    async getStudent() {
        const $sql = 'select student_name,student_id,grade_name,room_text,student_pwd from student,grade,room where grade.grade_id=student.grade_id and grade.room_id=room.room_id';
        const result = await this.app.mysql.query($sql)
        return result
    }
    async searchStudent(name, room, grade) {
        console.log(name, room, grade, "这儿是什么555")
        if (!name) {
            name = "";
        }
        if (!room) {
            room = "";
        }
        if (!grade) {
            grade = "";
        }
        let $sql1;
        switch (true) {
            case name.length != 0 && room.length != 0 && grade.length != 0:
                console.log("三个什么")
                $sql1 = `select * from student,grade,room where student_name like '%${name}%' and room.room_text='${room}' and grade.grade_name='${grade}' and student.grade_id=grade.grade_id and grade.room_id=room.room_id`;
                break;
            case name.length != 0 && room.length != 0:
                $sql1 = `select * from student,grade,room where student_name like '%${name}%' and room.room_text='${room}' and room.room_id=grade.room_id and student.grade_id=grade.grade_id`;
                break;
            case name.length != 0 && grade.length != 0:
                console.log(grade, "这是什么鬼顶顶顶顶")
                $sql1 = `select * from student,grade,room where student_name like '%${name}%' and grade.grade_name='${grade}' and grade.room_id=room.room_id and student.grade_id=grade.grade_id`;
                break;
            case room.length != 0 && grade.length != 0:
                $sql1 = `select * from student,grade,room where grade.grade_name='${grade}' and room.room_text='${room}' and grade.room_id=room.room_id and grade.grade_id=student.grade_id`;
                break;
            case room.length != 0:
                $sql1 = `select * from student,grade,room where room.room_text='${room}' and room.room_id=grade.room_id and  grade.grade_id=student.grade_id`;
                break;
            case name.length != 0:
                console.log("进来这里是不是")
                $sql1 = `select * from student,grade,room where student_name like '%${name}%' and student.grade_id=grade.grade_id and grade.room_id=room.room_id`;
                break;
            case grade.length != 0:
                $sql1 = `select * from student,grade,room where grade.grade_name='${grade}' and grade.grade_id=student.grade_id and grade.room_id=room.room_id`;
                break;
            default:
                console.log("默认状态")
                break;
        }

        const ngId = await this.app.mysql.query($sql1);


        return ngId;












        // let $sql = `SELECT * FROM student,grade,room WHERE ${grade!=undefined?'grade.grade_name='+grade+' AND ':''}${room!=undefined?'room.room_text='+room+' AND ':''}student.student_name LIKE '%${name?name:''}%'`
        // console.log($sql)
        // const result = await this.app.mysql.query($sql)
        // return result


        // const $sql = `select student_name,student_id,grade_name,room_text,student_pwd from student,grade,room where student_name=? and grade.grade_name=? and room.room_text=?`
        // const result = await this.app.mysql.query($sql, [name, grade, room])
        // return result
    }
    async delGrade(name) {
        const $sql = 'delete from grade where grade_name=?'
        const result = await this.app.mysql.query($sql, [name])
        return result
    }
    async delRoom(id) {
        const $sql = 'delete from room where room_id=?'
        const result = await this.app.mysql.query($sql, [id])
        return result
    }
    async delStudent(id) {
        const $sql = 'delete from student where student_id=?'
        const result = await this.app.mysql.query($sql, [id])
        return result
    }
    async updateGrade(ban, room, subject) {
        console.log(ban, room, subject)
        const rom = await this.app.mysql.query(`select * from room where room_text='${room}'`)
        const sub = await this.app.mysql.query(`select * from classtype where classType='${subject}'`)
        console.log(rom[0].room_id, sub[0].classId, ban, "最后了**************************")
        const $sql = 'update grade set room_id=?, classId=? where grade_name=?'
        const result = await this.app.mysql.query($sql, [rom[0].room_id, sub[0].classId, ban])
        return result
    }
}
module.exports = ClassService