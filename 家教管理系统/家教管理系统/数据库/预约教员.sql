desc t_teacher;
select * from t_education
# 如何创建视图吗?
drop view vteacher
create view vteacher as 
	select t.id,t.teacher_name, t.gender,a.province,a.city ,t.wchat,e.education,t.school,t.major,t.teach_time,t.salary,t.teach_year,t.photo from t_teacher as t inner join t_area as a on t.province=a.id inner join t_education as e on t.highest_education_id=e.id 
	
	
	
select * from vteacher



select * from t_order;
insert into t_order (student_id,teacher_id)values (%s,%s)