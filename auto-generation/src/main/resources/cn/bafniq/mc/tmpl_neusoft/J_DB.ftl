package ${basePack}.${modulePack}.mode.entity.${table.modelNameLow};

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}Entity类,工具生成，请勿修改  
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
public class ${table.tableNameJavaFU} implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	<#list listMcColumn as column>
	/** ${column.comment} */
	public final static String ${column.nameJavaFL}_="${column.nameLow}";
	</#list>

	<#list listMcColumn as column>
	/** ${column.comment} */
	private ${column.typeJava} ${column.nameJavaFL};
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
	</#list>
}
