package ${basePack}.${modulePack}.${table.submodelNameLow};

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ${basePack}.${modulePack}.api.entity.${table.tableNameJavaFU};
import ${basePack}.${modulePack}.core.service.${table.tableNameJavaFU}Service;
import com.midea.css.common.dao.CommonExample;
import com.neusoft.framework.utils.FastJSONHelper;

 /**
 * Title: ${table.tableComment}
 * <p>Description: ${table.tableComment}ServiceTest类</p>
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext-cs-${modulePack}-test.xml")
public class ${table.tableNameJavaFU}ServiceTest {
	@Autowired
	private ${table.tableNameJavaFU}Service ${table.tableNameJavaFL}Service;
	
	@Test
	public void test() throws Exception {
		CommonExample example=new CommonExample(1, 1);
		String id="";
		${table.tableNameJavaFU} vo=new ${table.tableNameJavaFU}();
		List<String> columns=Arrays.asList("l") ;
		try {
			int count=${table.tableNameJavaFL}Service.countByCondition(example);
			System.out.println("countByCondition result: "+count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			List<${table.tableNameJavaFU}> ${table.tableNameJavaFU}List=${table.tableNameJavaFL}Service.listByCondition(example);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			long delCount= ${table.tableNameJavaFL}Service.delete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			${table.tableNameJavaFU} ${table.tableNameJavaFL}=${table.tableNameJavaFL}Service.findOne(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			${table.tableNameJavaFU} ${table.tableNameJavaFL}=${table.tableNameJavaFL}Service.save(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			${table.tableNameJavaFU} ${table.tableNameJavaFL}=${table.tableNameJavaFL}Service.update(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			${table.tableNameJavaFU} ${table.tableNameJavaFL}=${table.tableNameJavaFL}Service.updateSelected(vo, columns);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
