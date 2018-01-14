package ${basePack}.${modulePack}.core.biz.impl;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.${modulePack}.api.dto.vo.${table.tableNameJavaFU}VO;
import ${basePack}.${modulePack}.api.entity.${table.tableNameJavaFU};
import ${basePack}.${modulePack}.core.exchanger.${table.tableNameJavaFU}Exchanger;
import com.neusoft.framework.api.exchanger.AbstractExchanger;
import com.neusoft.framework.api.dto.response.BaseResponse;
import com.neusoft.framework.api.biz.AbstractBaseMgrBiz;
import com.neusoft.framework.api.service.BaseService;
import ${basePack}.${modulePack}.core.biz.${table.tableNameJavaFU}Biz;
import ${basePack}.${modulePack}.core.service.${table.tableNameJavaFU}Service;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}BizImpl类</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Service("${table.tableNameJavaFL}Biz")
public class ${table.tableNameJavaFU}BizImpl extends AbstractBaseMgrBiz<${table.tableNameJavaFU}VO,${table.tableNameJavaFU},${table.pkColumn.typeJava}> implements ${table.tableNameJavaFU}Biz {
	
	protected static Logger logger = LoggerFactory.getLogger(${table.tableNameJavaFU}BizImpl.class);
	
	protected static List<String> updateColumns=Arrays.asList(<#list listMcColumn as column><#if column.nameUp!=table.pkColumn.nameUp>${table.tableNameJavaFU}.${column.nameJavaFL}_<#if column_has_next>,</#if></#if></#list>);
	
	@Autowired
	private ${table.tableNameJavaFU}Service ${table.tableNameJavaFL}Service;

	@Override
	public BaseService<${table.tableNameJavaFU}, ${table.pkColumn.typeJava}> getBaseService() {
		return ${table.tableNameJavaFL}Service;
	}

	@Override
	public AbstractExchanger<${table.tableNameJavaFU}VO, ${table.tableNameJavaFU}> getExchanger() {
		return new ${table.tableNameJavaFU}Exchanger();
	}

	@Override
	public List<String> getUpdateColumns() {
		return updateColumns;
	}
	
	@Override
	public BaseResponse<${table.tableNameJavaFU}VO> update(${table.tableNameJavaFU}VO vo, String userId) throws Exception {
		// TODO: vo.setOther...
		return super.update(vo, userId);
	}
	
	@Override
	public BaseResponse<${table.tableNameJavaFU}VO> save(${table.tableNameJavaFU}VO vo, String userId) throws Exception {
		// TODO: vo.setOther...
		return super.save(vo, userId);
	}
}
