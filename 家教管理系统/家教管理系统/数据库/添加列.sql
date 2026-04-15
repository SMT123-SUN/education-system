desc t_fastorderteacher
ALTER TABLE t_fastorderteacher ADD COLUMN stu_gender VARCHAR(2) NOT NULL;
ALTER TABLE t_fastorderteacher ADD COLUMN grade_id int(4) NOT NULL;
alter table t_fastorderteacher add CONSTRAINT fk_t_fastorderteacher_grade_id foreign key (grade_id) REFERENCES t_grade(id)

select * from t_fastorderteacher
ALTER TABLE t_fastorderteacher DROP COLUMN stu_gender;
insert into t_fastorderteacher(student_id,course_id,study_time,district_id,address,contacts,phone,wchat,study,teacher_gender,salary,identity_id,teach_method_id,teach_require,stu_gender,gradeid)values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)

select if from t_identity where identity='大学生'
select * from t_course;
select id from t_teachmethod where teachmethod=%s

select * from t_evaluation
desc t_teacher
select t.id,teacher_name,gender,a.province,a.city,wchat,e.education,t.school,major,t.teach_time,salary,teach_year,photo from t_teacher as t inner join t_education as e  on  t.highest_education_id =e.id inner join t_area as a on a.id=t.province
update t_teacher set photo='D:/pythonpro/2025-1-4/images/wangwu.png' where id=2

select * from t_grade;
insert into t_order(student_id,teacher_id) values (%s,%s)
select o.student_id,s.wchat as stu_wchat,edu.education,tea.school ,tea.major,tea.teach_time,tea.wchat as teacher_wchat,fas.contacts,fas.phone,c.course_name,gra.gradename from t_student as s inner join t_order as o
on s.id=o.student_id inner join t_teacher as tea on tea.id=o.teacher_id inner join t_education as edu on edu.id=tea.highest_education_id inner join t_fastorderteacher as fas on fas.student_id=s.id inner join t_course  as c on c.id=fas.course_id inner join t_grade as gra on gra.id =fas.grade_id

# 创建视图
CREATE VIEW orderinfo AS

select o.student_id,s.wchat as stu_wchat,edu.education,tea.school ,tea.major,tea.teach_time,tea.wchat as teacher_wchat,fas.contacts,fas.phone,c.course_name,gra.gradename from t_student as s inner join t_order as o
on s.id=o.student_id inner join t_teacher as tea on tea.id=o.teacher_id inner join t_education as edu on edu.id=tea.highest_education_id inner join t_fastorderteacher as fas on fas.student_id=s.id inner join t_course  as c on c.id=fas.course_id inner join t_grade as gra on gra.id =fas.grade_id

select * from orderinfo
