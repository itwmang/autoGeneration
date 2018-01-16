####MYSQL###
drop table if exists sys_user;
create table sys_user (
	id INTEGER not null auto_increment comment '主键',
	
	account VARCHAR2(32) comment '账号，not-null',
	name VARCHAR2(200) comment '名称，not-null',
	passwd VARCHAR2(300) comment '密码，not-null',
	email VARCHAR2(100) comment '账户邮箱',
	user_type VARCHAR2(10) comment '用户类型，账户密码。',
	user_status VARCHAR2(10) comment '用户状态，账户密码。',
	phone VARCHAR2(30) comment '电话号码',
	address VARCHAR2(200) comment '家庭地址',
	version DATE comment '密码最后修改时间',
	pub_validly VARCHAR2(10) comment '账户是否有效',
	pub_remark VARCHAR2(500) comment '备注',
	pub_create_person VARCHAR2(32) comment '创建人，not-null',
	pub_create_date DATE comment '创建时间，not-null',
	pub_modi_person VARCHAR2(32) comment '修改人',
	pub_modi_date DATE comment '修改时间',
	primary key (id)
) COMMENT='客户主数据' ;


/** 
alter table sys_user add column account VARCHAR2(32) null comment '账号，not-null';
alter table sys_user add column name VARCHAR2(200) null comment '名称，not-null';
alter table sys_user add column passwd VARCHAR2(300) null comment '密码，not-null';
alter table sys_user add column email VARCHAR2(100) null comment '账户邮箱';
alter table sys_user add column user_type VARCHAR2(10) null comment '用户类型，账户密码。';
alter table sys_user add column user_status VARCHAR2(10) null comment '用户状态，账户密码。';
alter table sys_user add column phone VARCHAR2(30) null comment '电话号码';
alter table sys_user add column address VARCHAR2(200) null comment '家庭地址';
alter table sys_user add column version DATE null comment '密码最后修改时间';
alter table sys_user add column pub_validly VARCHAR2(10) null comment '账户是否有效';
alter table sys_user add column pub_remark VARCHAR2(500) null comment '备注';
alter table sys_user add column pub_create_person VARCHAR2(32) null comment '创建人，not-null';
alter table sys_user add column pub_create_date DATE null comment '创建时间，not-null';
alter table sys_user add column pub_modi_person VARCHAR2(32) null comment '修改人';
alter table sys_user add column pub_modi_date DATE null comment '修改时间';
*/

delete from baseplam_grid_item where grid_id in (select grid_id from baseplam_grid where grid_code='sys_user');
delete from baseplam_grid where grid_code='sys_user';

INSERT INTO baseplam_grid (
	grid_code,grid_title,form_title,data_source_type,data_source,
	customer_sql,
	plain_query,advance_query,form_line_column,rownumbers,single_select,pagination) 
VALUES ('sys_user','客户主数据','客户主数据','sql','',
	'<#if _count??>
select count(1)
<#else>
select id,account,name,passwd,email,
	user_type,user_status,phone,address,date_format(version,''%Y-%m-%d %H:%i:%S'') as version,
	pub_validly,pub_remark,pub_create_person,date_format(pub_create_date,''%Y-%m-%d %H:%i:%S'') as pub_create_date,
	pub_modi_person,
	date_format(pub_modi_date,''%Y-%m-%d %H:%i:%S'') as pub_modi_date
</#if>
from sys_user
where 1=1
<#if account??> and account=''${account}'' </#if>
<#if name??> and name=''${name}'' </#if>
<#if passwd??> and passwd=''${passwd}'' </#if>
<#if email??> and email=''${email}'' </#if>
<#if user_type??> and user_type=''${user_type}'' </#if>
<#if user_status??> and user_status=''${user_status}'' </#if>
<#if phone??> and phone=''${phone}'' </#if>
<#if address??> and address=''${address}'' </#if>
<#if version_begin??> and version>=''${version_begin}'' </#if>
<#if version_end??> and version<=''${version_end}'' </#if>
<#if pub_validly??> and pub_validly=''${pub_validly}'' </#if>
<#if pub_remark??> and pub_remark=''${pub_remark}'' </#if>
<#if pub_create_person??> and pub_create_person=''${pub_create_person}'' </#if>
<#if pub_create_date_begin??> and pub_create_date>=''${pub_create_date_begin}'' </#if>
<#if pub_create_date_end??> and pub_create_date<=''${pub_create_date_end}'' </#if>
<#if pub_modi_person??> and pub_modi_person=''${pub_modi_person}'' </#if>
<#if pub_modi_date_begin??> and pub_modi_date>=''${pub_modi_date_begin}'' </#if>
<#if pub_modi_date_end??> and pub_modi_date<=''${pub_modi_date_end}'' </#if>
<#if example??> and <@exampleClause /> </#if>
<#if _sort??>
order by ${_sort} ${_order}
</#if>',
	'T','T','4','T','T','T');

INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','account','账号',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','账号',
	'=','string','string','',NULL,
	'T','string','string','','账号',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','name','名称',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','名称',
	'=','string','string','',NULL,
	'T','string','string','','名称',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','passwd','密码',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','密码',
	'=','string','string','',NULL,
	'T','string','string','','密码',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','email','邮箱',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','邮箱',
	'=','string','string','',NULL,
	'T','string','string','','邮箱',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','user_type','用户类型',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','用户类型',
	'=','string','string','',NULL,
	'T','string','string','','用户类型',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','user_status','用户状态',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','用户状态',
	'=','string','string','',NULL,
	'T','string','string','','用户状态',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','phone','电话号码',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','电话号码',
	'=','string','string','',NULL,
	'T','string','string','','电话号码',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','address','家庭地址',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','家庭地址',
	'=','string','string','',NULL,
	'T','string','string','','家庭地址',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','version','密码最后修改时间',NULL,'',
	'T','string','center','','',
	'',NULL,NULL,'T','密码最后修改时间',
	'','','','',NULL,
	'','','','','',
	'','','',NULL
),(
	'sys_user','version_begin','密码最后修改时间开始',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','密码最后修改时间开始',
	'','','',NULL
),(
	'sys_user','version_end','密码最后修改时间结束',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','密码最后修改时间结束',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','pub_validly','账户是否有效',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','账户是否有效',
	'=','string','string','',NULL,
	'T','string','string','','账户是否有效',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','pub_remark','备注',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','备注',
	'=','string','string','',NULL,
	'T','string','string','','备注',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','pub_create_person','创建人',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','创建人',
	'=','string','string','',NULL,
	'T','string','string','','创建人',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','pub_create_date','创建时间',NULL,'',
	'T','string','center','','',
	'',NULL,NULL,'T','创建时间',
	'','','','',NULL,
	'','','','','',
	'','','',NULL
),(
	'sys_user','pub_create_date_begin','创建时间开始',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','创建时间开始',
	'','','',NULL
),(
	'sys_user','pub_create_date_end','创建时间结束',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','创建时间结束',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','pub_modi_person','修改人',NULL,'',
	'T','string','center','','T',
	'',NULL,NULL,'T','修改人',
	'=','string','string','',NULL,
	'T','string','string','','修改人',
	'','','',NULL
	);
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'sys_user','pub_modi_date','修改时间',NULL,'',
	'T','string','center','','',
	'',NULL,NULL,'T','修改时间',
	'','','','',NULL,
	'','','','','',
	'','','',NULL
),(
	'sys_user','pub_modi_date_begin','修改时间开始',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','修改时间开始',
	'','','',NULL
),(
	'sys_user','pub_modi_date_end','修改时间结束',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','修改时间结束',
	'','','',NULL
	);

update baseplam_grid_item
set grid_id=(select max(grid_id) from baseplam_grid where grid_code='sys_user')
where grid_id='sys_user';

