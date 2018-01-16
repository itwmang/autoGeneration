package ${basePack}.core.dao;

import org.springframework.stereotype.Component;
import ${basePack}.mode.entity.${table.tableNameJavaFU};
import ${baseMapperPackage}.BaseMapper;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}Mapper类,工具生成，请勿修改</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Component("${table.tableNameJavaFL}Mapper")
public interface ${table.tableNameJavaFU}Mapper extends BaseMapper<${table.tableNameJavaFU},${table.pkColumn.typeJava}> {

}