package ${basePack}.${modulePack}.api.dto.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}VO类</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@com.fasterxml.jackson.annotation.JsonIgnoreProperties(ignoreUnknown = true)
@org.codehaus.jackson.annotate.JsonIgnoreProperties(ignoreUnknown = true)
public class ${table.tableNameJavaFU}VO implements Serializable {

	private static final long serialVersionUID = 1L;

	<#list listMcColumn as column>
	/** ${column.comment} **/
	private ${column.typeJava} ${column.nameJavaFL};
	<#if (column.desc)??&&column.desc?index_of("参数")!=-1>
	/** ${column.comment}描述 **/
	private ${column.typeJava} ${column.nameJavaFL}Desc;
	</#if>
	<#if column.typeJava=="Date">
	/** ${column.comment}字符 **/
	private String ${column.nameJavaFL}Str;
	/** ${column.comment}开始 **/
	private String ${column.nameJavaFL}BeginStr;
	/** ${column.comment}结束 **/
	private String ${column.nameJavaFL}EndStr;
	</#if>
	</#list>
	
	<#list listMcColumn as column>
	/** ${column.comment} */
	public ${column.typeJava} ${column.getmethod}() {
		return ${column.nameJavaFL};
	}
	/** ${column.comment} */
	public void ${column.setmethod}(${column.typeJava} ${column.nameJavaFL}) {
		this.${column.nameJavaFL}=${column.nameJavaFL};
	}
	<#if (column.desc)??&&column.desc?index_of("参数")!=-1>
	/** ${column.comment}描述 **/
	public ${column.typeJava} ${column.getmethod}Desc() {
		return ${column.nameJavaFL}Desc;
	}
	/** ${column.comment}描述 **/
	public void ${column.setmethod}Desc(${column.typeJava} ${column.nameJavaFL}Desc) {
		this.${column.nameJavaFL}Desc=${column.nameJavaFL}Desc;
	}
	</#if>
	<#if column.typeJava=="Date">
	/** ${column.comment}字符 **/
	public String ${column.getmethod}Str() {
		return ${column.nameJavaFL}Str;
	}
	/** ${column.comment}字符 **/
	public void ${column.setmethod}Str(String ${column.nameJavaFL}Str) {
		this.${column.nameJavaFL}Str=${column.nameJavaFL}Str;
	}
	/** ${column.comment}开始 **/
	public String ${column.getmethod}BeginStr() {
		return ${column.nameJavaFL}BeginStr;
	}
	/** ${column.comment}开始 **/
	public void ${column.setmethod}BeginStr(String ${column.nameJavaFL}BeginStr) {
		this.${column.nameJavaFL}BeginStr=${column.nameJavaFL}BeginStr;
	}
	/** ${column.comment}结束 **/
	public String ${column.getmethod}EndStr() {
		return ${column.nameJavaFL}EndStr;
	}
	/** ${column.comment}结束 **/
	public void ${column.setmethod}EndStr(String ${column.nameJavaFL}EndStr) {
		this.${column.nameJavaFL}EndStr=${column.nameJavaFL}EndStr;
	}
	</#if>
	</#list>
}
