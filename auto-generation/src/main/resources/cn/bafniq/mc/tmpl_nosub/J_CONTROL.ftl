package ${basePack}.${modulePack}.web.core.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ${basePack}.${modulePack}.mode.dto.vo.${table.tableNameJavaFU}VO;
import ${basePack}.${modulePack}.web.core.service.${table.tableNameJavaFU}MgrService;
import ${basePack}.framework.rpc.api.dto.request.GridQueryRequest;
import ${basePack}.framework.rpc.api.facade.GridQueryFacade;
import com.neusoft.cs.core.service.BasePlamGridService;
import com.neusoft.cs.core.controller.UserContextController;
import com.neusoft.framework.api.dto.response.BasePageResponse;
import com.wmang.mode.utils.base.BaseResponse;
import com.neusoft.framework.api.dto.response.BodyData;
import com.neusoft.framework.utils.FastJSONHelper;
import com.neusoft.framework.utils.ListCarrier;
import com.neusoft.framework.utils.ValueUtil;

 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}Controller类
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Controller
public class ${table.tableNameJavaFU}Controller extends UserContextController {
	
	@Autowired
	private ${table.tableNameJavaFU}MgrService ${table.tableNameJavaFL}MgrService;
	
	/** 新增_打开界面 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/add", method = RequestMethod.GET)
	public String toadd() throws Exception {
		return "/${modulePack}/${table.modelNameLow}/${table.modelNameLow}_add";
	}
	
	/** 新增 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/save", method = RequestMethod.POST)
	@ResponseBody
	public BodyData save(@RequestBody ${table.tableNameJavaFU}VO vo) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}MgrService.save(vo, super.getUserAccount());
		return super.success(response);
	}
	
	/** 更新_打开界面 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/edit/{id}", method = RequestMethod.GET)
	public String toupdate(@PathVariable("id") ${table.pkColumn.typeJava} id,Model model) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}MgrService.findOne(id);
		model.addAttribute("modelFromServer", FastJSONHelper.serialize(response.getReturnObject()));
		return "/${modulePack}/${table.modelNameLow}/${table.modelNameLow}_edit";
	}
	/** 查看_打开界面 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/view/{id}", method = RequestMethod.GET)
	public String toview(@PathVariable("id") ${table.pkColumn.typeJava} id,Model model) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}MgrService.findOne(id);
		model.addAttribute("modelFromServer", FastJSONHelper.serialize(response.getReturnObject()));
		model.addAttribute("operate", "view");
		return "/${modulePack}/${table.modelNameLow}/${table.modelNameLow}_edit";
	}
	
	/** 更新 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/update", method = RequestMethod.POST)
	@ResponseBody
	public BodyData update(@RequestBody ${table.tableNameJavaFU}VO vo) throws Exception {
		BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}MgrService.update(vo, super.getUserAccount());
		return super.success(response);
	}
	
	/** 删除 */
	@RequestMapping(value = "/${modulePack}/${table.modelNameLow}/delete", method = RequestMethod.POST)
	@ResponseBody
	public BodyData delete(@RequestParam("ids") @NotEmpty(message="id不能为空") String ids) throws Exception {
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
		BaseResponse<List<${table.pkColumn.typeJava}>> response=${table.tableNameJavaFL}MgrService.delete(listId, super.getUserAccount());
		return super.success(response);
	}
}
