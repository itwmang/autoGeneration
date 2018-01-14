package ${basePack}.${modulePack}.web.core.service.impl.${table.modelNameLow};

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.${modulePack}.api.facade.${table.modelNameLow}.${table.tableNameJavaFU}Facade;
import ${basePack}.${modulePack}.web.core.service.${table.modelNameLow}.${table.tableNameJavaFU}MgrService;

import ${basePack}.${modulePack}.api.dto.vo.${table.modelNameLow}.${table.tableNameJavaFU}VO;
import ${basePack}.${modulePack}.api.facade.${table.modelNameLow}.${table.tableNameJavaFU}Facade;
import com.neusoft.framework.api.facade.BaseMgrFacade;
import com.neusoft.cs.core.service.AbstractMgrService;


 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}MgrServiceImpl类
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Service("${table.tableNameJavaFL}MgrService")
public class ${table.tableNameJavaFU}MgrServiceImpl extends AbstractMgrService<${table.tableNameJavaFU}VO, ${table.pkColumn.typeJava}> implements ${table.tableNameJavaFU}MgrService {
	
	protected Logger logger = LoggerFactory.getLogger(${table.tableNameJavaFU}MgrServiceImpl.class);
	
	@Autowired
	private ${table.tableNameJavaFU}Facade ${table.tableNameJavaFL}Facade;

	@Override
	public BaseMgrFacade<${table.tableNameJavaFU}VO, ${table.pkColumn.typeJava}> BaseMgrFacade() {
		return ${table.tableNameJavaFL}Facade;
	}

}
