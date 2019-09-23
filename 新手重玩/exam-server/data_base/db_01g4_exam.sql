/*
Navicat MySQL Data Transfer

Source Server         : lishengzhi
Source Server Version : 50520
Source Host           : 169.254.19.8:3306
Source Database       : db_01g4_exam

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-09-03 11:03:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api_authority
-- ----------------------------
DROP TABLE IF EXISTS `api_authority`;
CREATE TABLE `api_authority` (
  `api_authority_id` varchar(255) NOT NULL DEFAULT '',
  `api_authority_text` varchar(255) DEFAULT NULL,
  `api_authority_url` varchar(255) DEFAULT NULL,
  `api_authority_method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`api_authority_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_authority
-- ----------------------------
INSERT INTO `api_authority` VALUES ('i69wzm-bkqldr', '获取所有的考试类型', '/exam/examType', 'GET');
INSERT INTO `api_authority` VALUES ('duf7ds-zwvace', '获取所有的课程', '/exam/subject', 'GET');
INSERT INTO `api_authority` VALUES ('yda3h-y6nekr', '删除指定的试题类型', '/exam/delQuestionsType', 'POST');
INSERT INTO `api_authority` VALUES ('ybay6c-kqm7w', '添加试题类型', '/exam/insertQuestionsType', 'GET');
INSERT INTO `api_authority` VALUES ('rzerajv-0d95uo', '获取所有的试题类型', '/exam/getQuestionsType', 'GET');
INSERT INTO `api_authority` VALUES ('32uyuk-lg0kel', '添加试题接口', '/exam/questions', 'POST');
INSERT INTO `api_authority` VALUES ('ekp5yh-5xyxoh', '获取所有试题', '/exam/questions/new', 'GET');
INSERT INTO `api_authority` VALUES ('kpp9kr-nywgm', '展示用户数据', '/user/user', 'GET');
INSERT INTO `api_authority` VALUES ('1nm0c-hj4i9i', '展示api接口权限数据', '/user/api_authority', 'GET');
INSERT INTO `api_authority` VALUES ('9mi37w-edgwper', '展示身份数据', '/user/identity', 'GET');
INSERT INTO `api_authority` VALUES ('wctk6-eb17u', '展示身份和api权限关系', '/user/identity_api_authority_relation', 'GET');
INSERT INTO `api_authority` VALUES ('axk8no-pi8un', '添加用户', '/user', 'POST');
INSERT INTO `api_authority` VALUES ('fcmvyt-0l7e1s', '添加视图权限', '/user/authorityView/edit', 'GET');
INSERT INTO `api_authority` VALUES ('iowcpb-0rmeze', '添加身份', '/user/identity/edit', 'GET');
INSERT INTO `api_authority` VALUES ('rnlldc-cbymie', '添加api接口权限', '/user/authorityApi/edit', 'GET');
INSERT INTO `api_authority` VALUES ('prvn7n-p6khft', '给身份设定api接口权限', '/user/setIdentityApi', 'POST');
INSERT INTO `api_authority` VALUES ('y707cc-kiahhg', '更新用户信息(用户名，用户密码，用户身份)', '/user/user', 'PUT');
INSERT INTO `api_authority` VALUES ('fvmtcb-g339h', '登录接口', '/user/login', 'POST');
INSERT INTO `api_authority` VALUES ('2irygl-h8we2', '获取当前用户信息', '/user/userInfo', 'GET');
INSERT INTO `api_authority` VALUES ('db1edd-ywjnus', '获取视图权限数据', '/user/view_authority', 'GET');
INSERT INTO `api_authority` VALUES ('vkngbd-gnjkq', '给身份设定视图权限', '/user/setIdentityView', 'POST');
INSERT INTO `api_authority` VALUES ('md2k6-5phy2a', '展示身份和视图权限关系', '/user/identity_view_authority_relation', 'GET');
INSERT INTO `api_authority` VALUES ('oczc1v-uf0m0d', '根据用户id，返回该用户的视图权限', '/user/new', 'GET');
INSERT INTO `api_authority` VALUES ('2z41v-6b16qq', '按条件获取用户数据', '/exam/questions/condition', 'GET');
INSERT INTO `api_authority` VALUES ('61ocu2-kko0gq', '更新试题', '/exam/questions/update', 'PUT');
INSERT INTO `api_authority` VALUES ('vyojc-ivkvmj', '添加学生', '/manger/student', 'POST');
INSERT INTO `api_authority` VALUES ('i36cqa-kymf6k', '查看所有学生', '/manger/student', 'GET');
INSERT INTO `api_authority` VALUES ('xymq2-61tk5o', '查看所有教室', '/manger/room', 'GET');
INSERT INTO `api_authority` VALUES ('q3shir-90gdgg', '添加教室', '/manger/room', 'POST');
INSERT INTO `api_authority` VALUES ('trvocc-8k1aqs', '查看所有班级', '/manger/grade', 'GET');
INSERT INTO `api_authority` VALUES ('9shqic-k0df6', '添加班级', '/manger/grade', 'POST');
INSERT INTO `api_authority` VALUES ('ys4ntc-zp4r5w', '更新班级', '/manger/grade/update', 'PUT');
INSERT INTO `api_authority` VALUES ('9rwj7v-6q4ro', '更新教室', '/manger/room/update', 'PUT');
INSERT INTO `api_authority` VALUES ('6prwc8-xy3fhk', '获取学生试卷列表', '/exam/student', 'GET');

-- ----------------------------
-- Table structure for exam_exam
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam`;
CREATE TABLE `exam_exam` (
  `exam_exam_id` varchar(32) NOT NULL,
  `subject_id` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `question_ids` varchar(255) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `status` int(11) DEFAULT '-1' COMMENT '-1表示未确认，0表示未开始，1表示正在进行，2表示已完成',
  `description` varchar(100) DEFAULT NULL COMMENT '试卷描述',
  `exam_type` varchar(32) NOT NULL COMMENT '考试类型',
  `number` int(11) NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  PRIMARY KEY (`exam_exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_exam
-- ----------------------------
INSERT INTO `exam_exam` VALUES ('0mzder-hzji7', '8tl7os-r49tld', '飒飒', '[]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '4', '1553242022039', '1553328425163');
INSERT INTO `exam_exam` VALUES ('aiinnj-y6ufu', 'fqtktr-1lq5u', '测试2222222', '[\"4vu7t9-t9vv08-chvz3r-n8i3nq\",\"ma0uj-yctlrp-xjf87d-p2xrg\",\"4t0rar-39c33-wq098t-phh5ht\"]', 'axg8t2-oroeja', '0', null, '8sc5d7-7p5f9e-cb2zii-ahe5i', '3', '1553175718157', '1553175721341');
INSERT INTO `exam_exam` VALUES ('butzai-n599dh', '1psw2b-cy7o07', '组件化开发第二周摸底考试', '[\"fl7dll-xh6eo-hpri8a-edulg\",\"3zayso-dq7kt-86q4ye-9ydupa\",\"sue8v-wa50ws-jss7qm-592yt8\",\"9wck8-qt73nd-0v6s8-f6jyid\"]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '4', '1552701600000', '1552707000000');
INSERT INTO `exam_exam` VALUES ('e9gl9p-6wsmgl', 'wl5yk-38c0g', 'JS下开发第二周摸底考试', '[\"y6cbma-9qjye-rdx5kw-oundyo\",\"40lhum-rtymrz-r8x2h-6c9od\",\"d5osduj-krhc1-akr9l2-9tz2nz\",\"in5k9-nqedo7-cjpek-30cmi\"]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '4', '1552701600000', '1552707000000');
INSERT INTO `exam_exam` VALUES ('jow62g-l4xmin', '1psw2b-cy7o07', 'sa', '[\"6ivrh-g7kp8a-2gixkg-p117t\",\"uecyx-3qim4-rwk9o-v43sj8\",\"5oxqyl-8dnbaa-3dt3o9-qrecrk\"]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '3', '1553062560125', '1553062563478');
INSERT INTO `exam_exam` VALUES ('mot5o-sfg9l', 'wl5yk-38c0g', '3.22号的一次考试', '[\"x0gf6-ogyaaf-t88yrd-mnhxlr\",\"in5k9-nqedo7-cjpek-30cmi\",\"y6cbma-9qjye-rdx5kw-oundyo\",\"0r33sp-v8csso-y34tc3-ddsoj\"]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '4', '1553233173476', '1553240338000');
INSERT INTO `exam_exam` VALUES ('oyvic-jg3t1l', '4pu32-vs796l', 'Nodejs开发第二周摸底考试', '[\"h7f6hq-cezl0g-fyu3o-6onwjf\",\"zyocwi-drka9-kx8vv-blrmw9p\",\"bqq54a-jly2z9-m9fg7pj-oio193\",\"izvfy-572mw-thxrmm-7aba5s\"]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '4', '1552701600000', '1552707000000');
INSERT INTO `exam_exam` VALUES ('wspgmb-iztg8v', '1psw2b-cy7o07', 'React', '42cuvb-7216fb-zlkab2-wwns3d,c7y73-e0nft-6rplem-daxvxe,05snch-6eq8dn-szfd6q-t34nld', 'axg8t2-oroeja', '-1', null, '8sc5d7-7p5f9e-cb2zii-ahe5i', '3', '1553062527502', '1553062528582');
INSERT INTO `exam_exam` VALUES ('y3x4e3-uzj9k', 'fyu3ln-azjkie', '渐进式开发第二周摸底考试', '[\"cbssqf-16avt7-qwk8k-ufilrc\",\"xt05yo-prna5g-f7zqo-ltl5rh\",\"gt8z4u-ufd66j-najaef-y8ytir\",\"00a1t8-ezqkxg-xv9pkk-6hqfyb\"]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '4', '1553082795320', '1553089966000');
INSERT INTO `exam_exam` VALUES ('ycv39-mfh85', 'fyu3ln-azjkie', '渐进式开发第二周摸底考试', '[\"00a1t8-ezqkxg-xv9pkk-6hqfyb\",\"xt05yo-prna5g-f7zqo-ltl5rh\",\"gt8z4u-ufd66j-najaef-y8ytir\"]', 'axg8t2-oroeja', '0', null, 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', '3', '1552701600000', '1552707000000');

-- ----------------------------
-- Table structure for exam_student
-- ----------------------------
DROP TABLE IF EXISTS `exam_student`;
CREATE TABLE `exam_student` (
  `exam_student_id` varchar(32) NOT NULL,
  `exam_exam_id` varchar(32) NOT NULL,
  `answer_json_path` varchar(255) NOT NULL,
  `student_id` varchar(32) NOT NULL,
  `grade_id` varchar(32) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `start_time` varchar(16) NOT NULL,
  `end_time` varchar(16) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0表示未阅，1表示已阅',
  PRIMARY KEY (`exam_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_student
-- ----------------------------
INSERT INTO `exam_student` VALUES ('00cq3-exun9m5-eflgft-7gu9g6r', 'e9gl9p-6wsmgl', '00cq3-exun9m5-eflgft-7gu9g6r.json', '18382100352', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('0361tl-buy4xh-nfz64e-etebt3', 'e9gl9p-6wsmgl', '0361tl-buy4xh-nfz64e-etebt3.json', '18382100525', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('0h5y2-3v7gid-zzh72a-rnx2u', 'e9gl9p-6wsmgl', '0h5y2-3v7gid-zzh72a-rnx2u.json', '18382100471', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('0i4o82-rwrqm-qr4f9-2gp5zw', 'butzai-n599dh', '0i4o82-rwrqm-qr4f9-2gp5zw.json', '18382100324', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('147mmw-n1b4thj-ky0s03-givsn9', 'e9gl9p-6wsmgl', '147mmw-n1b4thj-ky0s03-givsn9.json', '18382100371', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('19adea-afcpp7-5ahwx-fnsx29', 'butzai-n599dh', '19adea-afcpp7-5ahwx-fnsx29.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('1xnqt-va0x1-m6lzf-2ylqeg', 'e9gl9p-6wsmgl', '1xnqt-va0x1-m6lzf-2ylqeg.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('2gzalq-9kdwmo-jt6x8q-fay0gtm', 'e9gl9p-6wsmgl', '2gzalq-9kdwmo-jt6x8q-fay0gtm.json', '162711000940', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('2h0jcj-7m7c2u-djgtq-e2cozh', 'e9gl9p-6wsmgl', '2h0jcj-7m7c2u-djgtq-e2cozh.json', '17382100396', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('2r6shq-yvukp8-qfp8e9-xisv5n', 'e9gl9p-6wsmgl', '2r6shq-yvukp8-qfp8e9-xisv5n.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('2s548e-94qzkv-onsxga-iffqas', 'e9gl9p-6wsmgl', '2s548e-94qzkv-onsxga-iffqas.json', '163231001219', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('2wexxh-b7bzx7-21k229-ez2u9n', 'ycv39-mfh85', '2wexxh-b7bzx7-21k229-ez2u9n.json', '18382100163', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('2whygh-6yczx-bg296b-828ilc', 'ycv39-mfh85', '2whygh-6yczx-bg296b-828ilc.json', '152001000514', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('2ywso7-bl3786-udxodo-nd40p', 'ycv39-mfh85', '2ywso7-bl3786-udxodo-nd40p.json', '141361000845', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('32ts8v-lwf8l-1mzuun-fuu07q', 'e9gl9p-6wsmgl', '32ts8v-lwf8l-1mzuun-fuu07q.json', '163231000122', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('3j78r-tozuem-wjtsjfz-4pnbd', 'e9gl9p-6wsmgl', '3j78r-tozuem-wjtsjfz-4pnbd.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('43ievi-ffwr6c-t4lnp-8mciy', 'ycv39-mfh85', '43ievi-ffwr6c-t4lnp-8mciy.json', '152221000137', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('48p971-qtm6cj-mnqsu8-v3epv', 'e9gl9p-6wsmgl', '48p971-qtm6cj-mnqsu8-v3epv.json', '18382100387', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('4ayw4l-c34ty-s2zaz-jv9ltm', 'ycv39-mfh85', '4ayw4l-c34ty-s2zaz-jv9ltm.json', '162221000332', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('4edl4i-k0rr7a-b3yna-f87a9w', 'y3x4e3-uzj9k', '4edl4i-k0rr7a-b3yna-f87a9w.json', '151611000702', 'joyqt9-gyxsa8-fif6c-j12o0k', '0', '1553082795320', '1553089966000', '0');
INSERT INTO `exam_student` VALUES ('4i31uu-jjesg8-wear1d-t378dv', 'e9gl9p-6wsmgl', '4i31uu-jjesg8-wear1d-t378dv.json', '162711000971', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('4lfzb-tjz9s-7juldu-ggzt17', 'e9gl9p-6wsmgl', '4lfzb-tjz9s-7juldu-ggzt17.json', '18382100162', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('4zb1ci-i8va4f-ll2vbo-l8fc38', 'butzai-n599dh', '4zb1ci-i8va4f-ll2vbo-l8fc38.json', '18382100249', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('4zhstc-mnilyq-i2lg3n-62h3e6', 'butzai-n599dh', '4zhstc-mnilyq-i2lg3n-62h3e6.json', '17382100387', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('53x4ka-3ta1wb-fx9k06-3dpxj', 'ycv39-mfh85', '53x4ka-3ta1wb-fx9k06-3dpxj.json', '18382100157', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('5nkubn-4uqypb-l0qb8o-jpm27r', 'e9gl9p-6wsmgl', '5nkubn-4uqypb-l0qb8o-jpm27r.json', '18382100371', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('5r1mkh-20cv6-ni5bo-gm68sm', 'e9gl9p-6wsmgl', '5r1mkh-20cv6-ni5bo-gm68sm.json', '18382100411', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('5ztkis-ic3whh-kjjssl-iuk5u', 'w5tcy-g2dts', '5ztkis-ic3whh-kjjssl-iuk5u.json', '456789', 'tjpjhb-eofdk-dizf1q-5q8rcd', '0', '1551863357534', '1551863357534', '0');
INSERT INTO `exam_student` VALUES ('620lom-xwjk1m-3zfmsti-q9avre', 'e9gl9p-6wsmgl', '620lom-xwjk1m-3zfmsti-q9avre.json', '163231000887', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('6tvjsml-x588qb-3rcef-bz5ge', 'e9gl9p-6wsmgl', '6tvjsml-x588qb-3rcef-bz5ge.json', '162711000869', 'rs7mlk-5wcsf7-w55rr9-s23ltds', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('6wvmk-xsvvlb-lgjx16-ovso8', 'e9gl9p-6wsmgl', '6wvmk-xsvvlb-lgjx16-ovso8.json', '18382100463', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('74fsdg-3mzogt-tvjow-aso3yd', 'e9gl9p-6wsmgl', '74fsdg-3mzogt-tvjow-aso3yd.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('7b0cv-bb4y9-omhtx4-96igwq', 'ycv39-mfh85', '7b0cv-bb4y9-omhtx4-96igwq.json', '17382100197', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('7dbhrk-zl6uuf-sjvo1m-wknwf2', 'butzai-n599dh', '7dbhrk-zl6uuf-sjvo1m-wknwf2.json', '163231001295', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('7fzfk4-rtd5uj-se1kxd-opublh', 'e9gl9p-6wsmgl', '7fzfk4-rtd5uj-se1kxd-opublh.json', '152121000564', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('7m3c2n-utg4gb-t2cpd9-0py1wb', 'ycv39-mfh85', '7m3c2n-utg4gb-t2cpd9-0py1wb.json', '17382100377', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('7mg7ll-p5mxsq-6b8beg-35xdyyi', 'e9gl9p-6wsmgl', '7mg7ll-p5mxsq-6b8beg-35xdyyi.json', '151661000756', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('7r2jz-cqzuuc-bs7cs-rzegnr', 'ycv39-mfh85', '7r2jz-cqzuuc-bs7cs-rzegnr.json', '152001000514', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('85juiw-cwdtfc-9kmoug-0n43co', 'ycv39-mfh85', '85juiw-cwdtfc-9kmoug-0n43co.json', '162231001406', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('8s2qlb-sj4qo3-ts17i-945ac', 'ycv39-mfh85', '8s2qlb-sj4qo3-ts17i-945ac.json', '163231000336', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('924qsx-f1poms-8yuzpg-m9qf44', 'butzai-n599dh', '924qsx-f1poms-8yuzpg-m9qf44.json', '18382100327', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('9hxu2w-0pj3mm-a7jrwp-pjo3h', 'e9gl9p-6wsmgl', '9hxu2w-0pj3mm-a7jrwp-pjo3h.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('9mr9kg-1iwoyt-1582t7-yjle5r', 'e9gl9p-6wsmgl', '9mr9kg-1iwoyt-1582t7-yjle5r.json', '17382100219', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('9nhvw-siznga-mmd7ic-1n3dw5', 'e9gl9p-6wsmgl', '9nhvw-siznga-mmd7ic-1n3dw5.json', '162711000869', 'rs7mlk-5wcsf7-w55rr9-s23ltds', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('9ojktn-9exm3-tmswd4-l44nba', 'e9gl9p-6wsmgl', '9ojktn-9exm3-tmswd4-l44nba.json', '18382100372', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('9qy536-dx77ec-y0zij-ets52', 'e9gl9p-6wsmgl', '9qy536-dx77ec-y0zij-ets52.json', '163231000413', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('9vpd48-r45vc-uuilu-zw181j', 'ycv39-mfh85', '9vpd48-r45vc-uuilu-zw181j.json', '18382100111', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('9zbdp-lh5qmh-jyuuto-g9vhb', 'e9gl9p-6wsmgl', '9zbdp-lh5qmh-jyuuto-g9vhb.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('aj8o2v-i7jds-zigu2e-fitw2n', 'butzai-n599dh', 'aj8o2v-i7jds-zigu2e-fitw2n.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('akwvj-yv3d-kwaa4j-cdmte', 'e9gl9p-6wsmgl', 'akwvj-yv3d-kwaa4j-cdmte.json', '18382100295', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('az3sdn-1ajqdk-0vknmh-qhquod', 'ycv39-mfh85', 'az3sdn-1ajqdk-0vknmh-qhquod.json', '18382100048', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('b13br-mbli98-fzz3ea-anh3ka', 'e9gl9p-6wsmgl', 'b13br-mbli98-fzz3ea-anh3ka.json', '162711000996', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('b7mj18-lf7sfl-6rkksg-r9o3x7', 'e9gl9p-6wsmgl', 'b7mj18-lf7sfl-6rkksg-r9o3x7.json', '163231001207', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('bpf8j-t5fvod-9wx57p-qn1ojb', 'butzai-n599dh', 'bpf8j-t5fvod-9wx57p-qn1ojb.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('bwalij-ksjg6-93y5un-0g3bv', 'ycv39-mfh85', 'bwalij-ksjg6-93y5un-0g3bv.json', '152001000388', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('cg0nn-87fh2-exhpbg-xpaqy6', 'e9gl9p-6wsmgl', 'cg0nn-87fh2-exhpbg-xpaqy6.json', '18382100466', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('cvx31d-p1lf28-duvnz3-ctymg', 'ycv39-mfh85', 'cvx31d-p1lf28-duvnz3-ctymg.json', '151591000413', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('cxvuhh-549a6-ttkw4o-vs1xn5', 'ycv39-mfh85', 'cxvuhh-549a6-ttkw4o-vs1xn5.json', '163231000562', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('d1t9ws-auocpr-tr90y-lyo2mg', 'e9gl9p-6wsmgl', 'd1t9ws-auocpr-tr90y-lyo2mg.json', '162711000762', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('d4u2il-1yfkh-xw6sh-tneoe', 'e9gl9p-6wsmgl', 'd4u2il-1yfkh-xw6sh-tneoe.json', '18382100137', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('d7zha2-je4dw-qvnblq-ibn73h', 'butzai-n599dh', 'd7zha2-je4dw-qvnblq-ibn73h.json', '17382100258', 'xoqxd-807vj9-z2r7k-2hcdo', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('ddzrcj-s96lrt-qqrya7-51bhx4i', 'ycv39-mfh85', 'ddzrcj-s96lrt-qqrya7-51bhx4i.json', '18382100025', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('dnyobq-ch21dp-hmq7fd-wkdgai', 'ycv39-mfh85', 'dnyobq-ch21dp-hmq7fd-wkdgai.json', '162711000949', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('dsz8gb-7oj8o-9kamjr-4gm04o', 'ycv39-mfh85', 'dsz8gb-7oj8o-9kamjr-4gm04o.json', '17382100474', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('duxzpp-x5ygvp-u7h3yc-va6ma5', 'e9gl9p-6wsmgl', 'duxzpp-x5ygvp-u7h3yc-va6ma5.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('edm9e-ivi78q-kgvd0v-q9p1n', 'ycv39-mfh85', 'edm9e-ivi78q-kgvd0v-q9p1n.json', '18382100189', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('faeag-b1r47r-90mj3-ay6wy8', 'e9gl9p-6wsmgl', 'faeag-b1r47r-90mj3-ay6wy8.json', '16334100090', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('fxxf7a-k0vmps-86wxlg-lbvf7s', 'e9gl9p-6wsmgl', 'fxxf7a-k0vmps-86wxlg-lbvf7s.json', '162711001040', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('g2jh08-99c4g-9komge-9597xw', 'e9gl9p-6wsmgl', 'g2jh08-99c4g-9komge-9597xw.json', '162711000869', 'rs7mlk-5wcsf7-w55rr9-s23ltds', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('gcf6vo-qnhd5-y16b3-1kjqp4', 'e9gl9p-6wsmgl', 'gcf6vo-qnhd5-y16b3-1kjqp4.json', '163231000592', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('gl8ks-648dn-d62yv-jq2caf', 'ycv39-mfh85', 'gl8ks-648dn-d62yv-jq2caf.json', '18382100210', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('gt4r1u-wgtiur-uxhq4e5-nwha1r', 'e9gl9p-6wsmgl', 'gt4r1u-wgtiur-uxhq4e5-nwha1r.json', '18382100381', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('gxw1ah-7z62jl-x8kx3-z0435jn', 'ycv39-mfh85', 'gxw1ah-7z62jl-x8kx3-z0435jn.json', '18382100106', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('h2h76l7g-vtwrqm-l4ouof-5yx8ej', 'butzai-n599dh', 'h2h76l7g-vtwrqm-l4ouof-5yx8ej.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('j00sxh-ankcn-es91oh-l4b0y', 'ycv39-mfh85', 'j00sxh-ankcn-es91oh-l4b0y.json', '163231000336', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('jb1an-j6a76g-r9r7p8-r2uan', 'butzai-n599dh', 'jb1an-j6a76g-r9r7p8-r2uan.json', '18382100137', 'r4ksz-uekje5-pu3b4-jqwzc9', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('jnlkub-hmbk4j-6161v9-9cl0qs', 'butzai-n599dh', 'jnlkub-hmbk4j-6161v9-9cl0qs.json', '162711000869', 'rs7mlk-5wcsf7-w55rr9-s23ltds', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('jp07w5-z6f6u9-o9h3fb-gsangc', 'e9gl9p-6wsmgl', 'jp07w5-z6f6u9-o9h3fb-gsangc.json', '163231000262', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('kbwo9-3l47b-isq8uq-nxvoaq', 'ycv39-mfh85', 'kbwo9-3l47b-isq8uq-nxvoaq.json', '18382100057', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('kgiqp-b7l3m-gyiad7-s2lem', 'e9gl9p-6wsmgl', 'kgiqp-b7l3m-gyiad7-s2lem.json', '18382100296', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('kkx50n-5ka2fq-rdf4r4-46wi48', 'e9gl9p-6wsmgl', 'kkx50n-5ka2fq-rdf4r4-46wi48.json', '18382100161', 'rs7mlk-5wcsf7-w55rr9-s23ltds', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('l3vnio-wk5ia-w66ydt-2z82hi', 'e9gl9p-6wsmgl', 'l3vnio-wk5ia-w66ydt-2z82hi.json', '17382100372', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('lb0e4m-jl1r0m-h9amnc-gauizn', 'butzai-n599dh', 'lb0e4m-jl1r0m-h9amnc-gauizn.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('lnxni9-xk4ypk-mk7ybb-5crgpc', 'e9gl9p-6wsmgl', 'lnxni9-xk4ypk-mk7ybb-5crgpc.json', '162711000281', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('m3sp67-lmoh7g-rhzb88-i67qeb', 'ycv39-mfh85', 'm3sp67-lmoh7g-rhzb88-i67qeb.json', '17382100068', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('mk3pe9-k5kfel-hb563-mbwohf', 'e9gl9p-6wsmgl', 'mk3pe9-k5kfel-hb563-mbwohf.json', '16334100090', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('mp9b65-a71aum-dineat-tit70i', 'ycv39-mfh85', 'mp9b65-a71aum-dineat-tit70i.json', '162711001030', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('na8ats-5evhik-nue5j7-ag69s', 'e9gl9p-6wsmgl', 'na8ats-5evhik-nue5j7-ag69s.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('o69x1-klgugs-eixc4o-atbao', 'e9gl9p-6wsmgl', 'o69x1-klgugs-eixc4o-atbao.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('o851ub-rqkp0v-xucd2-i1dal', 'ycv39-mfh85', 'o851ub-rqkp0v-xucd2-i1dal.json', '18382100263', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('o9kl1e-c4wc1-blihno-sltnm', 'ycv39-mfh85', 'o9kl1e-c4wc1-blihno-sltnm.json', '17382100469', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('ogwkub-ogo8cr-9q084j-q4wz38q', 'e9gl9p-6wsmgl', 'ogwkub-ogo8cr-9q084j-q4wz38q.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('oszie6-alz6m-flh4h-8vffnf', 'ycv39-mfh85', 'oszie6-alz6m-flh4h-8vffnf.json', '163231000741', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('pew00s-aec73q-bobmtf-dh8q9m', 'e9gl9p-6wsmgl', 'pew00s-aec73q-bobmtf-dh8q9m.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('pmxa9a-bhukb-o6184c-d64dyy', 'e9gl9p-6wsmgl', 'pmxa9a-bhukb-o6184c-d64dyy.json', '17382100045', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('q14ird-zf8fy0u-b18dp-236qki', 'oyvic-jg3t1l', 'q14ird-zf8fy0u-b18dp-236qki.json', '18382100082', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('qbpia-ir4bjk-vwmh96-00k73', 'ycv39-mfh85', 'qbpia-ir4bjk-vwmh96-00k73.json', '17382100469', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('qesb2j-effume-pxoo3r-ehsvwk', 'butzai-n599dh', 'qesb2j-effume-pxoo3r-ehsvwk.json', '18382100137', 'r4ksz-uekje5-pu3b4-jqwzc9', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('qkw409-u0akf-07iroa-flved', 'e9gl9p-6wsmgl', 'qkw409-u0akf-07iroa-flved.json', '163231000915', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('r011au-iapznx-iivfr7-yjo0il', 'ycv39-mfh85', 'r011au-iapznx-iivfr7-yjo0il.json', '163231001005', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('r4scr-1raby-qsvnhl-7q6ymxc', 'ycv39-mfh85', 'r4scr-1raby-qsvnhl-7q6ymxc.json', '18382100111', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('r5xlbr-trfxht-f0szas-karoo', 'butzai-n599dh', 'r5xlbr-trfxht-f0szas-karoo.json', '18382100316', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('rfliz7-6mzrbd-8n9azn-td8u3m', 'ycv39-mfh85', 'rfliz7-6mzrbd-8n9azn-td8u3m.json', '162711000949', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('rgh8-sxi7a-jenqnx-3nf66u', 'e9gl9p-6wsmgl', 'rgh8-sxi7a-jenqnx-3nf66u.json', '162711000869', 'rs7mlk-5wcsf7-w55rr9-s23ltds', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('rhgq39-dmo4i-gisvps-levy4r', 'ycv39-mfh85', 'rhgq39-dmo4i-gisvps-levy4r.json', '17382100065', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('rpv14a-ar58zd-d652bg-g12isf', 'ycv39-mfh85', 'rpv14a-ar58zd-d652bg-g12isf.json', '18382100288', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('rwrn7h-1mxmcl-d1tjl-752e5', 'butzai-n599dh', 'rwrn7h-1mxmcl-d1tjl-752e5.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('rygiaj-woxr1-cftd9-etuk4d', 'e9gl9p-6wsmgl', 'rygiaj-woxr1-cftd9-etuk4d.json', '163231000403', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('sh0ke-p83okm-qqh1pn-k8ynp', 'e9gl9p-6wsmgl', 'sh0ke-p83okm-qqh1pn-k8ynp.json', '163231000822', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('tlno91-6u54g9-jpemnt-31r9gu', 'e9gl9p-6wsmgl', 'tlno91-6u54g9-jpemnt-31r9gu.json', '18382100426', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('tnceyp-7gqyng-y8hn2h-yr2jfr', 'e9gl9p-6wsmgl', 'tnceyp-7gqyng-y8hn2h-yr2jfr.json', '152121000300', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('tzj218-kwdj7-tbguhk-piuvd4', 'e9gl9p-6wsmgl', 'tzj218-kwdj7-tbguhk-piuvd4.json', '18382100428', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('u38nef-ai55q-5lkxr7-v0gvlb', 'butzai-n599dh', 'u38nef-ai55q-5lkxr7-v0gvlb.json', '162711000869', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('u60vcf-acts3m-pckfx-4c0w2h', 'ycv39-mfh85', 'u60vcf-acts3m-pckfx-4c0w2h.json', '152001000514', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('udpaog-17lq8g-uq5l9g-kskj5n', 'ycv39-mfh85', 'udpaog-17lq8g-uq5l9g-kskj5n.json', '17382100474', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('ue5h7-yvjtjk-eofqog-b5a2q8', 'e9gl9p-6wsmgl', 'ue5h7-yvjtjk-eofqog-b5a2q8.json', '163231001204', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('vpgc2d-vql2xb-hhnmka-g19ynkh', 'e9gl9p-6wsmgl', 'vpgc2d-vql2xb-hhnmka-g19ynkh.json', '18382100415', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('vyf6la-81009c-wqz7l-9hnemw', 'butzai-n599dh', 'vyf6la-81009c-wqz7l-9hnemw.json', '18382100176', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('wm2yeh-buivdo-5fj8q-6szzas', 'e9gl9p-6wsmgl', 'wm2yeh-buivdo-5fj8q-6szzas.json', '162711000970', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('wpphak-8r0hdr-r1buhd-tqw29h', 'ycv39-mfh85', 'wpphak-8r0hdr-r1buhd-tqw29h.json', '18382100040', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('wpt7l7-asgjva-uz5os3-uecztj', 'e9gl9p-6wsmgl', 'wpt7l7-asgjva-uz5os3-uecztj.json', '163231000427', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('wt77gni-zq6fl-rwact-4tv3hi', 'butzai-n599dh', 'wt77gni-zq6fl-rwact-4tv3hi.json', '18382100137', 'r4ksz-uekje5-pu3b4-jqwzc9', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('x44wf4-mt221q-kryiij-9ntn2', 'e9gl9p-6wsmgl', 'x44wf4-mt221q-kryiij-9ntn2.json', '162711000869', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('x7rwv-sson4q-5ku5t-g9puej', 'e9gl9p-6wsmgl', 'x7rwv-sson4q-5ku5t-g9puej.json', '18382100137', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('xdevjl-zkll9m-583ex9-5z0ecn', 'e9gl9p-6wsmgl', 'xdevjl-zkll9m-583ex9-5z0ecn.json', '163231000756', 'mqz5t-dhqsqk-lz265l-qui8tb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('xgixp9-bk5wfb-qexpkg-qg6els', 'ycv39-mfh85', 'xgixp9-bk5wfb-qexpkg-qg6els.json', '163231000432', 'ef5vzf-mk31ka-3ltqao-3ikaf7', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('xjuh6-6giao-43zvtb-tse6p', 'e9gl9p-6wsmgl', 'xjuh6-6giao-43zvtb-tse6p.json', '18382100439', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('xkf3pk-q6e2c-xro3ls-7yiqx', 'e9gl9p-6wsmgl', 'xkf3pk-q6e2c-xro3ls-7yiqx.json', '18382100300', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('xn5vva-o90yf8-xgenhi-v8isel', 'ycv39-mfh85', 'xn5vva-o90yf8-xgenhi-v8isel.json', '17382100474', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('xraggj-i1slp8-1lxd0f-b4uai', 'e9gl9p-6wsmgl', 'xraggj-i1slp8-1lxd0f-b4uai.json', '163301002285', 'bx4ac-o7304f-xl8k2r-7fco1d', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('xxnotc-7bu0gi-c2tk2m-8ul497', 'ycv39-mfh85', 'xxnotc-7bu0gi-c2tk2m-8ul497.json', '16323100792', 'tjdbk9-r8dbn8-4wsck-c7akdb', '0', '1552701600000', '1552707000000', '0');
INSERT INTO `exam_student` VALUES ('zv40h-lo05s-hkijrd-c6k0dv', 'butzai-n599dh', 'zv40h-lo05s-hkijrd-c6k0dv.json', '18382100329', 'j4pro7-8fe63v-f7dhkk-uuj2or', '0', '1552701600000', '1552707000000', '0');

-- ----------------------------
-- Table structure for exam_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_type`;
CREATE TABLE `exam_type` (
  `exam_id` varchar(255) NOT NULL DEFAULT '',
  `exam_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_type
-- ----------------------------
INSERT INTO `exam_type` VALUES ('8sc5d7-7p5f9e-cb2zii-ahe5i', '周考1');
INSERT INTO `exam_type` VALUES ('jpg8y9-zbzt7o-jpvuhf-fwnjvr', '周考2');
INSERT INTO `exam_type` VALUES ('ukmp9b-radddj-ogwdr-nw3ane', '周考3');
INSERT INTO `exam_type` VALUES ('wbxm4-jf8q6k-lvt2ca-ze96mg', '月考');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_id` varchar(255) NOT NULL DEFAULT '',
  `grade_name` varchar(255) DEFAULT NULL,
  `room_id` varchar(255) DEFAULT NULL,
  `subject_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('hg9pz-qxoiw2-8hgd8-bmtr5', '1701B', '68kr4-5hl1br-4p1ogc-r7qj8s', '4pu32-vs796l');
INSERT INTO `grade` VALUES ('joyqt9-gyxsa8-fif6c-j12o0k', '1610C', '7u98ic-jee0x-hv6fb-7ht5gm', 'fyu3ln-azjkie');
INSERT INTO `grade` VALUES ('ef5vzf-mk31ka-3ltqao-3ikaf7', '1610A', 'ddlo2b-qqts69-2pq07w-hiua58', 'fyu3ln-azjkie');
INSERT INTO `grade` VALUES ('r4ksz-uekje5-pu3b4-jqwzc9', '1611A', '9t1107-7wj1wa-9r5r44-jg42j', '1psw2b-cy7o07');
INSERT INTO `grade` VALUES ('j4pro7-8fe63v-f7dhkk-uuj2or', '1611B', 'lqdoi-3rujiu-463jtu-luhrmt', '1psw2b-cy7o07');
INSERT INTO `grade` VALUES ('xoqxd-807vj9-z2r7k-2hcdo', '1611C', 'fexmqe-3vzo4-e3m2b-tzwwr', '1psw2b-cy7o07');
INSERT INTO `grade` VALUES ('mqz5t-dhqsqk-lz265l-qui8tb', '1609B', 'ipb57j-9uyebp-6xgdp-ud3i6', 'wl5yk-38c0g');
INSERT INTO `grade` VALUES ('oery4-9h55c-76sdkj-fba5ag', '1609A', 'idf126-po0y5l-y19vjj-y2ud6o', 'wl5yk-38c0g');
INSERT INTO `grade` VALUES ('tjdbk9-r8dbn8-4wsck-c7akdb', '1610B', '7c2oqu-czal5-7mywic-5t20xq', 'fyu3ln-azjkie');
INSERT INTO `grade` VALUES ('jtgxii-d2mc-5jcojq-px8uoa', '1701C', 'pcyum-xncax9-eh2c6fk-odhxn', '4pu32-vs796l');
INSERT INTO `grade` VALUES ('we0eya-r2td2b-2h4yhg-ggxp1vf', '1612A', 'fantrl-x3hsdf-hfryfr-ixa9fb', 'wl5yk-38c0g');
INSERT INTO `grade` VALUES ('bx4ac-o7304f-xl8k2r-7fco1d', '1612B', '8k5wqg-8sm2pr-di8dq-iejrp', 'wl5yk-38c0g');
INSERT INTO `grade` VALUES ('rs7mlk-5wcsf7-w55rr9-s23ltds', '1701E', '9njyyc-i39brm-z9k0pj-n0c83u', 'wl5yk-38c0g');

-- ----------------------------
-- Table structure for identity
-- ----------------------------
DROP TABLE IF EXISTS `identity`;
CREATE TABLE `identity` (
  `identity_id` varchar(255) NOT NULL DEFAULT '',
  `identity_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identity
-- ----------------------------
INSERT INTO `identity` VALUES ('63no9p-8y0k4', '管理员');
INSERT INTO `identity` VALUES ('uf81yn-hv8uvv', '出题者');
INSERT INTO `identity` VALUES ('zi0gu7-v7dy08', '浏览者');

-- ----------------------------
-- Table structure for identity_api_authority_relation
-- ----------------------------
DROP TABLE IF EXISTS `identity_api_authority_relation`;
CREATE TABLE `identity_api_authority_relation` (
  `identity_api_authority_relation_id` varchar(255) NOT NULL DEFAULT '',
  `identity_id` varchar(255) DEFAULT NULL,
  `api_authority_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identity_api_authority_relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identity_api_authority_relation
-- ----------------------------
INSERT INTO `identity_api_authority_relation` VALUES ('2sipwi-b2hul-5mw0xf', '63no9p-8y0k4', 'i69wzm-bkqldr');
INSERT INTO `identity_api_authority_relation` VALUES ('9ltxnf-lwhywa-h3khm', '63no9p-8y0k4', 'duf7ds-zwvace');
INSERT INTO `identity_api_authority_relation` VALUES ('0e6v5-6ssbu-ns9bp', '63no9p-8y0k4', 'yda3h-y6nekr');
INSERT INTO `identity_api_authority_relation` VALUES ('ebgihf-zxn3z-xybmoh', '63no9p-8y0k4', 'ybay6c-kqm7w');
INSERT INTO `identity_api_authority_relation` VALUES ('cu92a-dfmwu-w6351g', '63no9p-8y0k4', 'rzerajv-0d95uo');
INSERT INTO `identity_api_authority_relation` VALUES ('o4ncu-zb3rlf-fof02s', '63no9p-8y0k4', '32uyuk-lg0kel');
INSERT INTO `identity_api_authority_relation` VALUES ('pok0k-ncgj3-hscre', '63no9p-8y0k4', 'jxczxso-8e8enf');
INSERT INTO `identity_api_authority_relation` VALUES ('p4mdam-ml5uy6-hgs7zr', '63no9p-8y0k4', 'kpp9kr-nywgm');
INSERT INTO `identity_api_authority_relation` VALUES ('9nd48n-8tko9e-wxcgds', '63no9p-8y0k4', '1nm0c-hj4i9i');
INSERT INTO `identity_api_authority_relation` VALUES ('rpg6cc-2hgckf-z88iu', '63no9p-8y0k4', '9mi37w-edgwper');
INSERT INTO `identity_api_authority_relation` VALUES ('xrv6mm-ae7n6m-04n7', '63no9p-8y0k4', 'wctk6-eb17u');
INSERT INTO `identity_api_authority_relation` VALUES ('nwv5p7-iqg8na-rvuxdn', '63no9p-8y0k4', 'axk8no-pi8un');
INSERT INTO `identity_api_authority_relation` VALUES ('otajrg-k800ke-zinmo', '63no9p-8y0k4', 'fcmvyt-0l7e1s');
INSERT INTO `identity_api_authority_relation` VALUES ('wsckga-4myyih-7yudma', '63no9p-8y0k4', 'iowcpb-0rmeze');
INSERT INTO `identity_api_authority_relation` VALUES ('ipplws-7jozs9u-wm70qh', '63no9p-8y0k4', 'rnlldc-cbymie');
INSERT INTO `identity_api_authority_relation` VALUES ('2zfz4-v7kvff-iwd0rj', '63no9p-8y0k4', 'prvn7n-p6khft');
INSERT INTO `identity_api_authority_relation` VALUES ('0ewep7-np7npj-tqwxr', '63no9p-8y0k4', 'y707cc-kiahhg');
INSERT INTO `identity_api_authority_relation` VALUES ('pdtxuk-0gfm8m-jafbsmd', 'uf81yn-hv8uvv', 'i69wzm-bkqldr');
INSERT INTO `identity_api_authority_relation` VALUES ('tj2eqd-9owdy8-6pyx', 'uf81yn-hv8uvv', 'yda3h-y6nekr');
INSERT INTO `identity_api_authority_relation` VALUES ('vq7g5m-dukco4-ovqkuj', 'uf81yn-hv8uvv', '32uyuk-lg0kel');
INSERT INTO `identity_api_authority_relation` VALUES ('w5nj09-l0vd5b-ljs0gb', 'uf81yn-hv8uvv', 'jxczxso-8e8enf');
INSERT INTO `identity_api_authority_relation` VALUES ('xc7z2-bxvy8m-3k66pl', '63no9p-8y0k4', 'fvmtcb-g339h');
INSERT INTO `identity_api_authority_relation` VALUES ('1lejic-80tm0d-jpo5mq', 'uf81yn-hv8uvv', 'fvmtcb-g339h');
INSERT INTO `identity_api_authority_relation` VALUES ('cctsi7-lystop-mmnxx9', 'uf81yn-hv8uvv', 'duf7ds-zwvace');
INSERT INTO `identity_api_authority_relation` VALUES ('46uezp9-u23t8b-tmewpb', 'uf81yn-hv8uvv', 'ybay6c-kqm7w');
INSERT INTO `identity_api_authority_relation` VALUES ('4n5obj-ngchf-fo9u4o', 'uf81yn-hv8uvv', 'rzerajv-0d95uo');
INSERT INTO `identity_api_authority_relation` VALUES ('stdqf-6axl7c-f6xi6', '63no9p-8y0k4', '2irygl-h8we2');
INSERT INTO `identity_api_authority_relation` VALUES ('irbac-hpzioe-i7y48', 'uf81yn-hv8uvv', '2irygl-h8we2');
INSERT INTO `identity_api_authority_relation` VALUES ('yqg7b-e3vypl-lot8mj', '63no9p-8y0k4', 'db1edd-ywjnus');
INSERT INTO `identity_api_authority_relation` VALUES ('i124cf-4q73hv-121pa4', '63no9p-8y0k4', 'vkngbd-gnjkq');
INSERT INTO `identity_api_authority_relation` VALUES ('xlzxp-ksz2i-z1a39k', '63no9p-8y0k4', 'md2k6-5phy2a');
INSERT INTO `identity_api_authority_relation` VALUES ('rwj63d-jqe4v-omvypq', '63no9p-8y0k4', 'oczc1v-uf0m0d');
INSERT INTO `identity_api_authority_relation` VALUES ('gt20bs-w8vam-6gvv78', 'uf81yn-hv8uvv', 'oczc1v-uf0m0d');
INSERT INTO `identity_api_authority_relation` VALUES ('hhog7b-7t234g-00olkf', '63no9p-8y0k4', 'ekp5yh-5xyxoh');
INSERT INTO `identity_api_authority_relation` VALUES ('1f17v8-jjs2b-ffbqhr', 'uf81yn-hv8uvv', 'ekp5yh-5xyxoh');
INSERT INTO `identity_api_authority_relation` VALUES ('ru7ty-nitle-acap0y', 'zi0gu7-v7dy08', 'i69wzm-bkqldr');
INSERT INTO `identity_api_authority_relation` VALUES ('eun0fq-0am9qo-ppthl', 'zi0gu7-v7dy08', 'ekp5yh-5xyxoh');
INSERT INTO `identity_api_authority_relation` VALUES ('krt9n9-zvncag-57ae5', 'zi0gu7-v7dy08', 'fvmtcb-g339h');
INSERT INTO `identity_api_authority_relation` VALUES ('v47vgn-qweotd-qlh7z', 'zi0gu7-v7dy08', '2irygl-h8we2');
INSERT INTO `identity_api_authority_relation` VALUES ('r663p-cvpreh-9ts2l7', 'zi0gu7-v7dy08', 'oczc1v-uf0m0d');
INSERT INTO `identity_api_authority_relation` VALUES ('kvxxef-6b4l9x-jhphnw', '63no9p-8y0k4', '2z41v-6b16qq');
INSERT INTO `identity_api_authority_relation` VALUES ('lr6bub-0su6y5-gmkejr', 'uf81yn-hv8uvv', '2z41v-6b16qq');
INSERT INTO `identity_api_authority_relation` VALUES ('74ytp-w0m20yo-sbinre', 'zi0gu7-v7dy08', '2z41v-6b16qq');
INSERT INTO `identity_api_authority_relation` VALUES ('j4432s-rca6hj-1s4reh', '63no9p-8y0k4', '61ocu2-kko0gq');
INSERT INTO `identity_api_authority_relation` VALUES ('o9m1q-pxym3c-wzzbof', 'uf81yn-hv8uvv', '61ocu2-kko0gq');
INSERT INTO `identity_api_authority_relation` VALUES ('t6cf2p-6zsnw-dggryc', '63no9p-8y0k4', 'vyojc-ivkvmj');
INSERT INTO `identity_api_authority_relation` VALUES ('16car5-hziw4a-arr71', '63no9p-8y0k4', 'i36cqa-kymf6k');
INSERT INTO `identity_api_authority_relation` VALUES ('2uvbmh-o1t0ei-ljfrqp', '63no9p-8y0k4', 'xymq2-61tk5o');
INSERT INTO `identity_api_authority_relation` VALUES ('ecp7fl-3jmgpq-5eivh3', '63no9p-8y0k4', 'q3shir-90gdgg');
INSERT INTO `identity_api_authority_relation` VALUES ('6joqn-3vq0o-zl9ha6', '63no9p-8y0k4', 'trvocc-8k1aqs');
INSERT INTO `identity_api_authority_relation` VALUES ('bl0n4-y8ave-apoh6g', '63no9p-8y0k4', '9shqic-k0df6');
INSERT INTO `identity_api_authority_relation` VALUES ('r9kcz-i37tun-5skrhf', 'uf81yn-hv8uvv', 'i36cqa-kymf6k');
INSERT INTO `identity_api_authority_relation` VALUES ('dhai27-tu6cj8-juutt6', 'uf81yn-hv8uvv', 'vyojc-ivkvmj');
INSERT INTO `identity_api_authority_relation` VALUES ('xffaj-0yrg8j-o9o3bc', 'uf81yn-hv8uvv', 'xymq2-61tk5o');
INSERT INTO `identity_api_authority_relation` VALUES ('ksooap-2kfqiv-36v2y', 'uf81yn-hv8uvv', 'q3shir-90gdgg');
INSERT INTO `identity_api_authority_relation` VALUES ('o4awzv-enj01d-5dtq2', 'uf81yn-hv8uvv', 'trvocc-8k1aqs');
INSERT INTO `identity_api_authority_relation` VALUES ('54yi29-cjdube-mc7j2e', 'uf81yn-hv8uvv', '9shqic-k0df6');
INSERT INTO `identity_api_authority_relation` VALUES ('m8bajm-z4l732-iwkspt', 'uf81yn-hv8uvv', 'ys4ntc-zp4r5w');
INSERT INTO `identity_api_authority_relation` VALUES ('8qoz6s-btnqp-m086z', 'uf81yn-hv8uvv', '9rwj7v-6q4ro');
INSERT INTO `identity_api_authority_relation` VALUES ('2vkrqs-cservc-qw54kv', '63no9p-8y0k4', '6prwc8-xy3fhk');

-- ----------------------------
-- Table structure for identity_view_authority_relation
-- ----------------------------
DROP TABLE IF EXISTS `identity_view_authority_relation`;
CREATE TABLE `identity_view_authority_relation` (
  `identity_view_authority_relation_id` varchar(255) NOT NULL DEFAULT '',
  `identity_id` varchar(255) DEFAULT NULL,
  `view_authority_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identity_view_authority_relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identity_view_authority_relation
-- ----------------------------
INSERT INTO `identity_view_authority_relation` VALUES ('uo48jw-9wmca3-xiu7qgc', '63no9p-8y0k4', 'r50r9t-1p1kbm');
INSERT INTO `identity_view_authority_relation` VALUES ('3p0q4i-ap1qne-hhxy7i', '63no9p-8y0k4', '8olznh-943zt');
INSERT INTO `identity_view_authority_relation` VALUES ('h2m3l3-y61zk1-dpksjp', '63no9p-8y0k4', '4pvvb3-h5kzg');
INSERT INTO `identity_view_authority_relation` VALUES ('lnx4i-dl9998-btorgs', '63no9p-8y0k4', 'vnpojq-tisgu');
INSERT INTO `identity_view_authority_relation` VALUES ('5erk2p-fk1e2n-moraba', '63no9p-8y0k4', 'xpz8cf-xoyd7n');
INSERT INTO `identity_view_authority_relation` VALUES ('7jsj48-ullf9o-dautlb', '63no9p-8y0k4', 'qcrhh-k0tvh');
INSERT INTO `identity_view_authority_relation` VALUES ('5c6fu6-zwtfa-kzuies', '63no9p-8y0k4', 'o4xsrn-5heg27');
INSERT INTO `identity_view_authority_relation` VALUES ('1g0ui-l52ryb-932yj', 'uf81yn-hv8uvv', 'r50r9t-1p1kbm');
INSERT INTO `identity_view_authority_relation` VALUES ('v79dd8-3a01kl-jyl10p', 'uf81yn-hv8uvv', '8olznh-943zt');
INSERT INTO `identity_view_authority_relation` VALUES ('e2xgol-l5ttus-k00i9f', 'uf81yn-hv8uvv', '4pvvb3-h5kzg');
INSERT INTO `identity_view_authority_relation` VALUES ('0p9s9i-h74p9-z3ihhw', 'uf81yn-hv8uvv', 'xpz8cf-xoyd7n');
INSERT INTO `identity_view_authority_relation` VALUES ('u7grma-f5zamg-oxzfxs', '63no9p-8y0k4', '1orauc-piu6gm');
INSERT INTO `identity_view_authority_relation` VALUES ('kui3x-9x0pf8-dx2lgq', '63no9p-8y0k4', '43t70e-pk8ylk');
INSERT INTO `identity_view_authority_relation` VALUES ('it7q68-1ww2ad-p3mwn', 'zi0gu7-v7dy08', 'r50r9t-1p1kbm');
INSERT INTO `identity_view_authority_relation` VALUES ('uhsmb6-sy2te-6krt4q', 'zi0gu7-v7dy08', '8olznh-943zt');
INSERT INTO `identity_view_authority_relation` VALUES ('4tgudt-mcx4tb-4lort5', 'zi0gu7-v7dy08', 'xpz8cf-xoyd7n');
INSERT INTO `identity_view_authority_relation` VALUES ('eyhdy-6ayhkc-g9gvtd', '63no9p-8y0k4', '0a1llo-a1vt2');
INSERT INTO `identity_view_authority_relation` VALUES ('00nqqg-n5ac3h-rx2t0q', 'uf81yn-hv8uvv', '0a1llo-a1vt2');
INSERT INTO `identity_view_authority_relation` VALUES ('ysq6m3-xmvt2n-7noqdj', 'uf81yn-hv8uvv', 'n083ob-u54cop');
INSERT INTO `identity_view_authority_relation` VALUES ('y92xxr-hek19i-vvmikn', '63no9p-8y0k4', 'n083ob-u54cop');
INSERT INTO `identity_view_authority_relation` VALUES ('s644lw-vmp9nu-31w53c', '63no9p-8y0k4', '2iilq2-n3c8qi');
INSERT INTO `identity_view_authority_relation` VALUES ('r8evb1-x6vg7f-0ntghk', '63no9p-8y0k4', 'xpnrf-levvc');
INSERT INTO `identity_view_authority_relation` VALUES ('x2ayw-9k35w-8vidj', '63no9p-8y0k4', 'dow3c8-tb0lid');
INSERT INTO `identity_view_authority_relation` VALUES ('7l95q-16m92w-jq2a4v', 'uf81yn-hv8uvv', '2iilq2-n3c8qi');
INSERT INTO `identity_view_authority_relation` VALUES ('glf3t-b0a3un-8nxs4', 'uf81yn-hv8uvv', 'xpnrf-levvc');
INSERT INTO `identity_view_authority_relation` VALUES ('lfht8v-r3sk6c-29kkf', 'uf81yn-hv8uvv', 'dow3c8-tb0lid');
INSERT INTO `identity_view_authority_relation` VALUES ('0txhan-z1aj8-zis298', '63no9p-8y0k4', 'fmdrhm-xfnmxk');
INSERT INTO `identity_view_authority_relation` VALUES ('ur6ghm-v46zea-ar24ug', '63no9p-8y0k4', '04d1m-605j25');
INSERT INTO `identity_view_authority_relation` VALUES ('sf8vip-nxga0c-ri6er8', '63no9p-8y0k4', 'gjfnm-0gawb');
INSERT INTO `identity_view_authority_relation` VALUES ('xh789b-tay1rk-pp5j25', '63no9p-8y0k4', 'tkf3zb-nbgx8');
INSERT INTO `identity_view_authority_relation` VALUES ('slyqyg-3c963-6l2frv', '63no9p-8y0k4', 'sspzw-6pwguo');
INSERT INTO `identity_view_authority_relation` VALUES ('3eas7-4hoga-b5zwti', '63no9p-8y0k4', 'qlhzjb-gcr08d');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `questions_id` varchar(255) NOT NULL DEFAULT '',
  `questions_type_id` varchar(255) DEFAULT NULL,
  `json_path` varchar(255) DEFAULT NULL,
  `subject_id` varchar(255) DEFAULT NULL,
  `exam_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`questions_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('4t0rar-39c33-wq098t-phh5ht', 'fwf0t-wla1q', '4t0rar-39c33-wq098t-phh5ht.json', 'fqtktr-1lq5u', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'ypay2t-7uxsd', '机器人归位');
INSERT INTO `questions` VALUES ('4vu7t9-t9vv08-chvz3r-n8i3nq', 'v8i73-r8oai', '4vu7t9-t9vv08-chvz3r-n8i3nq.json', 'fqtktr-1lq5u', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'ypay2t-7uxsd', '创建一副扑克牌');
INSERT INTO `questions` VALUES ('npcnawn-0apvx-qbofy-ms3t4p', 'fwf0t-wla1q', 'npcnawn-0apvx-qbofy-ms3t4p.json', 'fqtktr-1lq5u', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'ypay2t-7uxsd', '洗牌');
INSERT INTO `questions` VALUES ('izvfy-572mw-thxrmm-7aba5s', 'br9d6s-wh46i', 'izvfy-572mw-thxrmm-7aba5s.json', '4pu32-vs796l', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'axg8t2-oroeja', '解构赋值和数组的map方法');
INSERT INTO `questions` VALUES ('bqq54a-jly2z9-m9fg7pj-oio193', 'fwf0t-wla1q', 'bqq54a-jly2z9-m9fg7pj-oio193.json', '4pu32-vs796l', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'axg8t2-oroeja', 'async配合transition实现自定义动画');
INSERT INTO `questions` VALUES ('c7y73-e0nft-6rplem-daxvxe', 'v8i73-r8oai', 'c7y73-e0nft-6rplem-daxvxe.json', '1psw2b-cy7o07', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'w6l6n-cbvl6s', '类的抽象');
INSERT INTO `questions` VALUES ('sue8v-wa50ws-jss7qm-592yt8', 'fwf0t-wla1q', 'sue8v-wa50ws-jss7qm-592yt8.json', '1psw2b-cy7o07', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'w6l6n-cbvl6s', '使用类实现任务调度');
INSERT INTO `questions` VALUES ('gt8z4u-ufd66j-najaef-y8ytir', 'fwf0t-wla1q', 'gt8z4u-ufd66j-najaef-y8ytir.json', 'fyu3ln-azjkie', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', '封装图片加载Promise');
INSERT INTO `questions` VALUES ('fl7dll-xh6eo-hpri8a-edulg', 'fwf0t-wla1q', 'fl7dll-xh6eo-hpri8a-edulg.json', '1psw2b-cy7o07', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', '使用async函数实现多张图片的依次加载（第一张加载完之后才能加载第二张）');
INSERT INTO `questions` VALUES ('5oxqyl-8dnbaa-3dt3o9-qrecrk', 'fwf0t-wla1q', '5oxqyl-8dnbaa-3dt3o9-qrecrk.json', '1psw2b-cy7o07', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', '使用async函数实现多张图片的依次加载（哪张加载完哪张添加到页面）');
INSERT INTO `questions` VALUES ('42cuvb-7216fb-zlkab2-wwns3d', 'fwf0t-wla1q', '42cuvb-7216fb-zlkab2-wwns3d.json', '1psw2b-cy7o07', 'wbxm4-jf8q6k-lvt2ca-ze96mg', 'w6l6n-cbvl6s', 'Vue导航守卫做鉴权处理');
INSERT INTO `questions` VALUES ('uecyx-3qim4-rwk9o-v43sj8', '774318-730z8m', 'uecyx-3qim4-rwk9o-v43sj8.json', '1psw2b-cy7o07', 'wbxm4-jf8q6k-lvt2ca-ze96mg', 'w6l6n-cbvl6s', 'Vue基础知识');
INSERT INTO `questions` VALUES ('h7f6hq-cezl0g-fyu3o-6onwjf', '774318-730z8m', 'h7f6hq-cezl0g-fyu3o-6onwjf.json', '4pu32-vs796l', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'axg8t2-oroeja', 'let和var的区别');
INSERT INTO `questions` VALUES ('3zayso-dq7kt-86q4ye-9ydupa', '774318-730z8m', '3zayso-dq7kt-86q4ye-9ydupa.json', '1psw2b-cy7o07', 'wbxm4-jf8q6k-lvt2ca-ze96mg', 'w6l6n-cbvl6s', 'Vue基础知识');
INSERT INTO `questions` VALUES ('05snch-6eq8dn-szfd6q-t34nld', '774318-730z8m', '05snch-6eq8dn-szfd6q-t34nld.json', '1psw2b-cy7o07', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', 'Vue基础知识');
INSERT INTO `questions` VALUES ('ayf32j-5kv76-qvfqh-cigaoo', '774318-730z8m', 'ayf32j-5kv76-qvfqh-cigaoo.json', '4pu32-vs796l', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'axg8t2-oroeja', 'commonjs规范');
INSERT INTO `questions` VALUES ('00o5nwy-qw7jj-ko6qkb-4uwrhv', '774318-730z8m', '00o5nwy-qw7jj-ko6qkb-4uwrhv.json', '1psw2b-cy7o07', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', 'vue基础知识');
INSERT INTO `questions` VALUES ('6ivrh-g7kp8a-2gixkg-p117t', 'br9d6s-wh46i', '6ivrh-g7kp8a-2gixkg-p117t.json', '1psw2b-cy7o07', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', 'vue自定义指令');
INSERT INTO `questions` VALUES ('zyocwi-drka9-kx8vv-blrmw9p', 'v8i73-r8oai', 'zyocwi-drka9-kx8vv-blrmw9p.json', '4pu32-vs796l', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'axg8t2-oroeja', '输入的reduce方法');
INSERT INTO `questions` VALUES ('9wck8-qt73nd-0v6s8-f6jyid', 'br9d6s-wh46i', '9wck8-qt73nd-0v6s8-f6jyid.json', '1psw2b-cy7o07', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', 'vue自定义指令');
INSERT INTO `questions` VALUES ('d5osduj-krhc1-akr9l2-9tz2nz', 'fwf0t-wla1q', 'd5osduj-krhc1-akr9l2-9tz2nz.json', 'wl5yk-38c0g', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'kqpvys-hpzkdt', '不借助临时变量，进行两个整数的交换');
INSERT INTO `questions` VALUES ('in5k9-nqedo7-cjpek-30cmi', 'fwf0t-wla1q', 'in5k9-nqedo7-cjpek-30cmi.json', 'wl5yk-38c0g', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'kqpvys-hpzkdt', '进行两个整数的交换输入 a = 2, b = 4 输出 a = 4, b =2');
INSERT INTO `questions` VALUES ('40lhum-rtymrz-r8x2h-6c9od', 'fwf0t-wla1q', '40lhum-rtymrz-r8x2h-6c9od.json', 'wl5yk-38c0g', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'kqpvys-hpzkdt', '微信分享后地址发生改变，根据地址获取get传递参数');
INSERT INTO `questions` VALUES ('xt05yo-prna5g-f7zqo-ltl5rh', '774318-730z8m', 'xt05yo-prna5g-f7zqo-ltl5rh.json', 'fyu3ln-azjkie', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'ypay2t-7uxsd', 'react生命周期');
INSERT INTO `questions` VALUES ('0r33sp-v8csso-y34tc3-ddsoj', 'fwf0t-wla1q', '0r33sp-v8csso-y34tc3-ddsoj.json', 'wl5yk-38c0g', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'kqpvys-hpzkdt', '找出考试结果数组中排名前三的学生');
INSERT INTO `questions` VALUES ('joo9h2-q79phw-pskuido-ua4t7k', '774318-730z8m', 'joo9h2-q79phw-pskuido-ua4t7k.json', '1psw2b-cy7o07', 'ukmp9b-radddj-ogwdr-nw3ane', 'kqpvys-hpzkdt', 'computed 和 watch 区别');
INSERT INTO `questions` VALUES ('aihpv-1ru212-wun87-0hli3', 'v8i73-r8oai', 'aihpv-1ru212-wun87-0hli3.json', 'k1gvd4-8lrx8f', 'wbxm4-jf8q6k-lvt2ca-ze96mg', 'axg8t2-oroeja', '实现发布订阅模式');
INSERT INTO `questions` VALUES ('ma0uj-yctlrp-xjf87d-p2xrg', '774318-730z8m', 'ma0uj-yctlrp-xjf87d-p2xrg.json', 'fqtktr-1lq5u', '8sc5d7-7p5f9e-cb2zii-ahe5i', 'ypay2t-7uxsd', '数据结构之对象');
INSERT INTO `questions` VALUES ('x0gf6-ogyaaf-t88yrd-mnhxlr', 'fwf0t-wla1q', 'x0gf6-ogyaaf-t88yrd-mnhxlr.json', 'wl5yk-38c0g', 'ukmp9b-radddj-ogwdr-nw3ane', 'ypay2t-7uxsd', '汉英翻译');
INSERT INTO `questions` VALUES ('y6cbma-9qjye-rdx5kw-oundyo', 'v8i73-r8oai', 'y6cbma-9qjye-rdx5kw-oundyo.json', 'wl5yk-38c0g', 'ukmp9b-radddj-ogwdr-nw3ane', 'ypay2t-7uxsd', '实现单选切换');
INSERT INTO `questions` VALUES ('00a1t8-ezqkxg-xv9pkk-6hqfyb', 'v8i73-r8oai', '00a1t8-ezqkxg-xv9pkk-6hqfyb.json', 'fyu3ln-azjkie', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', '性能优化');
INSERT INTO `questions` VALUES ('cbssqf-16avt7-qwk8k-ufilrc', '774318-730z8m', 'cbssqf-16avt7-qwk8k-ufilrc.json', 'fyu3ln-azjkie', 'jpg8y9-zbzt7o-jpvuhf-fwnjvr', 'w6l6n-cbvl6s', '多种组件创建方式及其区别？');

-- ----------------------------
-- Table structure for questions_types
-- ----------------------------
DROP TABLE IF EXISTS `questions_types`;
CREATE TABLE `questions_types` (
  `questions_type_id` varchar(255) NOT NULL DEFAULT '',
  `questions_type_text` varchar(255) DEFAULT NULL,
  `questions_type_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`questions_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions_types
-- ----------------------------
INSERT INTO `questions_types` VALUES ('774318-730z8m', '简答题', '1');
INSERT INTO `questions_types` VALUES ('br9d6s-wh46i', '代码阅读题', '2');
INSERT INTO `questions_types` VALUES ('fwf0t-wla1q', '代码补全', '3');
INSERT INTO `questions_types` VALUES ('n66k4n-i9zpen', '修改bug', '4');
INSERT INTO `questions_types` VALUES ('v8i73-r8oai', '手写代码', '5');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` varchar(255) NOT NULL DEFAULT '',
  `room_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('68kr4-5hl1br-4p1ogc-r7qj8s', '34303');
INSERT INTO `room` VALUES ('idf126-po0y5l-y19vjj-y2ud6o', '34301');
INSERT INTO `room` VALUES ('ipb57j-9uyebp-6xgdp-ud3i6', '34401');
INSERT INTO `room` VALUES ('7u98ic-jee0x-hv6fb-7ht5gm', '34308');
INSERT INTO `room` VALUES ('w0hsld-2q053d-ogkwb-0qcs5h', '34304');
INSERT INTO `room` VALUES ('ddlo2b-qqts69-2pq07w-hiua58', '34313');
INSERT INTO `room` VALUES ('9t1107-7wj1wa-9r5r44-jg42j', '34310');
INSERT INTO `room` VALUES ('lqdoi-3rujiu-463jtu-luhrmt', '34403');
INSERT INTO `room` VALUES ('fexmqe-3vzo4-e3m2b-tzwwr', '34311');
INSERT INTO `room` VALUES ('7c2oqu-czal5-7mywic-5t20xq', '34404');
INSERT INTO `room` VALUES ('pcyum-xncax9-eh2c6fk-odhxn', '35302');
INSERT INTO `room` VALUES ('fantrl-x3hsdf-hfryfr-ixa9fb', '34302');
INSERT INTO `room` VALUES ('8k5wqg-8sm2pr-di8dq-iejrp', '34402');
INSERT INTO `room` VALUES ('9njyyc-i39brm-z9k0pj-n0c83u', '34315');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` varchar(255) NOT NULL DEFAULT '',
  `student_name` varchar(255) DEFAULT NULL,
  `student_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('19370100073', '郭永鹏', 'Pm626521@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('17382100369', '张婷', '8464Zt*', null);
INSERT INTO `student` VALUES ('162711000869', '张娜', 'Zn990703@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('151611000702', '高诗蕊', 'Gaoshir1028*', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('163231000784', '田佳茹', 'W!tjr1', null);
INSERT INTO `student` VALUES ('17382100471', '司瑞雪', 'woaiZIJI2!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('17356100084', '王璐', 'Wangklpl2010@', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100119', '翟勋', '1609Azhaixun!', null);
INSERT INTO `student` VALUES ('163231000691', '牛慧涛', 'Nht0725!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('162711000970', '范丹丹', 'Fdd1006!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000592', '郭敏敏', 'Gmm0620*', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('162711001044', '苏祥辉', 'Su150$', null);
INSERT INTO `student` VALUES ('163231000706', '袁世清', 'Ysq1997!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000377', '崔静宏', 'CJH*zilan7', null);
INSERT INTO `student` VALUES ('162711000957', '吴洪洋', 'www*1999*WHY', null);
INSERT INTO `student` VALUES ('162711000940', '侯梦杰', '@Jane1128', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('18382100162', '马兰', '!Ml00162', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000122', '罗夏扬', 'Lxy20@', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('162711000141', '朱高锰', '888888****Zgm', null);
INSERT INTO `student` VALUES ('152031000541', '张诗', '1609Azs!', 'oery4-9h55c-76sdkj-fba5ag');
INSERT INTO `student` VALUES ('163231000791', '李映儒', 'Lyr1310070068!', null);
INSERT INTO `student` VALUES ('152221000137', '雷梦柯', 'baweiExam@163.com', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162711000971', '刘焕杰', 'Liu.0606@', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('162711000435', '韩英华', 'Hanyinghua123?', null);
INSERT INTO `student` VALUES ('163231000357', '李晓娜', 'LXna@99', null);
INSERT INTO `student` VALUES ('162711000731', '贾国振', '741/852*963.Asdfghjkl;\'', null);
INSERT INTO `student` VALUES ('162711000557', '周骥宇', 'Zhou123.@', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('151591000413', '窦永铎', '@DYDlove19990520', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100191', '张珈豪', 'Jiahe102038@', null);
INSERT INTO `student` VALUES ('18382100208', '郜英杰', 'Gyj863591815*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('151991000354', '郑伟浩', 'Zheng5831200*', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('163231000281', '杨一帆', 'Yyf1998@', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100251', '雷佳', 'Lj521521@', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('152121000450', '张搏康', 'Zbk580230@', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231000741', '闫国程', '@1610Aygc', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100241', '管悦', 'GyGx1006*', null);
INSERT INTO `student` VALUES ('18382100271', '赵倩', 'Zq@120319', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('17382100322', '墨潘', '050888Mm@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('162711000465', '张金城', 'Zjc12300*', null);
INSERT INTO `student` VALUES ('162221000234', '董梦全', '@Dmq123', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('162231000822', ' 梁俊成', '*Ljv1341670218', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('162711000468', '张金城', 'Zjc12300*', null);
INSERT INTO `student` VALUES ('17382100218', '樊艳蓉', 'Fyr*521', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100085', '边晓雅', 'Bxy*0522', null);
INSERT INTO `student` VALUES ('163231001257', '杨梦伟', '@Ymw0324', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100168', '杜孟芳', 'Dmf1993*', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000105', '葛荷清', 'Ghq123@@', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('18381100254', '张克', 'Zk1992/*-+', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('18382100268', '张硕', '96144DNz1*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('163231001026', '张少泽', 'Zsz0312@', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('1632310000208', '杨超男', 'Ycn#521', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18378100160', '闫江涛', 'Ks19940210*', null);
INSERT INTO `student` VALUES ('18382100173', '盖学强', 'Gxq246368!', null);
INSERT INTO `student` VALUES ('18382100069', '姚震宇', 'Yao930425?', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('163231000432', '翟怡梦', 'Zym205650@', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('17376100480', '郑豪', 'Ah@123', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('17382100202', '李志勇', '@1610Alzy', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100057', '王坤', '@Wk521521', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('162711000732', '陈倩', '@Cq0506', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('17382100434', '谷会林', 'Gu123456789#', null);
INSERT INTO `student` VALUES ('162711000633', '赵文姣', 'Zwj914926*', null);
INSERT INTO `student` VALUES ('162711000729', '魏澳回', '@WEIaohui0726', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('17382100155', '马志强', '2135319WWa ', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100186', '周杰', 'Zj123456!', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000376', '杨仁兵', 'Yrb0321!', null);
INSERT INTO `student` VALUES ('162711001030', '张馨心', 'Zxx@1016304', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('17382100235', '祁云凯', '*Q1i0k8ai', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('141381000791', '赵浩冬', '1008611Aa*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18381100203', '高芳', 'Gfyyzs1378436$', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('151661000441', '丁宇', '@Dy12345', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('162711000777', '刘丽霞', 'Liu980519!', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('152001000388', '卢毓儒', 'Bt9524@5', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('151661000756', '陈静', 'Chenjing123*', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100053', '钱家豪', 'Xy1314!', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100212', '赵崎', 'ZQm759199521&', null);
INSERT INTO `student` VALUES ('18356100001', '孟佳琦', 'Mjq123*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('17382100387', '徐园园', 'Xy6@66', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163231000767', '焦娅柠', '@1610Ajyn', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('17382100423', '梁艳', 'Ly@54957628', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('17382100475', '孟旭盈', '@Mxy112698', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('162221000222', '张鑫祎', 'Zxy043015*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100130', '贺瀚彬', 'Bin119119#*', null);
INSERT INTO `student` VALUES ('18382100181', '王鑫磊', '@Wxl134120', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000672', '马好好', 'Mh0129#.', null);
INSERT INTO `student` VALUES ('163231001206', '李喜慧', 'Li@0819', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('152121000134', '贾志腾', '@Jzt98', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('18382100105', '胡应', '@1610Ahy', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100215', '陈可欣', 'Ckx1108@', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000334', '武媚', 'Wm1003*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231000678', '王晓园', 'Wbb97@0512', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('18382100062', '邢琴', 'YyAiMm931128@', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('17382100420', '唐宇', 'Ty0844!', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000413', '樊振', 'fZ0526!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('162711000941', '杭一达', 'Hang123..**', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000925', '石瑶宇', 'Syy1611@', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('162711000673', '吕师恩', 'L&&sn1', null);
INSERT INTO `student` VALUES ('18382100025', '侯瑞峰', 'HRFdashuaibi1@', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231001005', '楚凤沛', '@aaAA11', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('162711000943', '张健榜', 'Bang1228*', null);
INSERT INTO `student` VALUES ('18382100210', '郭小刚', '142580.@Gxg', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('17356100064', '李晓凯', 'Lxk*549426524', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('18382100270', '靳苗', 'Jm983125071!', null);
INSERT INTO `student` VALUES ('162711020711', '张聪', 'Zc@123', null);
INSERT INTO `student` VALUES ('18382100127', '张紫薇', 'ZZWzzw123456!!', null);
INSERT INTO `student` VALUES ('18382100279', '冉苗苗', 'Rm1996*', null);
INSERT INTO `student` VALUES ('163231000175', '靳壮壮', '!Jzz131', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('18382100139', '张红红', '630120825@QQ.com', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162711000921', '赵少康', '@1610Azsk', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231001139', '闫敏', '9BYM*y', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('162221000050', '单春雨', 'WZ3428787fm&', null);
INSERT INTO `student` VALUES ('18378100161', '康杰', 'MuMusmile0925!', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100118', '刘辰星', 'XIAObaitu0319**', null);
INSERT INTO `student` VALUES ('18382100294', '杜松光', '@Dsg521314', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('152121000564', '杨锋', 'Yf123*&', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000203', '王子音', 'Wzy@123', null);
INSERT INTO `student` VALUES ('162711000622', '史纪萱', 'SJx1990429*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231000852', '闫慧芬', 'Yhf163231000852*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100287', '金鹰志', 'Jyz620512%', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18382100073', '侯晓圆', 'Yy$13784388824', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('141361000845', '齐炳昌', 'QBCqbc123@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231001146', '孙璐', 'Sl1998@', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000117', '牛莉', 'Nl0521&&', null);
INSERT INTO `student` VALUES ('17382100372', '杨子源', '@YZYyzy123', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('18382100204', '张哲', 'Zz1609@', null);
INSERT INTO `student` VALUES ('17382100077', '李俊豪', 'Ljh123@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100140', '焦江倩', 'JJQjjq316@', null);
INSERT INTO `student` VALUES ('162231001406', '李晓飞', '5120.LI?dui', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('152221000120', '马子涵', 'Mzh1998@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('151661000528', '蒋淑娟', 'Jsj@1997', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18382100222', '安彩云', 'Ancaiyun950419*', null);
INSERT INTO `student` VALUES ('162711000550', '张玉英', 'Zyy@521', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100048', '李国栋', 'Lgd@891879', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231000259', '曹欢', '19980213Ch**', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('162711000561', '尤锦涛', '*1611Atao', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('162711000892', '赵晓铮', 'Zxz666*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('162151000064', '王璐玮', 'Aa1234**', null);
INSERT INTO `student` VALUES ('163231000648', '梁元', 'Ly19991214..&', null);
INSERT INTO `student` VALUES ('163231000655', '李佳', 'liJia*760913', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('162711000431', '孟雅莉', 'mengyali124MYL@', null);
INSERT INTO `student` VALUES ('163231000939', '张冰倩', 'Zbq98076*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('163231001219', '温延会', '@0219Wyh', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('141391000615', '高伟轩', 'Gwx*5921', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100095', '薛帅康', 'Nuo1999.@', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('151661000696', '牟灿', '12150645Mc*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18382100166', '郭青青', '@GUOqq7', null);
INSERT INTO `student` VALUES ('152221000136', '张嘉琪', 'Zjq03251781!', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('162711000185', '樊军', 'FJ0774fj@', null);
INSERT INTO `student` VALUES ('152001000515', '郑强', '1500651289@QQ.com', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231000246', '布淑倩', 'Aa1*bushuqian', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100137', '金旭', 'Jin@0529', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231000523', '冯小予', 'Fxyu*4', null);
INSERT INTO `student` VALUES ('18382100157', '李潘红', 'Lph8222!', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000920', '王艳霞', 'Lxk595*', null);
INSERT INTO `student` VALUES ('163221000037', '康金坍', 'ScAuC1130@kkk', null);
INSERT INTO `student` VALUES ('1623231000767', '焦娅柠', '@1610Ajyn', null);
INSERT INTO `student` VALUES ('162711000281', '古泽腾', 'Tity21@qq.com', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000918', '江琳琳', 'Jk*.1583510652', null);
INSERT INTO `student` VALUES ('163231000698', '尹耀旋', 'yyx1610A!', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000374', '王玮瑶', 'Wwy0106*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('162711000099', '姚子烜', 'Yzx*123', null);
INSERT INTO `student` VALUES ('151521000391', '宋梦磊', 'S*l12345', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('163231001212', '谭庆达', 'TQDtqd6*', null);
INSERT INTO `student` VALUES ('163231000427', '姬晓胜', '663866*Jxs', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('163231001207', '闫伟莲', 'Ywl0923@', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('17376100586', '韩笑', 'Hx1611@', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18382100094', '要慧勤', 'Hui810*', null);
INSERT INTO `student` VALUES ('151661000708', '刘琪', 'llU.*9951', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('17382100241', '周永强', 'As711029*', null);
INSERT INTO `student` VALUES ('162711000747', '耿增', 'gengzeng1611A@', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231000286', '牛军霞', 'Niujunxia321@', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231000756', '胡新玉', '@Hxy163', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('17382100219', '赵越', '2289956458@Qq.com', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('163231000699', '聂鹏', 'NploveGmm99*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163301000899', '吴鹏鹏', 'wUPENGJUN521!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000262', '苏旭', 'Su123*', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100054', '张惠娟', 'ZHJzhj704@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('163231000098', '刘庆芸', 'Lqq@521', null);
INSERT INTO `student` VALUES ('163231000915', '郭铭瑛', 'Gmy199826@', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('16321020614', '单寒', 'Sh19991006*', null);
INSERT INTO `student` VALUES ('17382100441', '王美悦', 'Wmy12*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100091', '王雯茂', 'Wwm9213!', null);
INSERT INTO `student` VALUES ('163231001061', '程静', '@cJ19980821', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18382100023', '张旭飞', 'Zxf@18335405041', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('162711000850', '种筱', 'Cx0709*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('163231001086', '郎玲玲', 'Ling217*', null);
INSERT INTO `student` VALUES ('18382100189', '李仁鹏', '@1610Alrp', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('17382100065', '张志祥', 'Zzx&&9824', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('162711000965', '王琴', 'Wq970223*', null);
INSERT INTO `student` VALUES ('163231000355', '王芳', 'Wf123*', null);
INSERT INTO `student` VALUES ('162711001040', '常津瑜', 'Zxy0221*', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('162711000630', '刘轲', 'LiuKe0327..*', null);
INSERT INTO `student` VALUES ('152121000418', '王琳', 'Wl123@123', null);
INSERT INTO `student` VALUES ('18382100243', '刘士军', 'Aa!11049356603', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('18382100175', '李鑫秋', 'Lxq0401@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('17382100068', '孟莹', '?Ying8023.', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('162711000252', '苗佳钰', 'KasuganoSora@1984148683.com', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163231000125', '张鑫', 'z1225736X*m', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('162711000353', '王乐康', 'Wlk2417*', null);
INSERT INTO `student` VALUES ('162711000762', '崔鸥', 'Co*2372081698', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('162711000935', '石旭', 'Sx123*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('16323100025', '程志', 'Cz*8229', null);
INSERT INTO `student` VALUES ('17382100325', '杨立波', 'yANG0212@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('17382100196', '宋嘉玮', 'Sjw0128*', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('162711000792', '杨婷婷', 'Yttt8*', null);
INSERT INTO `student` VALUES ('17382100341', '党会娟', 'Dang&3443', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('163231000454', '张晴', 'Zq5792589!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231001204', '王冰', 'WangBing0615@', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000884', '赵鑫雨', 'Cjy0821*', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('17382100443', '王泽健', 'Wz1@123456', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231000603', '刘新雨', 'LXYlxy99!!', null);
INSERT INTO `student` VALUES ('163231000536', '李晓晨', 'Se0412*', null);
INSERT INTO `student` VALUES ('17382100244', '梁鹏飞', '@LPFlpf1', null);
INSERT INTO `student` VALUES ('163231001230', '孙慧', '101218@Sh', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('162711000827', '王少辉', 'wSH09173051$', null);
INSERT INTO `student` VALUES ('162711000629', '师风鑫', 'SHIFENGXIN981019!s', null);
INSERT INTO `student` VALUES ('162711000104', '黄富娇', 'Hfj205368*', null);
INSERT INTO `student` VALUES ('163231000495', '丁思羽', 'Sy*963.', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231000415', '李伟', '@LW0917041x', null);
INSERT INTO `student` VALUES ('152001000514', '景建海', 'JINGjian1314@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('17382100403', '王君恩', '@Wje1200', null);
INSERT INTO `student` VALUES ('1627111000792', '杨婷婷', 'Yttt8*', null);
INSERT INTO `student` VALUES ('151661000762', '王孟', 'Wm159910?', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000677', '嗯呢', 'Zzm@976632', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163231000789', '刘慧芳', 'Lhh016*', null);
INSERT INTO `student` VALUES ('163231001166', '郭怡凯', '223Guo*', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('17382100329', '孙靓', 'Sl2002!', null);
INSERT INTO `student` VALUES ('18382100111', '秦柯', 'qXk@123520+', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231001173', '罗鹏莲', '@Pl1211', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('17382100396', '范国红', 'Fanguohong123!', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('151591000414', '冀占豪', 'Jz0107@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231000863', '闫佩云', 'SHinglike486!', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('17382100344', '张凯丽', 'Zkl@19970816', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100131', '倪克灿', 'NIke@0928', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100327', '徐龙威', 'Xlw520*..', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163301001796', '屈明汉', 'Qq!1654371764', null);
INSERT INTO `student` VALUES ('16521000042', '孙炳鑫', 'Tian1130!', null);
INSERT INTO `student` VALUES ('18382100326', '杨瑶瑶', 'Yy*123963', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100195', '郑雷', 'Zl1995*', null);
INSERT INTO `student` VALUES ('17382100090', '苏玉叶', 'Zs811812!', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('152221000268', '赵迪', 'Zd1000%', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163301000944', '杨晋', 'Yj327!', null);
INSERT INTO `student` VALUES ('17382100258', '王伶娟', '@Wlj955', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('152221000361', '肖臣', '07133921Xy*', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('18382100304', '荆涛', 'King2038692$', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100129', '陈天亮', 'JHwoaini131420#', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231000714', '张文龙', 'Zwl1218!', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('17382100398', '刘祥祥', '@21Lxx', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('16521000044', '啊就', 'Rasd@1', null);
INSERT INTO `student` VALUES ('18382100106', '张敏', 'Zm@520ljx', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('17382100200', '侯发星', 'Hfx951024*', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100029', '候姣姣', 'Hjj58&', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100112', '薛汾', 'Xue980311@', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100176', '张浩宇', 'Zhy130185@', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100012', '王书玲', 'Wmm20000129@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('16323100792', '李子璇', 'Lzx88@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162711000632', '许瑞', 'XUrui123!', null);
INSERT INTO `student` VALUES ('17382100377', '魏薇', 'Ww17382100377@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163221000025', '李越洋', 'Ly971130*', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('162711000710', '张贤', 'Zhangxian1012*', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100316', '党立强', 'Dd1023$', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100249', '吉胜楠', 'Aa123?', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100040', '马艺婷', 'Myt@Wjq@520', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('18382100217', '郝凌凯', '@Hlk2189860', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100103', '靳攀', 'Jinpan1996@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('18382100167', '赵浩宇', 'Zhy061900@', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('162221000332', '康根', '@Kanggen1996', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231000848', '孙一昊', 'Sun123,@', null);
INSERT INTO `student` VALUES ('151521000326', '付亚飞', 'FUyafei!0123', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163241000011', '段钟海', 'Dzh763784@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162231002340', '马亚辰', 'Ycp12!', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163231000479', '赵莹杰', '@Zyj1026', null);
INSERT INTO `student` VALUES ('163231000389', '吕媛', 'lY965836@', null);
INSERT INTO `student` VALUES ('162231001389', '高迪迪', 'Zxdyr6423649*', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100082', '周真真', '1999@Zz', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('17356100045', '孙小凝', 'As123@', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100263', '杨昕宇', 'Yxy13280358073!!', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('18382100223', '吴光宇', 'Wgy.4284100$', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163231000094', '王诗璇', 'WSXwsx123456@', null);
INSERT INTO `student` VALUES ('163231000159', '杨彩平', 'Ycp12!', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163231000819', '闻悦', 'Wenyue0813@', null);
INSERT INTO `student` VALUES ('18382100163', '韩晓爽', 'Hxs@1993', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('18382100193', '邓涢桐', 'Dengyuntong123!', null);
INSERT INTO `student` VALUES ('152221000145', '王欣月 ', 'Ww2*Ww', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100141', '王红婷', 'AAAa1!', null);
INSERT INTO `student` VALUES ('163231000373', '张伟杰', 'Zwj0525@dyd', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('162221000462', '陈沭江', '0218Csj@', null);
INSERT INTO `student` VALUES ('17382100469', '王用封', 'Wyf971124#', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('163231000908', '武辰淇', 'wcqWCQ111@', null);
INSERT INTO `student` VALUES ('18382100076', '景星萌', 'Jx1!123456789', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163231000825', '郭骁锐', 'Gxr163231000825!', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('16323100443', '孙鹏辉', '@Sun1012', null);
INSERT INTO `student` VALUES ('152221000160', '高雪佳', 'GXJgxj123@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('163231000887', '张翠丽', '57351EXO61zcl@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('17382100384', '王诗雨', 'woxihuanniA0@', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18382100108', '石龙', '@Sl176365633160.0', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100284', '焦旭洋', 'Jiaoxuyang520@', null);
INSERT INTO `student` VALUES ('18382100324', '韩磊', '$Hl426534', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('17382100007', '刘亚斌', 'Liu@940416', null);
INSERT INTO `student` VALUES ('163231000822', '史士洁', '1336853296@QQ.com', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('163231000336', '曹柯熠', '@CaoYi68619', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162221000431', '冯丹', 'AAaa11@@', null);
INSERT INTO `student` VALUES ('18382100260', '周凯', 'zhoukai@1611B', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('18382100283', '张颖', 'Zy11176625*', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163231000851', '张文秀', '@Zhang666', null);
INSERT INTO `student` VALUES ('163231000809', '王淑琴', 'Wsq1996@', null);
INSERT INTO `student` VALUES ('1663231000848', '孙一昊', 'Sun123!', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('17382100457', '乔卿振冬', 'Qdd19950920$', null);
INSERT INTO `student` VALUES ('163231000562', '孙瑜锋', '@SunYuFeng0918', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162711000547', '高彩鹏', 'Gaocaipeng521@', null);
INSERT INTO `student` VALUES ('162221000168', '马芸', 'My@970404', null);
INSERT INTO `student` VALUES ('162711000760', '孙佳', 'Sj199604@', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('17382100501', '王保强', 'Wbq@0903', null);
INSERT INTO `student` VALUES ('17382100463', '梁博文', 'Lbweng159357*', null);
INSERT INTO `student` VALUES ('17382100130', '马帅帅', 'Mss521+.@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100349', '郑王飞', '482013Exo?', null);
INSERT INTO `student` VALUES ('163231000184', '韩原', 'HY917721810@.com', null);
INSERT INTO `student` VALUES ('18382100329', '兰佳硕', 'lanjiaSHUO@1997', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163231000434', '张霞', '@Zx119111', null);
INSERT INTO `student` VALUES ('163231000631', '赵帅', 'ZSww1.*', null);
INSERT INTO `student` VALUES ('151591001740', '强曌', 'Qz521!', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231100006', '王卿松 ', 'Wqs02182714@', null);
INSERT INTO `student` VALUES ('18382100064', '吕方胜', 'Lfs565261799!', null);
INSERT INTO `student` VALUES ('163231000525', '张嫚嫚', 'Zmm0107@', null);
INSERT INTO `student` VALUES ('18382100052', '戚赛', '@WOaiwojia521', null);
INSERT INTO `student` VALUES ('162711000966', '武家媛', 'WUwu55%%', null);
INSERT INTO `student` VALUES ('18382100198', '夏昌文', 'Xia1971501#', null);
INSERT INTO `student` VALUES ('163231001090', '田益莎', 'Tian1996*', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('162711000828', '张尚攀', 'ZSp5*_', null);
INSERT INTO `student` VALUES ('163231000734', '张子瑞', 'ZZRqwe120@', null);
INSERT INTO `student` VALUES ('163231000371', '卫玮', 'WwSs0102*.', null);
INSERT INTO `student` VALUES ('163231000054', '程鑫', '@CX126x', null);
INSERT INTO `student` VALUES ('17382100406', '刘振宁', 'LLll11**', null);
INSERT INTO `student` VALUES ('17382100474', '周思丽', '@Zsl00', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('151991000858', '秦启贤', 'Qq980219!', null);
INSERT INTO `student` VALUES ('18382100252', '刘斌斌', 'Lbb0000#', null);
INSERT INTO `student` VALUES ('152121000306', '王高超', 'Ab1234@', null);
INSERT INTO `student` VALUES ('17382100425', '石鑫琪', 'SHIshixinqi1013%', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000296', '刘凯亮', 'Liu1998*', null);
INSERT INTO `student` VALUES ('163231000351', '陈婉莹', '1008Aa@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('162711000916', '高博仑', 'Gaobolun1904!', null);
INSERT INTO `student` VALUES ('163231000108', '马梦悦', 'Mm00&&', null);
INSERT INTO `student` VALUES ('18382100109', '刘敢', 'Lg0401^', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('17382100385	', '万呵呵', 'Whh1126@', null);
INSERT INTO `student` VALUES ('18382100297', '王朝晖', 'Wzh1314521@', null);
INSERT INTO `student` VALUES ('18382100288', '赵晓怡', 'Zhao0410@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162711000703', '乔惠', 'Qiaohui*0509', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('163231001295', '李姿静', 'Lzj123@', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('162711000186', '韩淑先', 'HSXhsx123!!!', null);
INSERT INTO `student` VALUES ('152121000028', '韩涛烽', 'Hh1@Hh1@', null);
INSERT INTO `student` VALUES ('18382100187', '钟元', 'Zhong1997$', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('16334100023', '孙睿', 'SUNrui@1221', null);
INSERT INTO `student` VALUES ('18382100031', '宋英杰', '!Syj18595802007', null);
INSERT INTO `student` VALUES ('163231000461', '房磊', 'FANGlei21*', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100093', '王振', 'zhixiang123A*', null);
INSERT INTO `student` VALUES ('17382100327', '黄雪', 'Hx1018*', null);
INSERT INTO `student` VALUES ('163221000007', '何智博', 'HZBqq123!', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100201', '李飞飞', 'Lff111*', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('17382100479', '原超宁', 'Ycn179897834@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('151561000188', '刘爽', 'Ls123%&', null);
INSERT INTO `student` VALUES ('18382100203', '李宛卿', '@LWQlwq18382100203', null);
INSERT INTO `student` VALUES ('163301001171', '王鹏', 'Wp19970817@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('162221000111', '程建业', 'Cjy1997@', null);
INSERT INTO `student` VALUES ('141391001035', '胡瑞杰', 'Hu@150310', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100250', '何苗苗', 'Hm6@233', null);
INSERT INTO `student` VALUES ('151561000105', '邢增辉', 'HYKxzh1@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000850', '崔莉莉', 'Jacksonyee980426@', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('18382100265', '韩若男', 'HANhan123@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000913', '杨艳', 'Yy521@', null);
INSERT INTO `student` VALUES ('18382100405', '丁鹏飞', 'Dpf1230.@', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('152121000629', '李鹏', 'Lp@123..', null);
INSERT INTO `student` VALUES ('18382100619', '孙豪浩', '1701A@shh', null);
INSERT INTO `student` VALUES ('16271100732', '陈倩', '@Cq0506', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('18382100172', '程鹏', 'Qq*995809742', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100006', '马俊杰', 'Mjj18382100006@', null);
INSERT INTO `student` VALUES ('163231000195', '申培培', 'Spp0423&', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('17382100459', '左怀攀', '701Az1@', null);
INSERT INTO `student` VALUES ('163231001088', '邢豆豆', 'SUNrui@1221', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100177', '高炎鑫', 'GAOgao123@', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('151661000744', '杨珊', 'Ys000!', null);
INSERT INTO `student` VALUES ('162711000492', '乔富', 'QIAOFUqiaofu??1233', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('162711000709', '乔亚茹', 'Qyr123&&', null);
INSERT INTO `student` VALUES ('17382100229', '高素芳', 'Gsf123&&', null);
INSERT INTO `student` VALUES ('162711000926', '杨丽娜', 'YLNyln123@', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100160', '赵子中', 'Zzz305379801@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18378100053', '杨洋', 'YANG2*yang', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100185', '弓哲媛', '492078251Gzy@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000428', '位贺', 'Wh@03291238', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('163231000099', '周晨芳', 'Zcf41#', null);
INSERT INTO `student` VALUES ('163231000317', '王兆颖', 'WZY123wzy&', null);
INSERT INTO `student` VALUES ('152121000304', '孙磊', '@Sl19951016', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100171', '赵宇森', 'Zys?5@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('19370100023', '杜磊', 'Du960213@', null);
INSERT INTO `student` VALUES ('163231000541', '丁文豪', 'Ding607914@', null);
INSERT INTO `student` VALUES ('15201100005190717', '辛小龙', '@Xxl000', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100227', '王银虎', 'Wyh666666@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100321', '王超', 'Qwe@003', null);
INSERT INTO `student` VALUES ('162711000405', '徐彪', 'Aa!19970326', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('162221000093', '刘鲍', 'Liubao521@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('152031000058', '韩明阳', 'Hmy123@', null);
INSERT INTO `student` VALUES ('162711000755', '窦晓楠', 'Dxn@515', null);
INSERT INTO `student` VALUES ('18382100590', '余娟娟', 'Yu51921$', null);
INSERT INTO `student` VALUES ('18382100267', '刘录', '@Qwe123', null);
INSERT INTO `student` VALUES ('163221000020', '郭家雨', 'Gjy991128@', null);
INSERT INTO `student` VALUES ('18389100320', '李晓同', '112566&Tong', null);
INSERT INTO `student` VALUES ('18382100622', '张鑫', 'zx241X*', null);
INSERT INTO `student` VALUES ('18382100602', '孔令芳', '@Klf19960606', null);
INSERT INTO `student` VALUES ('162711000865', '宋国兴', '@Songguoxing1', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('162711000915', '付饶', 'l@F315', null);
INSERT INTO `student` VALUES ('163231000314', '林晓寅', 'Lxy16@', null);
INSERT INTO `student` VALUES ('151461000021', '韩岳江', 'Woaini1314!', null);
INSERT INTO `student` VALUES ('18382100296', '李梦雅', '864534107@qq.COM', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('151551000083', '李明慧', 'Li@1502A0103', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100571', '杜晋', 'Dj1701@', null);
INSERT INTO `student` VALUES ('163231000116', '张瑞雪', 'Qwe@003', null);
INSERT INTO `student` VALUES ('18382700183', '豆皑旗', 'Dou918@', null);
INSERT INTO `student` VALUES ('18382100375', '赵张宝', 'Zzb02122139!', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100150', '刘垚文', '@Lliu1', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('151661000774', '李源', '@Qq090504', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100360', '单彩风', '@Scf822710', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100587', '韩娜', '09084123Hn@', null);
INSERT INTO `student` VALUES ('18382100246', '崔元泽', '271178790Aa$', null);
INSERT INTO `student` VALUES ('163231000272', '李保垒', 'Qwe@003', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('162711000749', '卢凯', 'Lukai@123', null);
INSERT INTO `student` VALUES ('152121000597', '李享', 'Diannao512!', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000022', '赵浩男', 'Zhn@981228', null);
INSERT INTO `student` VALUES ('162711000885', '全李帆', 'Fanfan@981004', null);
INSERT INTO `student` VALUES ('163231001012', '柴若男', 'Crn0913?', null);
INSERT INTO `student` VALUES ('163231000133', '刘文改', '0525@Liu', null);
INSERT INTO `student` VALUES ('162711000963', '郭喜凤', 'GXFgxf1205@', null);
INSERT INTO `student` VALUES ('18382100038', '王红英', '1qaz!QAZ', null);
INSERT INTO `student` VALUES ('163231000038', '董竞泽', 'Dongjingze0325@', null);
INSERT INTO `student` VALUES ('162711000548', '任玥宁', 'Ryn199764!', null);
INSERT INTO `student` VALUES ('151531000142', '雷津钞', 'Zhf2427@Ljc..', null);
INSERT INTO `student` VALUES ('162711000962', '张雷', 'Zhanglei666!', null);
INSERT INTO `student` VALUES ('1627110000954', '徐赢', 'Aa1!15135476469', null);
INSERT INTO `student` VALUES ('163231000165', '郝金萍', 'Hjp980326?', null);
INSERT INTO `student` VALUES ('152121000300', '王庠', 'WX970111wx@', 'mqz5t-dhqsqk-lz265l-qui8tb');
INSERT INTO `student` VALUES ('151601000334', '何运正', 'Heyunzheng123@', null);
INSERT INTO `student` VALUES ('163231000149', '朱彦睿', 'Yr885640?', null);
INSERT INTO `student` VALUES ('163231000214', '张方云', 'Zjy324@', null);
INSERT INTO `student` VALUES ('163231000972', '高雅楠', '961112Gyn*', null);
INSERT INTO `student` VALUES ('162231001313', '刘中保', 'Lzb@123', null);
INSERT INTO `student` VALUES ('152121000311', '王胜旋', '123456Wsx!', null);
INSERT INTO `student` VALUES ('162221000142', '崔淑娴', 'Xiaoxian2?', null);
INSERT INTO `student` VALUES ('162711000376', '赵海江', 'Zhaohaijiang666!', null);
INSERT INTO `student` VALUES ('17382100456', '刘莹', 'Ly828@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('151591001273', '吴建', 'wu0805JIAN$', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18382100512', '郝赟赟', 'Hyy986265417@', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100049', '王宏平', '971223Whp!', null);
INSERT INTO `student` VALUES ('18382100213', '原文宜', 'Ywy990713!', null);
INSERT INTO `student` VALUES ('163231000673', '胡雪阳', 'HXYhxy00@', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('17382100487', '樊国庆', 'Fz1004$', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100307', '何进', 'HJin1121!', null);
INSERT INTO `student` VALUES ('18382100371', '叶文程', 'qQ1!486255', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES (' 18382100405', '丁鹏飞', 'Dpf1230.@', null);
INSERT INTO `student` VALUES ('17382100199', '陈家岐', 'Cjq914?', null);
INSERT INTO `student` VALUES ('18382100154', '王倩', '@Wq19930609', null);
INSERT INTO `student` VALUES ('162711001014', '沈丽丽', '$And12', null);
INSERT INTO `student` VALUES ('163231000136', '郭丽雯', 'Gl0528?', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('162711000671', '郭晟', 'Aming@0812', null);
INSERT INTO `student` VALUES ('1838210272', '薛艳玲', 'Xue7024?', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100352', '唐小彬', 'Tb@0208', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100428', '王昱鑫', 'Wyx8714@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100300', '王博', 'Txh**963.', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100466', '李晓明', 'Xm07060627!', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100426', '曹品', 'Leslie&0912', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100120', '马进凯', '@Mjk1483362775', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100234', '张家兴', 'Zjx659431@', null);
INSERT INTO `student` VALUES ('18382100381', '王贞尧', 'Wzy0202$', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100411', '陈永坤', 'Chyk131525&', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('163231000403', '刘梦杰', 'Lmj@0928', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100415', '张婉莹', 'Zwy962503@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('163301002285', '肖沛林', 'Xpl10@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100439', '赵思荣', '2698926@Ly', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100471', '刘子盟', 'Ee527832@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('163231000021', '郭雅静', 'Gyj@123456', null);
INSERT INTO `student` VALUES ('163231100305', '张宝特', 'Te123456&', null);
INSERT INTO `student` VALUES ('163321001305', '张宝特', 'Te123456&', null);
INSERT INTO `student` VALUES ('17382100288', '李政帅', 'LZSlzs123@', null);
INSERT INTO `student` VALUES ('163231000600', '赵竹苗', 'Zzm00@', null);
INSERT INTO `student` VALUES ('18382100199', '张欢', '5561854qQ@', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163231000487', '李新宇', '1612A@lxy', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100933', '韩志刚', '1612A@hzg', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163254000882', '孔令汝', '1612a@KLR', null);
INSERT INTO `student` VALUES ('17381100231', '李想', 'Lx3344?', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('18382100063', '杨晨', 'Yc1224@', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163231001062', '潘德平', 'Pd12345&', null);
INSERT INTO `student` VALUES ('152221000200', '王浩', 'Wanghao@520', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100425', '张猛', 'Zh1@123', null);
INSERT INTO `student` VALUES ('163231000953', '董明宇', 'Dongmingyu123@', null);
INSERT INTO `student` VALUES ('163231000341', '方格士', 'Fgs&0319', null);
INSERT INTO `student` VALUES ('18382100225', '杨超', 'Yang2980680@', null);
INSERT INTO `student` VALUES ('152221000014', '刘伟杰', 'Ll1701??', null);
INSERT INTO `student` VALUES ('163231000375', '兰剑剑', 'Lj0321**', null);
INSERT INTO `student` VALUES ('18382100332', '张宇杰', '@1242380537qq.COM', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000026', '冯少坤', '@Asd1001010010', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100320', '李雪尧', '$aA8971178', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100420', '杨质瑞', '523293511@QQ.com', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000808', '张慧', 'Zhanghui423!', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000727', '冯琳娜', 'Alina1207&', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100156', '付琳琳', 'Qx950209@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('151661000691', '杨鹏程', 'ABCabc123$', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('18382100142', '刘嘉鹏·', 'Ljp142@', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000027', '吴俊威', 'Ww!16323', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('163231000014', '李宁', 'A@s12.21', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100527', '胡芮宾', 'Hu2401648065@', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('17382100413', '张磊', 'Zl1701b@', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('162711000776', '马爱智', 'maZ521@', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100043', '田晓岚', 'Tx!123', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('163231001305', '张宝特', 'Te123456?', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100435', '韩金洪', '1409274586@Qq', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('160231001230', '孙慧', 'Sh10121442@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('162231000042', '王聪慧', 'Wang*176', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('163231001321', '申丹丹', 'QQqq@2898604625', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100479', '李向阳', 'Njx11170?', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100389', '王霞', 'xiaG0101@', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18381100574', '邢长江', 'Xcj123!00', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('19370100039', '原育英', 'QQqq@936464896', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100258', '张永琦', 'Zyq12276519&', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100386', '赵立莹', 'Zhao0648@', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100331', '张鸿飞', 'Zhf270314!', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100335', '常铄', '$Chang123', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100950', '武津向', '!1Qq123456', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100255', '蔡丽明', 'Cai121&&', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100387', '桑荣荣', 'Srr990823...@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100490', '金容旭', 'Jrx720328@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100525', '霍邓心', 'Aa@10133524', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100463', '秦瑶瑶', '@Qyy980514', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100161', '张淼', 'ZM8281c&', 'rs7mlk-5wcsf7-w55rr9-s23ltds');
INSERT INTO `student` VALUES ('162601000144', '王子龙', 'Wang1997*', 'j4pro7-8fe63v-f7dhkk-uuj2or');
INSERT INTO `student` VALUES ('163231000123', '王启超', 'Ww1?1208', null);
INSERT INTO `student` VALUES ('16334100090', '董晨倩', 'Dcq123$', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('162711000838', '候雅坤', 'Hyk0818?', '');
INSERT INTO `student` VALUES ('163231000923', '张悦', 'Zy94264!', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('19370100016', '刘建建', 'Aa123.!', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100021', '曹宝', '@Caobao369369', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('16331100002', '邢恒瑞', 'Xinghengrui0@', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100372', '徐国鑫', 'Xu@315895238', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('17382100472', '闫强', 'Yq981022@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('162711000996', '王雅欣', 'Wang1*', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100475', '高勇钧', 'Ning0816@', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('18382100378', '李伟泽', 'Liweize@521', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('16323100852', '闫慧芬', '*163231000852Yhf', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('18382100070', '武绩峰', '@Wu1314', 'jtgxii-d2mc-5jcojq-px8uoa');
INSERT INTO `student` VALUES ('162711000826', '王少辉', 'Wsh917!', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('1838210005', '张惠娟', 'ZHJzhj704@', 'xoqxd-807vj9-z2r7k-2hcdo');
INSERT INTO `student` VALUES ('162231000047', '王聪慧', 'Wang*176', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100104', '张勇勇', 'Zyy66*', null);
INSERT INTO `student` VALUES ('18382100179', '冯海霞', 'Fhx731623*', null);
INSERT INTO `student` VALUES ('18382100635', '张梦夏', 'Zmx618.!', null);
INSERT INTO `student` VALUES ('18382100272', '薛艳玲', 'Xue7024?', 'we0eya-r2td2b-2h4yhg-ggxp1vf');
INSERT INTO `student` VALUES ('163231001215', '胡海硕', 'Hs1112*', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('18382100113', '王瑾深', '1qaz!QAZ', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('163231000768', '肖玉凤', 'Xyf@1329896242', 'ef5vzf-mk31ka-3ltqao-3ikaf7');
INSERT INTO `student` VALUES ('163231000614', '单寒', 'Sh19991006*', 'r4ksz-uekje5-pu3b4-jqwzc9');
INSERT INTO `student` VALUES ('18381100253', '张克', 'Zk1992/*-+', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('18381100251', '张克', 'Zk1992/*-+', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('151991000301', '李硕', 'Li991029*', 'joyqt9-gyxsa8-fif6c-j12o0k');
INSERT INTO `student` VALUES ('152221000305', '王志宇', 'A1234567?a', 'hg9pz-qxoiw2-8hgd8-bmtr5');
INSERT INTO `student` VALUES ('17382100045', '孙少娜', 'Wohenhao1107@', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('18382100295', '杜小万', 'duxiaowaN123456*', 'bx4ac-o7304f-xl8k2r-7fco1d');
INSERT INTO `student` VALUES ('16323100336', '曹柯熠', '@CaoYi68619', 'tjdbk9-r8dbn8-4wsck-c7akdb');
INSERT INTO `student` VALUES ('123456789', '屈明汉', 'Qq!1654371764', 'j4pro7-8fe63v-f7dhkk-uuj2or');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_id` varchar(255) NOT NULL DEFAULT '',
  `subject_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('fqtktr-1lq5u', 'javaScript上');
INSERT INTO `subject` VALUES ('wl5yk-38c0g', 'javaScript下');
INSERT INTO `subject` VALUES ('8tl7os-r49tld', '模块化开发');
INSERT INTO `subject` VALUES ('1ux00o6-2xbj5i', '移动端开发');
INSERT INTO `subject` VALUES ('4pu32-vs796l', 'node基础');
INSERT INTO `subject` VALUES ('1psw2b-cy7o07', '组件化开发(vue)');
INSERT INTO `subject` VALUES ('fyu3ln-azjkie', '渐进式开发(react)');
INSERT INTO `subject` VALUES ('94sjh6-lnlxe', '项目实战');
INSERT INTO `subject` VALUES ('k1gvd4-8lrx8f', 'javaScript高级');
INSERT INTO `subject` VALUES ('u3ix15-dd6md', 'node高级');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `user_name` varchar(255) DEFAULT NULL,
  `user_pwd` varchar(255) DEFAULT NULL,
  `identity_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('tq5yea-wxnv0k', 'zhaoxiaoru', '10eea2ee3ad66731d1dbc283ddfca3bd94d6a5e7ec78b0e8fe0126d7f505b718', 'uf81yn-hv8uvv');
INSERT INTO `user` VALUES ('kqpvys-hpzkdt', 'liuyu', 'eb9d5a1d7b1ddeb95b63ca05e371460e0b7aa75a6f64bc0a1c6398da61cd1511', 'uf81yn-hv8uvv');
INSERT INTO `user` VALUES ('axg8t2-oroeja', 'w916peach', '00293b6c135e0b2476907a02f8fcd1c407bb2fce4d9e359ca1a805fdea590386', '63no9p-8y0k4');
INSERT INTO `user` VALUES ('qlgjry-9rwvb', 'yihang', '5b46a84eb0eec0a3eea2d5977dca7269f18265dabf76182204291f7f2f93cbc3', 'uf81yn-hv8uvv');
INSERT INTO `user` VALUES ('ypay2t-7uxsd', 'dingshaoshan', 'cc41634ea8c8acf9dea97bc0808be0091030f44edbf6192d5890c9c3e051ee78', 'uf81yn-hv8uvv');
INSERT INTO `user` VALUES ('w6l6n-cbvl6s', 'chenmanjie', 'aaf2aa719b9f34058f47804f896a521c43424483b575546ffb306526ba107b92', 'uf81yn-hv8uvv');
INSERT INTO `user` VALUES ('bsz88g-071r5', 'renyuliang', '32042b23ee00e9666c562a242308186d9270d4b4b5394578d06e66c33724377f', 'uf81yn-hv8uvv');
INSERT INTO `user` VALUES ('9a22l-wj1kmf', 'cuidongcai', 'fd72764421b36fd9aa09787937327ab448699b7171ccab5006a7402b02a21579', 'zi0gu7-v7dy08');
INSERT INTO `user` VALUES ('fdjfr-msxp8a', 'heinan', 'ed8dbfadaa41d0877f9566d63094b8903d9cb5faf64fe38ed938eec3689c0799', '63no9p-8y0k4');

-- ----------------------------
-- Table structure for view_authority
-- ----------------------------
DROP TABLE IF EXISTS `view_authority`;
CREATE TABLE `view_authority` (
  `view_authority_id` varchar(255) NOT NULL DEFAULT '',
  `view_authority_text` varchar(255) DEFAULT NULL,
  `view_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`view_authority_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of view_authority
-- ----------------------------
INSERT INTO `view_authority` VALUES ('r50r9t-1p1kbm', '登录', 'login');
INSERT INTO `view_authority` VALUES ('8olznh-943zt', '主界面', 'main');
INSERT INTO `view_authority` VALUES ('4pvvb3-h5kzg', '添加试题', 'main-addQuestions');
INSERT INTO `view_authority` VALUES ('vnpojq-tisgu', '试题分类', 'main-questionsType');
INSERT INTO `view_authority` VALUES ('xpz8cf-xoyd7n', '查看试题', 'main-watchQuestions');
INSERT INTO `view_authority` VALUES ('qcrhh-k0tvh', '添加用户', 'main-addUser');
INSERT INTO `view_authority` VALUES ('o4xsrn-5heg27', '用户展示', 'main-showUser');
INSERT INTO `view_authority` VALUES ('1orauc-piu6gm', '添加考试', 'main-addExam');
INSERT INTO `view_authority` VALUES ('43t70e-pk8ylk', '添加菜单', 'main-menu');
INSERT INTO `view_authority` VALUES ('0a1llo-a1vt2', '编辑试题', 'main-editQuestions');
INSERT INTO `view_authority` VALUES ('n083ob-u54cop', '试题详情', 'main-questionsDetail');
INSERT INTO `view_authority` VALUES ('2iilq2-n3c8qi', '班级管理', 'main-grade');
INSERT INTO `view_authority` VALUES ('xpnrf-levvc', '学生管理', 'main-student');
INSERT INTO `view_authority` VALUES ('dow3c8-tb0lid', '教室管理', 'main-room');
INSERT INTO `view_authority` VALUES ('04d1m-605j25', '试卷列表', 'main-examList');
INSERT INTO `view_authority` VALUES ('fmdrhm-xfnmxk', '创建试卷', 'main-examEdit');
INSERT INTO `view_authority` VALUES ('gjfnm-0gawb', '试卷详情', 'main-examDetail');
INSERT INTO `view_authority` VALUES ('tkf3zb-nbgx8', '阅卷', 'main-examinationPapers');
INSERT INTO `view_authority` VALUES ('sspzw-6pwguo', '批卷班级', 'main-examPaperClassList');
INSERT INTO `view_authority` VALUES ('qlhzjb-gcr08d', '待批试卷', 'main-examPaperClassmate');
