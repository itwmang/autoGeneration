package com.wmang.logis.core.exchanger.user;

import java.util.Map;

import com.wmang.logis.mode.utils.DateUtil;
import com.wmang.logis.mode.utils.ValueUtil;
import com.wmang.mode.utils.base.AbstractExchanger;

import com.wmang.logis.mode.dto.vo.user.SysUserVO;
import com.wmang.logis.mode.entity.user.SysUser;


 /**
 * Title: 客户主数据
 * Description: 客户主数据Exchanger类 
 * @Author: wmang
 * @CreateDate: 2018-01
 * @version 1.0 初稿
 */
public class SysUserExchanger extends AbstractExchanger<SysUserVO,SysUser> {
	
	@Override
	public void dbFillVo(SysUser db,SysUserVO vo) {
		vo.setId(db.getId());
		vo.setAccount(db.getAccount());
		vo.setName(db.getName());
		vo.setPasswd(db.getPasswd());
		vo.setEmail(db.getEmail());
		vo.setUserType(db.getUserType());
		vo.setUserStatus(db.getUserStatus());
		vo.setPhone(db.getPhone());
		vo.setAddress(db.getAddress());
		vo.setVersion(db.getVersion());
		vo.setVersionStr(DateUtil.DateToString(db.getVersion(), "yyyy-MM-dd HH:mm:ss"));
		vo.setPubValidly(db.getPubValidly());
		vo.setPubRemark(db.getPubRemark());
		vo.setPubCreatePerson(db.getPubCreatePerson());
		vo.setPubCreateDate(db.getPubCreateDate());
		vo.setPubCreateDateStr(DateUtil.DateToString(db.getPubCreateDate(), "yyyy-MM-dd HH:mm:ss"));
		vo.setPubModiPerson(db.getPubModiPerson());
		vo.setPubModiDate(db.getPubModiDate());
		vo.setPubModiDateStr(DateUtil.DateToString(db.getPubModiDate(), "yyyy-MM-dd HH:mm:ss"));
	}
	
	@Override
	public void voFillDb(SysUserVO vo,SysUser db) {
		db.setId(vo.getId());
		db.setAccount(vo.getAccount());
		db.setName(vo.getName());
		db.setPasswd(vo.getPasswd());
		db.setEmail(vo.getEmail());
		db.setUserType(vo.getUserType());
		db.setUserStatus(vo.getUserStatus());
		db.setPhone(vo.getPhone());
		db.setAddress(vo.getAddress());
		if (vo.getVersion()!=null) {
			db.setVersion(vo.getVersion());
		} else {
			db.setVersion(ValueUtil.toDateNull(vo.getVersionStr()));
		}
		db.setPubValidly(vo.getPubValidly());
		db.setPubRemark(vo.getPubRemark());
		db.setPubCreatePerson(vo.getPubCreatePerson());
		if (vo.getPubCreateDate()!=null) {
			db.setPubCreateDate(vo.getPubCreateDate());
		} else {
			db.setPubCreateDate(ValueUtil.toDateNull(vo.getPubCreateDateStr()));
		}
		db.setPubModiPerson(vo.getPubModiPerson());
		if (vo.getPubModiDate()!=null) {
			db.setPubModiDate(vo.getPubModiDate());
		} else {
			db.setPubModiDate(ValueUtil.toDateNull(vo.getPubModiDateStr()));
		}
	}
	
	@Override
	public void mapFillVo(Map<String,?> map,SysUserVO vo) {
		vo.setId(ValueUtil.toIntNull(map.get("id")));
		vo.setAccount(ValueUtil.toStr(map.get("account")));
		vo.setName(ValueUtil.toStr(map.get("name")));
		vo.setPasswd(ValueUtil.toStr(map.get("passwd")));
		vo.setEmail(ValueUtil.toStr(map.get("email")));
		vo.setUserType(ValueUtil.toStr(map.get("userType")));
		vo.setUserStatus(ValueUtil.toStr(map.get("userStatus")));
		vo.setPhone(ValueUtil.toStr(map.get("phone")));
		vo.setAddress(ValueUtil.toStr(map.get("address")));
		vo.setVersion(ValueUtil.toDateNull(map.get("version")));
		vo.setVersionStr(DateUtil.DateToString(vo.getVersion(), "yyyy-MM-dd HH:mm:ss"));
		vo.setPubValidly(ValueUtil.toStr(map.get("pubValidly")));
		vo.setPubRemark(ValueUtil.toStr(map.get("pubRemark")));
		vo.setPubCreatePerson(ValueUtil.toStr(map.get("pubCreatePerson")));
		vo.setPubCreateDate(ValueUtil.toDateNull(map.get("pubCreateDate")));
		vo.setPubCreateDateStr(DateUtil.DateToString(vo.getPubCreateDate(), "yyyy-MM-dd HH:mm:ss"));
		vo.setPubModiPerson(ValueUtil.toStr(map.get("pubModiPerson")));
		vo.setPubModiDate(ValueUtil.toDateNull(map.get("pubModiDate")));
		vo.setPubModiDateStr(DateUtil.DateToString(vo.getPubModiDate(), "yyyy-MM-dd HH:mm:ss"));
	}

	@Override
	public SysUserVO newInstanceV() {
		return new SysUserVO();
	}

	@Override
	public SysUser newInstanceD() {
		return new SysUser();
	}
	
	@Override
	public void dbFillPkVo(SysUser db, SysUserVO vo) {
		vo.setId(db.getId());
	}
}
