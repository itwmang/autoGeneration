$(function() {
	${modulePack}_${table.modelNameLow}_list.init();
});
var ${modulePack}_${table.modelNameLow}_list= function() {
	var fromag= new AutoGrid();
	
	//私有块
	function getOpenWinParam(){
		var subTitle=desktopTab.getSelectTab().panel('options').title;
		return {subTitle:subTitle};
	}
	return {
		//公共
		init : function() {
			debugger;
			//加载js
			base_utils.useJs("${modulePack}_base_resources");
			
			//获取resc,grid,快速查询...id
			var rescid=${modulePack}_base_resources.getRescid("${modulePack}_${table.modelNameLow}_list_resc");
			var grid_code=${modulePack}_base_resources.getAutoGrid("${modulePack}_${table.modelNameLow}_list_gridcode");
			//条件panel
			var cssPanel = new CssPanel();
			cssPanel.setParams(rescid,"header","fromPanel");
			cssPanel.renderPanel("fromPanel","查询条件");
			//结果panel
			var cssPanel1 = new CssPanel();
			cssPanel1.setParams(rescid,"header","gridPanel");
			cssPanel1.renderPanel("gridPanel","数据信息");
			
			//设置表格样式
			var formats = [{
				columnMark : "customerCode",//todo://
				formatCodeBefore : '<a href="#" >',
				formatCodeStyle : 'color:blue',
				formatClickFunc : '${modulePack}_${table.modelNameLow}_list.gridClick',
				formatCodeParams : "rowId",//todo://
				formatCodeAfter : '</a>'
			}];
			fromag.gridColumnFormat(formats);
			
			//单独表格form主从渲染
			//初始化配置.传入表格配置编码
			fromag.initConfig(grid_code);
			fromag.randerForm("queryForm","queryGrid");
			fromag.randerGridByCode("queryGrid");	
			
			
		},
		query:function(){
			fromag.queryData();
		},
		reset:function(){
			fromag.resetForm();
		},
		add : function() {
			var user=getCurrentLoginuserInfo();
			console.info(user);
			//todo:标题,地址//
			desktopTab.addTab("查看客户信息", "/views/${modulePack}/${table.modelNameLow}/${modulePack}_${table.modelNameLow}_edit.jsp", "",getOpenWinParam());//增加tab
		},
		edit : function() {
			var selectTd = $("#queryGrid").datagrid("getSelected");
			if(!selectTd){
				neusoft_msg_lib.show("提示","请选择一行数据",500);
				return false;
			}
			var id=selectTd.rowId;
			//todo:标题,地址//
			desktopTab.addTab("修改客户信息", "/${modulePack}/${table.modelNameLow}/edit/"+id, "",getOpenWinParam());//增加tab
		},
		del : function() {
			var selectTd = $("#queryGrid").datagrid("getSelections");
			if(selectTd.length==0){
				neusoft_msg_lib.show("提示","请选择一行数据",500);
				return false;
			}
			var ids=new Array();
			for(var key in selectTd){
			 	ids.push(selectTd[key].rowId);
			}
			var url=ctx+"/${modulePack}/${table.modelNameLow}/delete"; 
			neusoft_ajax_lib.postParam(url,{ids:ids},function(){
				//回调方法
				neusoft_msg_lib.tips("提示","删除成功!");
			});
		},
		//超链接点击方法
		gridClick:function(id){
			//todo:标题,地址//
			desktopTab.addTab("查看客户信息", "/${modulePack}/${table.modelNameLow}/view/"+id, "",getOpenWinParam());//增加tab
		}
		
	}
}();