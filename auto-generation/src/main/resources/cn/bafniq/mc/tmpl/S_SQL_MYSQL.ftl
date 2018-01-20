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
