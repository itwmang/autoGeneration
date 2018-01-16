package com.wmang.logis.core.controller.user;

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
import com.wmang.logis.mode.dto.vo.user.SysUserVO;
import com.wmang.logis.core.biz.user.SysUserBiz;
import com.wmang.logis.mode.utils.base.BaseResponse;
import com.wmang.logis.mode.utils.base.BodyData;
import com.wmang.logis.mode.utils.FastJSONHelper;
import com.wmang.logis.mode.utils.ListCarrier;
import com.wmang.logis.mode.utils.ValueUtil;

 /**
 * Title: 客户主数据
 * Description: 客户主数据Controller类
 * @Author: wmang
 * @CreateDate: 2018-01
 * @version 1.0 初稿
 */
@Controller
public class SysUserController extends BaseController{
	
	@Autowired
	private SysUserBiz sysUserBiz;
	
	/** 新增_打开界面 */
	@RequestMapping(value = "/user/sysUser/add", method = RequestMethod.GET)
	public String toadd() throws Exception {
		return "/user/sysUser/sysUser_add";
	}
	
	/** 新增 */
	@RequestMapping(value = "/user/sysUser/save", method = RequestMethod.POST)
	@ResponseBody
	public BodyData save(@RequestBody SysUserVO vo) throws Exception {
		BaseResponse<SysUserVO> response=sysUserBiz.save(vo, "");
		return super.success(response);
	}
	
	/** 更新_打开界面 */
	@RequestMapping(value = "/user/sysUser/edit/{id}", method = RequestMethod.GET)
	public String toupdate(@PathVariable("id") Integer id,Model model) throws Exception {
		BaseResponse<SysUserVO> response=sysUserBiz.findOne(id);
		model.addAttribute("modelFromServer", FastJSONHelper.serialize(response.getReturnObject()));
		return "/user/sysUser/sysUser_edit";
	}
	/** 查看_打开界面 */
	@RequestMapping(value = "/user/sysUser/view/{id}", method = RequestMethod.GET)
	public String toview(@PathVariable("id") Integer id,Model model) throws Exception {
		BaseResponse<SysUserVO> response=sysUserBiz.findOne(id);
		model.addAttribute("modelFromServer", FastJSONHelper.serialize(response.getReturnObject()));
		model.addAttribute("operate", "view");
		return "/user/sysUser/sysUser_edit";
	}
	
	/** 更新 */
	@RequestMapping(value = "/user/sysUser/update", method = RequestMethod.POST)
	@ResponseBody
	public BodyData update(@RequestBody SysUserVO vo) throws Exception {
		BaseResponse<SysUserVO> response=sysUserBiz.update(vo, "");
		return super.success(response);
	}
	
	/** 删除 */
	@RequestMapping(value = "/user/sysUser/delete", method = RequestMethod.POST)
	@ResponseBody
	public BodyData delete(@RequestParam("ids")  String ids) throws Exception {
		List<Integer> listId=new ListCarrier<String, Integer>() {
			@Override
			public Integer carry(String source) throws Exception {
				return ValueUtil.toInt(source);
			}
		}.carryList(Arrays.asList(ids.split(",")));
		BaseResponse<List<Integer>> response=sysUserBiz.delete(listId, "");
		return super.success(response);
	}
}
