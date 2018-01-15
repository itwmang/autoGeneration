<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/views/common/include-admin-head.jsp"%>
<script type="text/javascript" src="${r"$"}{ctx}/resources/js/${modulePack}/${table.modelNameLow}/${modulePack}_${table.modelNameLow}_list.js" ></script>
<body>
	<div class="easyui-layout"  style="width: 100%;" fit=true >
		<div data-options="region:'north'" height="20%">
			<div id="fromPanel" fit=true>
				<div class='easyui-layout' id="queryForm" fit=true></div>
			</div>
		</div>
		<div data-options="region:'center'"  height="80%">
			<div id="gridPanel" fit=true>
				<div class='easyui-layout' id="queryGrid" fit=true></div>
			</div>
		</div>
	</div>
</body>

<%@ include file="/views/common/include-admin-tail.jsp"%>
