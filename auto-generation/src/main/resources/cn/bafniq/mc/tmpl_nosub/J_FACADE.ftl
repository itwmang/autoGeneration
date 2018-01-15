package ${basePack}.${modulePack}.api.facade;

import ${basePack}.${modulePack}.mode.dto.vo.${table.tableNameJavaFU}VO;
import com.neusoft.framework.api.facade.BaseMgrFacade;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}Facade类</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
public interface ${table.tableNameJavaFU}Facade extends BaseMgrFacade<${table.tableNameJavaFU}VO, ${table.pkColumn.typeJava}> {

}