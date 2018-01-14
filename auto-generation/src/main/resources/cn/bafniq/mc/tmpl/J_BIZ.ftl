package ${basePack}.${modulePack}.core.biz.${table.modelNameLow};

import ${basePack}.${modulePack}.api.dto.vo.${table.modelNameLow}.${table.tableNameJavaFU}VO;
import com.neusoft.framework.api.biz.BaseMgrBiz;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}Biz类</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
public interface ${table.tableNameJavaFU}Biz extends BaseMgrBiz<${table.tableNameJavaFU}VO,${table.pkColumn.typeJava}> {

}
