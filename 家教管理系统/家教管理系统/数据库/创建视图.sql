select * from t_teacher
desc t_teacher
create view  showteacher as 
	select t.id,t.teacher_name,t.gender,t.birthday,CONCAT(a.province,'-',a.city),t.wchat,t.address,e.education,t.school,i.identity,t.major,d.district,t.teach_time,t.salary,tt.teachmethod,t.certifications,t.teach_year,t.experience,t.introduce from t_teacher as t inner join t_area as a on t.province=a.id inner join t_education as e on t.highest_education_id=e.id inner join t_identity as i on i.id=t.identity_id inner join t_district as d on d.id=t.district_id
	inner join t_teachmethod as tt on tt.id=t.teach_method_id
	
	select * from showteacher where teacher_name like %s
	
	
	select id, student_name,gender,address,wchat from t_student where student_name like %s and address like %s 
	update t_student set student_name='李丽',gender='女',address='船营路23号',wchat='lili' where id=2
	
	select * from t_fastorderteacher
	desc t_fastorderteacher
	create view showstudent as 
	select f.id,s.student_name,c.course_name,f.study_time,d.district, f.address,f.contacts,f.phone,f.wchat,f.study,f.teacher_gender,f.salary,i.identity,tt.teachmethod,f.teach_require,g.gradename,f.stu_gender from t_fastorderteacher as f inner join t_student as s on s.id=f.student_id inner join t_course as c on c.id=f.course_id inner join t_district as d on d.id=f.district_id inner join t_identity as i on i.id=f.identity_id inner join t_teachmethod as tt on tt.id=f.teach_method_id inner join t_grade as g on g.id=f.grade_id
	
	select * from showstudent where student_name like %s
	
	desc showstudent
	select * from t_fastorderteacher
	update t_fastorderteacher set student_id=2 where id=3
	create view showeval2 as 
	select e.id, s.student_name,t.teacher_name,e.content from t_evaluation as e inner join t_student as s on e.student_id =s.id inner join t_teacher as t on t.id=e.teacher_id
	select * from showeval2 where student_name like %s
	delete from showeval2


	