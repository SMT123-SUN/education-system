create table t_admin(
	id int(4) primary key auto_increment,
	admin_name varchar(20),
	admin_pwd varchar(20)
);
insert into t_admin(admin_name,admin_pwd) values ('ysj','ysj');
select * from t_admin;