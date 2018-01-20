####MYSQL###
drop table if exists sys_user;
create table sys_user (
	id int not null auto_increment comment '主键',
	
	account varchar comment '账号，not-null',
	name_ varchar comment '名称，not-null',
	passwd varchar comment '密码，not-null',
	email varchar comment '账户邮箱',
	user_type varchar comment '用户类型，账户密码。',
	user_status varchar comment '用户状态，账户密码。',
	phone varchar comment '电话号码',
	address varchar comment '家庭地址',
	lastupdate_passwd DATE comment '密码最后修改时间',
	pub_validly varchar comment '账户是否有效',
	pub_remark varchar comment '备注',
	pub_create_person varchar comment '创建人，not-null',
	pub_create_date DATE comment '创建时间，not-null',
	pub_modi_person varchar comment '修改人',
	pub_modi_date DATE comment '修改时间',
	primary key (id)
) COMMENT='客户主数据' ;


/** 
alter table sys_user add column account varchar null comment '账号，not-null';
alter table sys_user add column name_ varchar null comment '名称，not-null';
alter table sys_user add column passwd varchar null comment '密码，not-null';
alter table sys_user add column email varchar null comment '账户邮箱';
alter table sys_user add column user_type varchar null comment '用户类型，账户密码。';
alter table sys_user add column user_status varchar null comment '用户状态，账户密码。';
alter table sys_user add column phone varchar null comment '电话号码';
alter table sys_user add column address varchar null comment '家庭地址';
alter table sys_user add column lastupdate_passwd DATE null comment '密码最后修改时间';
alter table sys_user add column pub_validly varchar null comment '账户是否有效';
alter table sys_user add column pub_remark varchar null comment '备注';
alter table sys_user add column pub_create_person varchar null comment '创建人，not-null';
alter table sys_user add column pub_create_date DATE null comment '创建时间，not-null';
alter table sys_user add column pub_modi_person varchar null comment '修改人';
alter table sys_user add column pub_modi_date DATE null comment '修改时间';
*/
