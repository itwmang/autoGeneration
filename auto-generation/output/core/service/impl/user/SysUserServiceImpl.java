package com.wmang.logis.core.service.impl.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wmang.logis.mode.entity.user.SysUser;
import com.wmang.mode.utils.base.BaseMapper;
import com.wmang.logis.core.dao.user.SysUserMapper;
import com.wmang.logis.core.dao.user.SysUserExtMapper;
import com.wmang.mode.utils.base.AbstractService;
import com.wmang.logis.core.service.user.SysUserService;

 /**
 * Title: 客户主数据
 * Description: 客户主数据ServiceImpl类
 * @Author: wmang
 * @CreateDate: 2018-01
 * @version 1.0 初稿
 */
@Service("sysUserService")
public class SysUserServiceImpl extends AbstractService<SysUser, Integer> implements SysUserService {
	
	protected static Logger logger = LoggerFactory.getLogger(SysUserServiceImpl.class);
	
	@Autowired
	private SysUserMapper sysUserMapper;
	
	@Autowired
	private SysUserExtMapper sysUserExtMapper;

	@Override
	public BaseMapper<SysUser, Integer> getBaseMapper() throws Exception {
		return sysUserMapper;
	}

}
