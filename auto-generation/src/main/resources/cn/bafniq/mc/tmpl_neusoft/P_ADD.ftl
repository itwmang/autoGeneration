<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/views/common/include-admin-head.jsp"%>
<body class="qryBody">
	<form id="editForm"></form>
	<a id="btnSave" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
</body>
<script type="text/javascript">
	var vFormFields=[
	<#list listMcColumn as column>
		<#if column.nameUp!=table.pkColumn.nameUp>
		<#if column.typeJava=="Date">
		{type:"date97",name:"${column.nameJavaFL}Str",display:"${column.comment}",newline:true}<#if column_has_next>,</#if>
		<#else>
		{type:"easyuiTextBox",name:"${column.nameJavaFL}",display:"${column.comment}",newline:true}<#if column_has_next>,</#if>
		</#if>
		</#if>
	</#list>
	];
	
	$(document).ready(function () {
		// 初始化表单
		$("#editForm").mideaForm({
			// 输入框宽度
			inputWidth: 300,
			// 标题宽度
			labelWidth: 120,
			// 空白宽度
			space: 60,
			// 字段列表
			fields: vFormFields,
			data : {}
		});
		
		$("#btnSave").click(function () {
			var vParam=$("#editForm").mideaForm("getData");
			
			var vData=midea_ajax_lib.post(ctx+"/${table.modelNameLow}/save",vParam);
			
			if (vData.status==true) {
				alert("保存成功");
			}
		});
	});
</script>

<%@ include file="/views/common/include-admin-tail.jsp"%>