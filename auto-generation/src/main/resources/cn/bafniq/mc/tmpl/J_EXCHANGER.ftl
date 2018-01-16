package ${basePack}.core.exchanger.${modulePack};

import java.util.Map;

import com.wmang.logis.mode.utils.DateUtil;
import com.wmang.logis.mode.utils.ValueUtil;
import com.wmang.mode.utils.base.AbstractExchanger;

import ${basePack}.mode.dto.vo.${modulePack}.${table.tableNameJavaFU}VO;
import ${basePack}.mode.entity.${modulePack}.${table.tableNameJavaFU};


 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}Exchanger类 
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
public class ${table.tableNameJavaFU}Exchanger extends AbstractExchanger<${table.tableNameJavaFU}VO,${table.tableNameJavaFU}> {
	
	@Override
	public void dbFillVo(${table.tableNameJavaFU} db,${table.tableNameJavaFU}VO vo) {
		<#list listMcColumn as column>
		vo.${column.setmethod}(db.${column.getmethod}());
		<#if column.typeJava=="Date">
		vo.${column.setmethod}Str(DateUtil.DateToString(db.${column.getmethod}(), "yyyy-MM-dd HH:mm:ss"));
		</#if>
		</#list>
	}
	
	@Override
	public void voFillDb(${table.tableNameJavaFU}VO vo,${table.tableNameJavaFU} db) {
		<#list listMcColumn as column>
		<#if column.typeJava=="Date">
		if (vo.${column.getmethod}()!=null) {
			db.${column.setmethod}(vo.${column.getmethod}());
		} else {
			db.${column.setmethod}(ValueUtil.toDateNull(vo.${column.getmethod}Str()));
		}
		<#else>
		db.${column.setmethod}(vo.${column.getmethod}());
		</#if>
		</#list>
	}
	
	@Override
	public void mapFillVo(Map<String,?> map,${table.tableNameJavaFU}VO vo) {
		<#list listMcColumn as column>
			<#if column.typeJava=="Date">
		vo.${column.setmethod}(ValueUtil.toDateNull(map.get("${column.nameJavaFL}")));
		vo.${column.setmethod}Str(DateUtil.DateToString(vo.${column.getmethod}(), "yyyy-MM-dd HH:mm:ss"));
			<#elseif column.typeJava=="Long">
		vo.${column.setmethod}(ValueUtil.toLongNull(map.get("${column.nameJavaFL}")));
			<#elseif column.typeJava=="Integer">
		vo.${column.setmethod}(ValueUtil.toIntNull(map.get("${column.nameJavaFL}")));
			<#elseif column.typeJava=="Double">
		vo.${column.setmethod}(ValueUtil.toDoubleNull(map.get("${column.nameJavaFL}")));
			<#elseif column.typeJava=="Byte">
		vo.${column.setmethod}(ValueUtil.toDoubleNull(map.get("${column.nameJavaFL}")));
			<#elseif column.typeJava=="BigDecimal">
		vo.${column.setmethod}(ValueUtil.toBigDecimalNull(map.get("${column.nameJavaFL}")));
			<#else>
		vo.${column.setmethod}(ValueUtil.toStr(map.get("${column.nameJavaFL}")));
			</#if>
		</#list>
	}

	@Override
	public ${table.tableNameJavaFU}VO newInstanceV() {
		return new ${table.tableNameJavaFU}VO();
	}

	@Override
	public ${table.tableNameJavaFU} newInstanceD() {
		return new ${table.tableNameJavaFU}();
	}
	
	@Override
	public void dbFillPkVo(${table.tableNameJavaFU} db, ${table.tableNameJavaFU}VO vo) {
		vo.${table.pkColumn.setmethod}(db.${table.pkColumn.getmethod}());
	}
}
