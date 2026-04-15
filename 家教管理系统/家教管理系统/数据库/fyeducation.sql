# 创建教员身份表
create table t_identity(
	id int(4) primary key auto_increment,
	identity varchar(20)
);
#插入测试数据
insert into t_identity(identity) values('大学生');
insert into t_identity(identity) values('专职教师');
select * from t_identity;

# 创建学历表
create table t_education(
	id int(4) primary key auto_increment,
	education varchar(20)
);
insert into t_education (education) values ('大专');
insert into t_education (education) values ('本科');
insert into t_education (education) values ('硕士');
insert into t_education (education) values ('博士');
select * from t_education;

# 创建省份区域表
create table t_area(
	id int(4) primary key auto_increment,
	province varchar(20),
	city varchar(20)
);
insert into t_area(province,city)values ('吉林省','吉林市');
select * from t_area;

# 创建授课区域表
create table t_district(
	id int(4) primary key auto_increment,
	district varchar(20)
);
insert into t_district(district) values ('昌邑区');
insert into t_district(district) values ('龙潭区');
insert into t_district(district) values ('船营区');
insert into t_district(district) values ('丰满区');
select * from  t_district;

# 创建辅导方式表
create table t_teachmethod(
		id int(4) primary key auto_increment,
		teachmethod varchar(20)
);
insert into t_teachmethod(teachmethod)values ('学员上门');
insert into t_teachmethod(teachmethod)values ('教员上门');
select * from t_teachmethod;

# 创建年级表
create table t_grade(
	id int(4) primary key auto_increment,
	gradename varchar(20)
);
insert into t_grade(gradename) values ('一年级');
insert into t_grade(gradename) values ('二年级');
insert into t_grade(gradename) values ('三年级');
insert into t_grade(gradename) values ('四年级');
select * from t_grade;
# 创建课程表
create table t_course(
	id int(4) primary key auto_increment,
	course_name varchar(20),
	grade_id int(4) # 外键 
);
# 添加主外键关系
alter table t_course add CONSTRAINT fk_t_course_grade_id foreign key (grade_id) REFERENCES t_grade(id) # 主表是t_grade 
#添加测试数据
insert into t_course (course_name,grade_id) values ('数学',1);
insert into t_course (course_name,grade_id) values ('语文',1);
insert into t_course (course_name,grade_id) values ('英语',1);
insert into t_course (course_name,grade_id) values ('数学',2);
insert into t_course (course_name,grade_id) values ('语文',2);
insert into t_course (course_name,grade_id) values ('英语',2);
select * from t_course;

# 创建教员表
create table t_teacher(
		id int(4) primary key auto_increment,
		teacher_name varchar(20), # 教员姓名
		gender varchar(2) ,# 性别
		birthday datetime ,# 出生日期
		province int(4) ,# 外键 ， 省区域表
		wchat varchar(20),# 微信
		address varchar(100) ,# 住址
		highest_education_id int(4),# 最高学历，外键
		school varchar(20) ,# 毕业院校
		identity_id int(4),# 外键，教员身份
		major varchar(20),# 专业
		district_id int(4),# 外键，授课区域
		teach_time varchar(20) ,# 上课时间
	  salary decimal(5,2), #期望薪酬
		teach_method_id int(4),# 外键 ，
		certifications varchar(20),# 所获证书
		teach_year int(4) ,# 教龄
		experience varchar(20),#授课经验
		introduce varchar(100),#自我介绍
		username varchar(20),# 注册时的用户名
		pwd varchar(20),# 注册时的密码
		photo varchar(100)# 照片的路径
 
);
# 添加主外键关系
alter table t_teacher add CONSTRAINT fk_t_teacher_province foreign key (province) REFERENCES t_area(id);

alter table t_teacher add CONSTRAINT fk_t_teacher_highest_education_id foreign key (highest_education_id) REFERENCES t_education(id);

alter table t_teacher add CONSTRAINT fk_t_teacher_identity_id foreign key (identity_id) REFERENCES t_identity(id);

alter table t_teacher add CONSTRAINT fk_t_teacher_district_id foreign key (district_id) REFERENCES t_district(id);

alter table t_teacher add CONSTRAINT fk_t_teacher_teach_method_id foreign key (teach_method_id) REFERENCES t_teachmethod(id);

# 添加测试数据

desc t_teacher; # 查看表中的字段
insert into t_teacher(teacher_name,gender,birthday,province,wchat,address,highest_education_id,school,identity_id,major,district_id,teach_time,salary,teach_method_id,certifications,teach_year,experience,introduce,username,pwd,photo
)values('张三','女','1982-9-26',1,'zhangsan','吉林大街22号',1,'吉林大学',1,'汉语言文学',1,'星期三 上午',80,1,'无',4,'教学经验丰富','','zhangsan','zhangsan','d:/data/image/zhangsan.jpg');

insert into t_teacher(teacher_name,gender,birthday,province,wchat,address,highest_education_id,school,identity_id,major,district_id,teach_time,salary,teach_method_id,certifications,teach_year,experience,introduce,username,pwd,photo
)values('李四','男','1989-10-1',1,'lisi','吉林大街24号',1,'东北师范大学',1,'应用数学',1,'星期四 上午',80,1,'无',3,'教学经验丰富','','lisi','lisi','d:/data/image/lisi.jpg');
select * from t_teacher;