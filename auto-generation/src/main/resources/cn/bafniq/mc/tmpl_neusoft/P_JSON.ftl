{
	"validateTitles" : {
<#list listMcColumn as column>
		"${column.nameJavaFL}":"${column.comment}"<#if column_has_next>,</#if>
		</#list>
	},
	"validateRules" : {
<#list listMcColumn as column>
		"${column.nameJavaFL}":{
			"required":true
		}<#if column_has_next>,</#if>
		</#list>
	}
}