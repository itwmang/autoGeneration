package ${basePack}.${modulePack}.api.facade.${table.modelNameLow};

import ${basePack}.${modulePack}.api.dto.vo.${table.modelNameLow}.${table.tableNameJavaFU}VO;
import com.neusoft.framework.api.facade.BaseMgrFacade;

 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}Facade类 
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
public interface ${table.tableNameJavaFU}Facade extends BaseMgrFacade<${table.tableNameJavaFU}VO, ${table.pkColumn.typeJava}> {

}