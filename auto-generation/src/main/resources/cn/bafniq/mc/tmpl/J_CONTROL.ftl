package ${basePack}.core.controller.${modulePack};

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wmang.logis.core.controller.BaseController;
import ${basePack}.mode.dto.vo.${modulePack}.${table.tableNameJavaFU}VO;
import ${basePack}.core.biz.${modulePack}.${table.tableNameJavaFU}Biz;
import ${baseMapperPackage}.BaseResponse;
import ${baseMapperPackage}.BodyData;
import ${basePack}.mode.utils.FastJSONHelper;
import ${basePack}.mode.utils.ListCarrier;
import ${basePack}.mode.utils.ValueUtil;

 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}Controller类
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Controller
public class ${table.tableNameJavaFU}Controller extends BaseController{
	
	@Autowired
	private ${table.tableNameJavaFU}Biz ${table.tableNameJavaFL}Biz;
	
	/** 新增_打开界面 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/add", method = RequestMethod.GET)
	public String toadd() throws Exception {
		return "/${modulePack}/${table.modelNameLow}/${table.modelNameLow}_add";
	}
	
	/** 新增 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/save", method = RequestMethod.POST)
	@ResponseBody
	public BodyData save(@RequestBody ${table.tableNameJavaFU}VO vo) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}Biz.save(vo, "");
		return super.success(response);
	}
	
	/** 更新_打开界面 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/edit/{id}", method = RequestMethod.GET)
	public String toupdate(@PathVariable("id") ${table.pkColumn.typeJava} id,Model model) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}Biz.findOne(id);
		model.addAttribute("modelFromServer", FastJSONHelper.serialize(response.getReturnObject()));
		return "/${modulePack}/${table.modelNameLow}/${table.modelNameLow}_edit";
	}
	/** 查看_打开界面 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/view/{id}", method = RequestMethod.GET)
	public String toview(@PathVariable("id") ${table.pkColumn.typeJava} id,Model model) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}Biz.findOne(id);
		model.addAttribute("modelFromServer", FastJSONHelper.serialize(response.getReturnObject()));
		model.addAttribute("operate", "view");
		return "/${modulePack}/${table.modelNameLow}/${table.modelNameLow}_edit";
	}
	
	/** 更新 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/update", method = RequestMethod.POST)
	@ResponseBody
	public BodyData update(@RequestBody ${table.tableNameJavaFU}VO vo) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}Biz.update(vo, "");
		return super.success(response);
	}
	
	/** 删除 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/delete", method = RequestMethod.POST)
	@ResponseBody
	public BodyData delete(@RequestParam("ids")  String ids) throws Exception {
		List<${table.pkColumn.typeJava}> listId=new ListCarrier<String, ${table.pkColumn.typeJava}>() {
			@Override
			public ${table.pkColumn.typeJava} carry(String source) throws Exception {
				<#if table.pkColumn.typeJava=="Integer">
				return ValueUtil.toInt(source);
				<#elseif table.pkColumn.typeJava=="Long">
				return ValueUtil.toLong(source);
				<#elseif table.pkColumn.typeJava=="String">
				return ValueUtil.toStr(source);
				</#if>
			}
		}.carryList(Arrays.asList(ids.split(",")));
		BaseResponse<List<${table.pkColumn.typeJava}>> response=${table.tableNameJavaFL}Biz.delete(listId, "");
		return super.success(response);
	}
}
