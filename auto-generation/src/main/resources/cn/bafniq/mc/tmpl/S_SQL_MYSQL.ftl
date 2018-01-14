####MYSQL###
drop table if exists ${table.tableNameLow};
create table ${table.tableNameLow} (
	${table.pkColumn.nameLow} ${table.pkColumn.dataType} not null <#if table.pkColumn.typeJava=="Long">auto_increment<#elseif table.pkColumn.typeJava=="Integer">auto_increment</#if> comment '${table.pkColumn.comment}',
	
	<#list listMcColumn as column>
		<#if column.nameUp!=table.pkColumn.nameUp>
	${column.nameLow} ${column.dataType} comment '${column.fullComment}',
		</#if>
	</#list>
	primary key (${table.pkColumn.nameLow})
) COMMENT='${table.tableComment}' ;

<#list listMcColumn as column>
<#if (column.desc)??&&column.desc?index_of("参数")!=-1>
create index idx_${table.tableNameLow}_${column.nameLow} on ${table.tableNameLow}(${column.nameLow});
</#if>
</#list>

/** 
<#list listMcColumn as column>
	<#if column.nameUp!=table.pkColumn.nameUp>
alter table ${table.tableNameLow} add column ${column.nameLow} ${column.dataType} null comment '${column.fullComment}';
	</#if>
</#list>
*/

delete from baseplam_grid_item where grid_id in (select grid_id from baseplam_grid where grid_code='${table.tableNameLow}');
delete from baseplam_grid where grid_code='${table.tableNameLow}';

INSERT INTO baseplam_grid (
	grid_code,grid_title,form_title,data_source_type,data_source,
	customer_sql,
	plain_query,advance_query,form_line_column,rownumbers,single_select,pagination) 
VALUES ('${table.tableNameLow}','${table.tableComment}','${table.tableComment}','sql','',
	'<${r"#"}if _count??>
select count(1)
<${r"#"}else>
select <#list listMcColumn as column><#if column.typeJava=="Date">date_format(${column.nameLow},''%Y-%m-%d %H:%i:%S'') as ${column.nameLow}<#else>${column.nameLow}</#if><#if column_has_next>,<#if ((column_index+1)%5==0||column.typeJava=="Date")>${"\n\t"}</#if></#if></#list>
</${r"#"}if>
from ${table.tableNameLow}
where 1=1
<#list listMcColumn as column>
	<#if column.typeJava=="String">
<${r"#"}if ${column.nameLow}??> and ${column.nameLow}=''${r"$"}{${column.nameLow}}'' </${r"#"}if>
	<#elseif column.typeJava=="Date">
<${r"#"}if ${column.nameLow}_begin??> and ${column.nameLow}>=''${r"$"}{${column.nameLow}_begin}'' </${r"#"}if>
<${r"#"}if ${column.nameLow}_end??> and ${column.nameLow}<=''${r"$"}{${column.nameLow}_end}'' </${r"#"}if>
	</#if>
</#list>
<${r"#"}if example??> and <${r"@"}exampleClause /> </${r"#"}if>
<${r"#"}if _sort??>
order by ${r"$"}{_sort} ${r"$"}{_order}
</${r"#"}if>',
	'T','T','4','T','T','T');

<#list listMcColumn as column>
<#if column.typeJava=="String">
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'${table.tableNameLow}','${column.nameLow}','${column.comment}',NULL,'<#if column.nameUp=table.pkColumn.nameUp>T</#if>',
	'T','string','center','','<#if column.typeJava=="String">T</#if>',
	'',NULL,NULL,'T','${column.comment}',
	'=','string','string','',NULL,
	'T','string','string','','${column.comment}',
	'','','',NULL
	);
<#elseif column.typeJava=="Date">
INSERT INTO baseplam_grid_item (
	grid_id,column_name,column_display_name,column_codelist_type,is_grid_field,
	display_type,column_type,column_align,column_width,sort_type,
	rpc_sort,sort_column,display_sort,is_condition,cond_display_name,
	cond_operate_char,cond_control,cond_control_type,cond_control_code,cond_sort,
	is_plain,form_control,form_control_type,form_control_code,form_label,
	label_width,control_width,space_width,form_sort)
VALUES (
	'${table.tableNameLow}','${column.nameLow}','${column.comment}',NULL,'<#if column.nameUp=table.pkColumn.nameUp>T</#if>',
	'T','string','center','','<#if column.typeJava=="String">T</#if>',
	'',NULL,NULL,'T','${column.comment}',
	'','','','',NULL,
	'','','','','',
	'','','',NULL
),(
	'${table.tableNameLow}','${column.nameLow}_begin','${column.comment}开始',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','${column.comment}开始',
	'','','',NULL
),(
	'${table.tableNameLow}','${column.nameLow}_end','${column.comment}结束',NULL,'',
	'F','','','','',
	'',NULL,NULL,'','',
	'','','','',NULL,
	'T','date','string','','${column.comment}结束',
	'','','',NULL
	);
</#if>
</#list>

update baseplam_grid_item
set grid_id=(select max(grid_id) from baseplam_grid where grid_code='${table.tableNameLow}')
where grid_id='${table.tableNameLow}';

