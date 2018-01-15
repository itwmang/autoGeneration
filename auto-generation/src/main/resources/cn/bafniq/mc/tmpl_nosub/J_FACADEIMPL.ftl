package ${basePack}.${modulePack}.core.facade.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.${modulePack}.mode.dto.vo.${table.tableNameJavaFU}VO;
import ${basePack}.${modulePack}.api.facade.${table.tableNameJavaFU}Facade;
import com.wmang.mode.utils.base.BaseMgrBiz;
import com.neusoft.framework.api.facade.AbstractMgrFacade;
import ${basePack}.${modulePack}.core.biz.${table.tableNameJavaFU}Biz;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}FacadeImpl类</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Service("${table.tableNameJavaFL}Facade")
public class ${table.tableNameJavaFU}FacadeImpl extends AbstractMgrFacade<${table.tableNameJavaFU}VO, ${table.pkColumn.typeJava}> implements ${table.tableNameJavaFU}Facade {
	
	protected static Logger logger = LoggerFactory.getLogger(${table.tableNameJavaFU}FacadeImpl.class);
	
	@Autowired
	private ${table.tableNameJavaFU}Biz ${table.tableNameJavaFL}Biz;

	@Override
	public BaseMgrBiz<${table.tableNameJavaFU}VO, ${table.pkColumn.typeJava}> getBaseMgrBiz() {
		return ${table.tableNameJavaFL}Biz;
	}
	
}

