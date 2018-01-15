<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/views/common/include-admin-head.jsp"%>
<script type="text/javascript" src="${r"$"}{ctx}/resources/js/${modulePack}/${table.modelNameLow}/${modulePack}_${table.modelNameLow}_edit.js" ></script>
<body>
	<div class="easyui-layout" style="width: 100%;" fit=true >
		<div data-options="region:'center'" height="40%">
			<div id="editFormPanel" fit=true>
				<div class='easyui-layout' id="editForm" fit=true></div>
			</div>
		</div>
		<div data-options="region:'south'"  height="60%">
			<div id="editGridPanel" fit=true>
				<div class='easyui-layout' id="editGrid" fit=true></div>
			</div>
		</div>
	</div>
	<input type="hidden" id="operate" value="${r"$"}{operate}" />
</body>
<script type="text/javascript">
	var vModel=${r"$"}{empty modelFromServer? "null":modelFromServer};
</script>
<%@ include file="/views/common/include-admin-tail.jsp"%>
