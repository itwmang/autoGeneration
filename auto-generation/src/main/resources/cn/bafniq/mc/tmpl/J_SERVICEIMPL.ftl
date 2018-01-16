package ${basePack}.core.service.impl.${modulePack};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.mode.entity.${modulePack}.${table.tableNameJavaFU};
import com.wmang.mode.utils.base.BaseMapper;
import ${basePack}.core.dao.${modulePack}.${table.tableNameJavaFU}Mapper;
import ${basePack}.core.dao.${modulePack}.${table.tableNameJavaFU}ExtMapper;
import com.wmang.mode.utils.base.AbstractService;
import ${basePack}.core.service.${modulePack}.${table.tableNameJavaFU}Service;

 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}ServiceImpl类
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
