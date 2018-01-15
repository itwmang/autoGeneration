$(function() {
	${modulePack}_${table.modelNameLow}_edit.init(vModel);
});
var ${modulePack}_${table.modelNameLow}_edit= function() {
	var fromag= new AutoGrid();
	var obj={operate:null};
	//私有块
	return {
		//公共
		init : function(data_) {
			obj.operate=$("#operate").val();
			//加载js
			base_utils.useJs("${modulePack}_base_resources");
			
			//获取resc,grid,快速查询...id
			var rescid=${modulePack}_base_resources.getRescid("${modulePack}_${table.modelNameLow}_list_resc");
			var grid_code=${modulePack}_base_resources.getAutoGrid("${modulePack}_${table.modelNameLow}_list_gridcode");
			//条件panel
			var cssPanel = new CssPanel();
			cssPanel.setParams(rescid,"header","editFormPanel");
			cssPanel.renderPanel("editFormPanel","主属性");
			//结果panel
			var cssPanel1 = new CssPanel();
			cssPanel1.setParams(rescid,"header","editGridPanel");
			cssPanel1.renderPanel("editGridPanel","地址信息");
			
			
			$("#editForm").randerEditForm(grid_code,"profix");
			if(obj.operate=="view"){
				//如果是查看,隐藏操作按钮,禁用表单
				$("#saveBtn").hide();
				$("#editForm").neusoftForm("disable",true);
			}
			if(data_){
				$("#editForm").neusoftForm("setData",data_);
			}
			
			$("#editGrid").randerEditGrid(grid_code);
			
		},
		addLine : function() {
			$("#editGrid").editGridOpt("addRow");
		},
		save : function() {
			$("#editGrid").editGridOpt("_endGridEdit");
			//获取form数据
			var formData=$("#editForm").neusoftForm("getData");			 
			//获取grid数据
			var gridData=$("#editGrid").editGridOpt("getData");
			debugger;
			formData["itemList"]=gridData;
			var url=ctx+"/${modulePack}/${table.modelNameLow}/save";
			neusoft_ajax_lib.asyncPost(url,formData,function(){
				//回调方法
				neusoft_msg_lib.tips("提示","保存成功!");
			});
		},
		clickTest:function(){
			debugger;
		}
	}
}();