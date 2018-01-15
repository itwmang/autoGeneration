drop table ${table.tableNameLow}
;

create table ${table.tableNameLow} (
	${table.pkColumn.nameLow} ${table.pkColumn.dataType} not null ,
	<#list listMcColumn as column>
		<#if column.nameUp!=table.pkColumn.nameUp>
	${column.nameLow} ${column.dataType},
		</#if>
	</#list>
	primary key (${table.pkColumn.nameLow})
)
;

<#list listMcColumn as column>
<#if (column.desc)??&&column.desc?index_of("参数")!=-1>
create index idx_${table.tableNameLow}_${column.nameLow} on ${table.tableNameLow}(${column.nameLow});
</#if>
</#list>
-- 表格备注
comment on table ${table.tableNameLow} is '${table.tableComment}';

-- 字段备注
<#list listMcColumn as column>
comment on column ${table.tableNameLow}.${column.nameLow} is '${column.fullComment}';
</#list>

-- 主键sequence
create sequence seq_${table.tableNameLow}
             increment by 1
             start with 1
             nomaxvalue
             nocycle
             cache 10;
