package com.wmang.logis.core.biz.impl.user;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wmang.logis.mode.dto.vo.user.SysUserVO;
import com.wmang.logis.mode.entity.user.SysUser;
import com.wmang.logis.core.exchanger.user.SysUserExchanger;
import com.wmang.mode.utils.base.AbstractExchanger;
import com.wmang.mode.utils.base.BaseResponse;
import com.wmang.mode.utils.base.AbstractBaseMgrBiz;
import com.wmang.mode.utils.base.BaseService;
import com.wmang.logis.core.biz.user.SysUserBiz;
import com.wmang.logis.core.service.user.SysUserService;

 /**
 * Title: 客户主数据
 * <p>Description: 客户主数据BizImpl类</p>
 * @Author: wmang
 * @CreateDate: 2018-01
 * @version 1.0 初稿
 */
@Service("sysUserBiz")
public class SysUserBizImpl extends AbstractBaseMgrBiz<SysUserVO,SysUser,Integer> implements SysUserBiz {
	
	protected static Logger logger = LoggerFactory.getLogger(SysUserBizImpl.class);
	
	protected static List<String> updateColumns=Arrays.asList(SysUser.account_,SysUser.name_,SysUser.passwd_,SysUser.email_,SysUser.userType_,SysUser.userStatus_,SysUser.phone_,SysUser.address_,SysUser.version_,SysUser.pubValidly_,SysUser.pubRemark_,SysUser.pubCreatePerson_,SysUser.pubCreateDate_,SysUser.pubModiPerson_,SysUser.pubModiDate_);
	
	@Autowired
	private SysUserService sysUserService;

	@Override
	public BaseService<SysUser, Integer> getBaseService() {
		return sysUserService;
	}

	@Override
	public AbstractExchanger<SysUserVO, SysUser> getExchanger() {
		return new SysUserExchanger();
	}

	@Override
	public List<String> getUpdateColumns() {
		return updateColumns;
	}
	
	@Override
	public BaseResponse<SysUserVO> update(SysUserVO vo, String userId) throws Exception {
		// TODO: vo.setOther...
		return super.update(vo, userId);
	}
	
	@Override
	public BaseResponse<SysUserVO> save(SysUserVO vo, String userId) throws Exception {
		// TODO: vo.setOther...
		return super.save(vo, userId);
	}
}
