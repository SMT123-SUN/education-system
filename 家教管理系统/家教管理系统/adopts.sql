create table admins(
	id int(4) primary key auto_increment,
	adminname varchar(20),
	adminpwd varchar(20),
	realname varchar(20),
	telphone varchar(11),
	email varchar(100),
	birthday date,
	sex varchar(2),
	pic varchar(100),
	remark varchar(100)
);
insert into admins (id,adminname,adminpwd,realname,telphone,email,birthday,sex,pic)values (1,'ysj','ysj','杨淑娟','18600605786','ysj@126.com','1998-9-9','女','./image/cat1.png')
select * from admins
select id from admins where adminname=%s and adminpwd=%s

update admins set adminname=%s,adminpwd=%s,realname=%s,telphone=%s,email=%s,birthday=%s,sex=%s,pic=%s,remark=%s where id=%s
drop table users;
# 创建用户表
create table users(
	id int(4) primary key auto_increment,
	username varchar(20),
	userpwd varchar(20),
	sex varchar(2),
	age int (4),
	telphone varchar(11),
	email varchar(100),
	address varchar(100),
	pic varchar(100),
	state int(4)

);
select * from users;
insert into users(username,userpwd,sex,age,telphone,email,address,pic,state)values (%s,%s,%s,%s,%s,%s,%s,%s,%s) #
select id,username,sex,age,telphone,address,state
from users where username like %s;

insert into users(username,userpwd,sex,age,telphone,email,address,pic,state)values ('lisi','1234','男',20,'18623654789','lisi@126.com','深圳路22号','./image/cat1.png',0) 
select username,userpwd,sex,age,telphone,email,address,pic,state from users where id=1
update  users set sex='女'where id=3
update users set username=%s,userpwd=%s,sex=%s,age=%s,telphone=%s,email=%s,address=%s,pic=%s,state=%s where id=%s

# 创建宠物表
create table pet(
	id int(4) primary key auto_increment,
	petname varchar(20),
	pettype varchar(20),
	sex varchar(4),
	birthday date,
	pic varchar(100),
	state int(4),
	remark varchar(100)
);
select * from pet;
insert into pet (petname,pettype,sex,birthday,pic,state)values ('kitty5','波斯猫','雄性','2024-1-10','./image/bosicat.png',0)
# 0未被领养，1被申请领养2已经被领养
insert into pet (petname,pettype,sex,birthday,pic,state)values ('keni5','短腿猫','雄性','2025-1-10','./image/bosicat.png',0)
select petname,pettype,sex,birthday,pic,state,remark from pet where id=%s

insert into pet (petname,pettype,sex,birthday,pic,state,remark)values (%s,%s,%s,%s,%s,%s,%s)

update pet set petname=%s,pettype=%s,sex=%s,birthday=%s,pic=%s,state=%s,remark=%s where id=%s

delete from pet where id=%s

create table adoptanimal(
	id int (4) primary key auto_increment,
	userid int(4),
	petid int(4),
	adopttime date,
	state int(4)  # 0不同意1，审核，2同意

);
select * from adoptanimal
# 添加外键约束
ALTER TABLE adoptanimal
ADD CONSTRAINT adoptanimal_userid FOREIGN KEY (userid) REFERENCES users(id)
ON DELETE SET NULL

ALTER TABLE adoptanimal
ADD CONSTRAINT adoptanimal_petid FOREIGN KEY (petid) REFERENCES pet(id)
ON DELETE SET NULL
insert into adoptanimal(userid,petid,adopttime,state)values(1,1,'2024-1-5',1);
insert into adoptanimal(userid,petid,adopttime,state)values(2,2,'2024-1-6',0);
insert into adoptanimal(userid,petid,adopttime,state)values(2,3,'2024-2-10',1);
insert into adoptanimal(userid,petid,adopttime,state)values(1,2,'2024-2-10',2);

create view showapply as 
select an.id, users.username,p.petname,an.adopttime,an.state from adoptanimal as an inner join users on users.id=an.userid inner join pet  as p on p.id=an.petid
select * from showapply  where adopttime=%s and state=1
select * from users
select * from pet

update adoptanimal set state=0 where id=1
# 创建团队活动信息表
create table blog(
	id int(4) primary key auto_increment,
	actiontime date,
	address varchar(100),
	peoples varchar(100),
	events varchar(100),
	title varchar(100)
);
drop table blog
select * from blog;
insert into blog(actiontime,address,peoples,title,events)values ('2024-8-11','吉林省吉林市','张三、李四、王五','保护小动物','自愿去江城苑小区对小区的动物进行检查和医疗')
insert into blog(actiontime,address,peoples,title,events)values ('2024-9-12','吉林省吉林市','张三、王五','保护小动物','自愿去江城苑小区对小区的动物进行检查和医疗')
select id,title,actiontime,events,address,peoples from blog where actiontime=%s

insert into blog(actiontime,address,peoples,title,events)values (%s,%s,%s,%s,%s)
select title,actiontime,address,peoples,events from blog where id=%s;

update blog set title=%s,actiontime=%s,address=%s,peoples=%s,events=%s where id=%s

delete from blog where id=%s
# 志愿意者表
create table volunteer(
	id int(4) primary key auto_increment,
	userid int(4),
	reason varchar(100),
	applicationtime date,
	state int(4) # 0表示未处理 1表示已处理
);
select * from volunteer
select * from users
insert into volunteer (userid,reason,applicationtime,state) values(1,'保护小动物','2024-6-3',0)
insert into volunteer (userid,reason,applicationtime,state) values(2,'保护小动物','2024-7-3',1)

# 主外键 关系
ALTER TABLE volunteer
ADD CONSTRAINT volunteer_userid FOREIGN KEY (userid) REFERENCES users(id)
ON DELETE SET NULL
# 表连接查询
create view showvolunteer as 
select v.id,u.username,u.email,u.age,u.telphone,v.reason,v.applicationtime,v.state from volunteer as v inner join users as u on u.id=v.userid

select * from showvolunteer where id=%s
update showvolunteer set username='张三' where id=1
select * from users;
update showvolunteer set username='李张',email='lisi@qq.com',age=22,telphone='18622546987',reason='关爱流浪动行',applicationtime='2024-8-9' ,state=1 where id=1

update showvolunteer set username=%s,email=%s,age=%s,telphone=%s where id=%s

update showvolunteer set reason=%s,applicationtime=%s ,state=%s  where id=%s
select * from volunteer;
delete from volunteer where id=%s
# 创建评论表
create table comment(
	id int(4) primary key auto_increment,
	userid int(4),
	adminsid int(4),
	petid int(4),
	commenttime date,
	content varchar(100)
);
insert into comment(userid,adminsid,petid,commenttime,content)values(1,1,1,'2024-12-4','这只猫不错');
insert into comment(userid,adminsid,petid,commenttime,content)values(1,2,2,'2024-12-5','这只猫很活剥');
insert into comment(userid,adminsid,petid,commenttime,content)values(2,2,3,'2024-12-5','这条狗很活泼，喜欢在户外玩耍');
create view showcomment as 
select c.id,u.username,p.petname,c.content,c.commenttime from comment as c inner join users as u on c.userid=u.id inner join admins as a on a.id=c.adminsid inner join pet as p on c.petid=p.id
select * from comment;
select * from users;
select * from admins;
select * from pet;
select * from showcomment where username like %s
select username from users;
select username,petname,content,commenttime from showcomment where id =1
update comment set userid=%s,petid=%s,commenttime=%s,content=%s where id=%s

delete from comment where id=%s
select * from comment;
