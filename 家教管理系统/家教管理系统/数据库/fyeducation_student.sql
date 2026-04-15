# 创建学生表
create table t_student(
	id int(4)primary key auto_increment,
	student_name varchar(20), # 学生姓名
	login_name varchar(20),
	login_pwd varchar(20),
	gender varchar(2),
	address varchar(100),
	wchat varchar(20)
);
insert into t_student(student_name,login_name,login_pwd,gender,address,wchat)values ('李丽','lili','lili','女','船营区22号','lili');
select * from t_student;
# 创建评价表
create table t_evaluation(
	id int(4)primary key auto_increment,
	student_id int(4),  #外键
	teacher_id int(4),  # 外键，关联的是讲师表
	content varchar(200) # 评价内容
);

#添加外键
alter table t_evaluation add CONSTRAINT fk_t_evaluation_student_id foreign key (student_id) REFERENCES t_student(id);

alter table t_evaluation add CONSTRAINT fk_t_evaluation_teacher_id foreign key (teacher_id) REFERENCES t_teacher(id);

# 添加测试数据
insert into t_evaluation(student_id,teacher_id,content)values (1,2,'老师讲的非常好，一听就懂');
select * from t_teacher
select * from t_evaluation
# 发布 需求表
create table t_fastorderteacher(
	id int(4) primary key auto_increment,
	student_id int(4),
	course_id int(4),
	study_time varchar(20),
	district_id int(4),
	address varchar(100),
	contacts varchar(20),# 联系人
	phone varchar(11),
	wchat varchar(20),
	study varchar(100),# 学习状况
	teacher_gender varchar(2),
	salary decimal(5,2),
	identity_id int(4),
	teach_method_id int(4),
	teach_require varchar(200)

);
# 五个外键
alter table t_fastorderteacher add constraint fk_t_fastorderteacher_student_id foreign key (student_id) REFERENCES t_student(id);

alter table t_fastorderteacher add constraint fk_t_fastorderteacher_course_id foreign key (course_id) REFERENCES t_course(id);

# 
alter table t_fastorderteacher add constraint fk_t_fastorderteacher_district_id foreign key (district_id) REFERENCES t_district(id);

alter table t_fastorderteacher add constraint fk_t_fastorderteacher_identity_id foreign key (identity_id) REFERENCES t_identity(id);

alter table t_fastorderteacher add constraint fk_t_fastorderteacher_teach_method_id foreign key (teach_method_id) REFERENCES t_teachmethod(id);
# 添加测试数据
desc t_fastorderteacher
insert into t_fastorderteacher(student_id,course_id,study_time,district_id,address,contacts,phone,wchat,study,teacher_gender,salary,identity_id,teach_method_id,teach_require)values(1,1,'星期一 上午',1,'昌邑区22号','王小丽','13112345698','wxl','非常糟糕','女',80,1,1,'无要求，越严厉越好');
select * from t_fastorderteacher;

# 订单表
create table t_order(
	id int(4) primary key auto_increment,
	student_id int(4),
	teacher_id int(4)
);
alter table t_order add CONSTRAINT fk_t_order_student_id foreign key (student_id) REFERENCES t_student(id)

alter table t_order add CONSTRAINT fk_t_order_teacher_id foreign key (teacher_id) REFERENCES t_teacher(id)
#添加测试数据
insert into t_order(student_id,teacher_id) values (1,1)
select * from t_order;






