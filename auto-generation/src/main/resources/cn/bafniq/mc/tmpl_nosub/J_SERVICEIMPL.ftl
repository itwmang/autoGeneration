package ${basePack}.${modulePack}.core.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.${modulePack}.api.entity.${table.tableNameJavaFU};
import com.neusoft.framework.api.dao.BaseMapper;
import ${basePack}.${modulePack}.core.dao.${table.tableNameJavaFU}Mapper;
import ${basePack}.${modulePack}.core.dao.${table.tableNameJavaFU}ExtMapper;
import com.neusoft.framework.api.service.AbstractService;
import ${basePack}.${modulePack}.core.service.${table.tableNameJavaFU}Service;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}ServiceImpl类</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Service("${table.tableNameJavaFL}Service")
public class ${table.tableNameJavaFU}ServiceImpl extends AbstractService<${table.tableNameJavaFU}, ${table.pkColumn.typeJava}> implements ${table.tableNameJavaFU}Service {
	
	protected static Logger logger = LoggerFactory.getLogger(${table.tableNameJavaFU}ServiceImpl.class);
	
	@Autowired
	private ${table.tableNameJavaFU}Mapper ${table.tableNameJavaFL}Mapper;
	
	@Autowired
	private ${table.tableNameJavaFU}ExtMapper ${table.tableNameJavaFL}ExtMapper;

	@Override
	public BaseMapper<${table.tableNameJavaFU}, ${table.pkColumn.typeJava}> getBaseMapper() throws Exception {
		return ${table.tableNameJavaFL}Mapper;
	}

}
