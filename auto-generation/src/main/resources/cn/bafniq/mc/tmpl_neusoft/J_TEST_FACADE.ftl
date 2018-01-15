package ${basePack}.${modulePack}.${table.submodelNameLow};

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ${basePack}.${modulePack}.mode.dto.vo.${table.tableNameJavaFU}VO;
import ${basePack}.${modulePack}.api.facade.${table.tableNameJavaFU}Facade;
import com.wmang.mode.utils.base.BaseResponse;
import com.neusoft.framework.utils.FastJSONHelper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext-ccss-${modulePack}-facade-test.xml")
public class ${table.tableNameJavaFU}FacadeTest{
	@Autowired
	private ${table.tableNameJavaFU}Facade ${table.tableNameJavaFL}Facade;
	
	@Test
	public void test() {
		String userId="admin";
		String id="";
		${table.tableNameJavaFU}VO vo=new ${table.tableNameJavaFU}VO();
		List<String> ids=Arrays.asList("");
		// 查找
		try {
			BaseResponse<${table.tableNameJavaFU}VO> response=${table.tableNameJavaFL}Facade.findOne(id);
			System.out.println(FastJSONHelper.serialize(response));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 保存
		try {
			${table.tableNameJavaFL}Facade.save(vo, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 更新
		try {
			${table.tableNameJavaFL}Facade.update(vo, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 删除
		try {
			${table.tableNameJavaFL}Facade.delete(ids, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}