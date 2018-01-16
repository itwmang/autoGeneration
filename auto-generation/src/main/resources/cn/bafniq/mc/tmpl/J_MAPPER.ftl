package ${basePack}.core.dao.${table.modelNameLow};

import org.springframework.stereotype.Component;
import ${basePack}.mode.entity.${modulePack}.${table.tableNameJavaFU};
import ${baseMapperPackage}.BaseMapper;

 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}Mapper类,工具生成，请勿修改 
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Component("${table.tableNameJavaFL}Mapper")
public interface ${table.tableNameJavaFU}Mapper extends BaseMapper<${table.tableNameJavaFU},${table.pkColumn.typeJava}> {

}