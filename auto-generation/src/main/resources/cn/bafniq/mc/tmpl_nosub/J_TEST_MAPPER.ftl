package ${basePack}.${table.submodelNameLow};

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ${basePack}.mode.entity.${table.tableNameJavaFU};
import ${basePack}.core.dao.${table.tableNameJavaFU}Mapper;
import com.neusoft.framework.utils.FastJSONHelper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext-cs-${modulePack}-test.xml")
public class ${table.tableNameJavaFU}MapperTest{
	@Autowired
	private ${table.tableNameJavaFU}Mapper ${table.tableNameJavaFL}Mapper;
	
	@Test
	public void test() {
		String id="";
		${table.tableNameJavaFU} vo=new ${table.tableNameJavaFU}();
		// 查找
		try {
			${table.tableNameJavaFU} response = ${table.tableNameJavaFL}Mapper.findOne(id);
			System.out.println(FastJSONHelper.serialize(response));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 保存
		try {
			${table.tableNameJavaFL}Mapper.save(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 更新
		try {
			${table.tableNameJavaFL}Mapper.update(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 删除
		try {
			${table.tableNameJavaFL}Mapper.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}