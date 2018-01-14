package ${basePack}.${modulePack}.${table.submodelNameLow};

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ${basePack}.${modulePack}.api.dto.vo.${table.modelNameLow}.${table.tableNameJavaFU}VO;
import ${basePack}.${modulePack}.core.biz.${table.modelNameLow}.${table.tableNameJavaFU}Biz;
import com.neusoft.framework.api.dto.response.BaseResponse;


 /**
 * Title: ${table.tableComment}
 * Description: ${table.tableComment}Service类
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext-cs-${modulePack}-test.xml")
public class ${table.tableNameJavaFU}BizTest {

	@Autowired
	private ${table.tableNameJavaFU}Biz ${table.tableNameJavaFL}B;

	@Test
	private void test() {

		String userId = "admin";
		String id = "";
		List<String> ids = Arrays.asList("");
		${table.tableNameJavaFU}VO vo = new ${table.tableNameJavaFU}VO();

		try {
			${table.tableNameJavaFL}B.delete(ids, userId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			BaseResponse<${table.tableNameJavaFU}VO> baseResponse = ${table.tableNameJavaFL}B.findOne(id);
			System.out.println("${table.tableNameJavaFU}BizImplTest.baseResponse:"
					+ baseResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			${table.tableNameJavaFL}B.save(vo, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			${table.tableNameJavaFL}B.update(vo, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}