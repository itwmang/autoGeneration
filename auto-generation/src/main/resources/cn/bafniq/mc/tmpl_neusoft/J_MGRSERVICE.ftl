package ${basePack}.web.core.service.${table.modelNameLow};

import ${basePack}.mode.dto.vo.${modulePack}.${table.tableNameJavaFU}VO;
import com.neusoft.cs.core.service.BaseMgrService;

 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}MgrService类
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
public interface ${table.tableNameJavaFU}MgrService extends BaseMgrService<${table.tableNameJavaFU}VO,${table.pkColumn.typeJava}> {

}
