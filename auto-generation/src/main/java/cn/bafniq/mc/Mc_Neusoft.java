package cn.bafniq.mc;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.FastDateFormat;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.ser.std.JsonValueSerializer;
import org.codehaus.jackson.map.util.JSONPObject;

import cn.bafniq.common.util.PropertiesUtil;

/**
 * @Description
 * @Department 美的集团_流程IT_营销系统_电子商务产品
 * @Author wmang
 * @Date 2011年第一版，2014第二版，2015年第三版
 */
public class Mc_Neusoft {
	/*******************
	 * 下面4项必须人工填********************* 原则上
	 * service,dao的Spring访问beanName的来源，取表名的除了T开头以外的字符
	 * controller,service,dao文件名的来源，取表名的除了(T_模块)以外的字符，但有时像T_PLAN_INFO这种表，
	 * controller文件名来源必须定义为PLAN_INFO classPack的定义，就是放controller，service的上级目录
	 ***************************************************/
	// 包路径 TPlanInfo
	public static String classPack = PropertiesUtil.getKeyValue("mc.package.base");
	public static String basePack = PropertiesUtil.getKeyValue("mc.package.base");
	// public static String modulePack =
	// PropertiesUtil.getKeyValue("mc.package.module");
	public static String modulePack = StringUtils.isEmpty(PropertiesUtil.getKeyValue("mc.package.module"))
			? PropertiesUtil.getKeyValue("mc.package.subsystem") : PropertiesUtil.getKeyValue("mc.package.module");
	/**************************************** 上面1项必须人工填 ***************************************************/
	// 二级模块 如user,role,storage,
	// 例如@Component(value="resSuppUserService")
	public static String moduleName = StringUtils.isEmpty(PropertiesUtil.getKeyValue("mc.package.subsystem"))?"":PropertiesUtil.getKeyValue("mc.package.subsystem");
	// 表名
	public static String tableName = "";
	// 表描述
	public static String tableComment = "";
	// 三级模块名，一般取表名的后面一个或者两个单词，例如表 wh_user_right，则取userright
	public static String subModelName =  tableName.toLowerCase().replace("_", "");
	// 注释相关
	// 公司
	public static String company = PropertiesUtil.getKeyValue("mc.annotation.company");
	// 商标
	public static String copyRight = PropertiesUtil.getKeyValue("mc.annotation.copyRight");
	// 作者
	public static String author = PropertiesUtil.getKeyValue("mc.annotation.author");
	// 输入文件位置
	public static String tableFilePath = PropertiesUtil.getKeyValue("mc.src.path");
	// 输入文件名
	public static String tableFileName = PropertiesUtil.getKeyValue("mc.src.fileName");
	// 输出文件位置
	public static String outFilePath = PropertiesUtil.getKeyValue("mc.des.path");
	// 数据库类型
	public static String databaseType = PropertiesUtil.getKeyValue("mc.database.type");

	public static String projectPath=System.getProperty("user.dir").replace("\\", "/");
	// 模板文件位置
	public static String tmplFilePath = projectPath+"/src/main/resources/cn/bafniq/mc/tmpl_nosub";

	public static String baseMapperPackage = PropertiesUtil.getKeyValue("mc.baseMapper.package");
	/********************************************************/
	public static String[] tmplFileNames = { "J_DB", "J_VO", "J_MAPPER", "J_CUSTOMMAPPER",
			"mysql".equals(databaseType) ? "X_MAPPER_MYSQL" : "X_MAPPER_ORACLE", "X_CUSTOMMAPPER", "J_EXCHANGER",
			"J_CONTROL", "mysql".equals(databaseType) ? "S_SQL_MYSQL" : "S_SQL_ORACLE", "X_CONFIG", "P_LIST",
			"P_LIST_JS", "P_VIEW", "P_VIEW_JS", "J_SERVICE", "J_SERVICEIMPL", "J_MGRSERVICE", "J_MGRSERVICEIMPL",
			"J_BIZ", "J_BIZIMPL", "J_FACADE", "J_FACADEIMPL", "P_JSON", "J_TEST_BIZ", "J_TEST_CONTROL", "J_TEST_FACADE",
			"J_TEST_MAPPER", "J_TEST_MGRSERVICE", "J_TEST_SERVICE" };

	public static String[] outFileNames = { "${TABLE_NAME_JAVA}.java", "${TABLE_NAME_JAVA}VO.java",
			"${TABLE_NAME_JAVA}Mapper.java", "${TABLE_NAME_JAVA}ExtMapper.java", "${TABLE_NAME_JAVA}Mapper.xml",
			"${TABLE_NAME_JAVA}ExtMapper.xml", "${TABLE_NAME_JAVA}Exchanger.java", "${TABLE_NAME_JAVA}Controller.java",
			"${TABLE_NAME}.sql", "config.txt", "${SUBMODEL_NAME_LOWER}_list.jsp", "${MODULE_NAME_LOWER}_list.js",
			"${MODULE_NAME_LOWER}_edit.jsp", "${MODULE_NAME_LOWER}_edit.js", "${TABLE_NAME_JAVA}Service.java",
			"${TABLE_NAME_JAVA}ServiceImpl.java", "${TABLE_NAME_JAVA}MgrService.java",
			"${TABLE_NAME_JAVA}MgrServiceImpl.java", "${TABLE_NAME_JAVA}Biz.java", "${TABLE_NAME_JAVA}BizImpl.java",
			"${TABLE_NAME_JAVA}Facade.java", "${TABLE_NAME_JAVA}FacadeImpl.java", "${TABLE_NAME_LOWER}.json",
			"${TABLE_NAME_JAVA}BizTest.java", "${TABLE_NAME_JAVA}ControllerTest.java",
			"${TABLE_NAME_JAVA}FacadeTest.java", "${TABLE_NAME_JAVA}MapperTest.java",
			"${TABLE_NAME_JAVA}MgrServiceTest.java", "${TABLE_NAME_JAVA}ServiceTest.java" };

	public static String[] packages = { "rpc.api.entity.${MODULE_NAME_LOWER}", "rpc.api.dto.vo.${MODULE_NAME_LOWER}",
			"rpc.core.dao.${MODULE_NAME_LOWER}", "rpc.core.dao.${MODULE_NAME_LOWER}", "rpc.sqlmaps", "rpc.sqlmaps",
			"rpc.core.exchanger", "web.${MODULE_PACKAGE}.web.controller.${MODULE_NAME_LOWER}", "", "",
			"web.views.${MODULE_PACKAGE}.${MODULE_NAME_LOWER}", "web.js.${MODULE_PACKAGE}.${MODULE_NAME_LOWER}",
			"web.views.${MODULE_PACKAGE}.${MODULE_NAME_LOWER}", "web.js.${MODULE_PACKAGE}.${MODULE_NAME_LOWER}",
			"rpc.core.service.${MODULE_NAME_LOWER}", "rpc.core.service.impl.${MODULE_NAME_LOWER}",
			"web.${MODULE_PACKAGE}.web.service.${MODULE_NAME_LOWER}", "web.${MODULE_PACKAGE}.web.service.impl.${MODULE_NAME_LOWER}",
			"rpc.core.biz.${MODULE_NAME_LOWER}", "rpc.core.biz.impl.${MODULE_NAME_LOWER}", "rpc.api.facade.${MODULE_NAME_LOWER}",
			"rpc.core.facade.impl.${MODULE_NAME_LOWER}", "zother", "test.${MODULE_NAME_LOWER}",
			"test.${MODULE_NAME_LOWER}", "test.${MODULE_NAME_LOWER}", "test.${MODULE_NAME_LOWER}",
			"test.${MODULE_NAME_LOWER}", "test.${MODULE_NAME_LOWER}", };

	public static void writeFile() throws Exception {
		List<McTable> listTable = new ArrayList<McTable>();
		List<String> contents = McFile.readFile(tableFilePath + File.separator + tableFileName);
		int begin = 0;
		boolean startFlag = false;
		for (int n = 0; n < contents.size(); n++) {
			String line = contents.get(n);
			if (line.startsWith("@@")) {
				startFlag = true;
				begin = n;
				tableName = line.substring(line.indexOf("(") + 1, line.length() - 1);
				subModelName = tableName.substring(tableName.indexOf("_") + 1).replace("_", "").toLowerCase();
//				moduleName = tableName.substring(tableName.indexOf("_") + 1).replace("_", "").toLowerCase();
				tableComment = line.substring(2, line.indexOf("("));
				if (tableComment.endsWith("表")) {
					tableComment = tableComment.substring(0, tableComment.length() - 1);
				}
			} else if (line == null || line.trim().length() < 1 || n == contents.size() - 1) {
				if (startFlag) {
					System.out.println("========tableName:" + tableName);
					McTable table = new McTable();
					List<McColumn> listMcColumn = new ArrayList<McColumn>();
					init(table, listMcColumn, contents.subList(begin + 1, n == contents.size() - 1 ? n + 1 : n));
					listTable.add(table);
					for (int i = 0; i < tmplFileNames.length; i++) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("table", table);
						map.put("listMcColumn", listMcColumn);
						map.put("company", company);
						map.put("copyRight", copyRight);
						map.put("author", author);
						map.put("basePack", basePack);
						map.put("modulePack", modulePack);
						map.put("baseMapperPackage", baseMapperPackage);
						System.out.println(map.toString());
						
						// 否则从模板读取
						String content = McFreeMarkerUtil.getContent(tmplFilePath,tmplFileNames[i], map);
//						String content = McFreeMarkerUtil.getContent(tmplFileNames[i], map);
						String outFullPath = McFile.createPath(outFilePath,
								packages[i].replace("${MODULE_NAME_LOWER}", moduleName.toLowerCase())
										.replace("${SUBMODEL_NAME_LOWER}", subModelName.toLowerCase())
										.replace("${MODULE_PACKAGE}", modulePack.toLowerCase()));
						String outFile = outFullPath + "/" + outFileNames[i]
								.replace("${TABLE_NAME_JAVA}", McUtil.toJavaFirstUpper(table.getTableName()))
								.replace("${TABLE_NAME_JAVA_FL}", McUtil.toJavaFirstLower(table.getTableName()))
								.replace("${TABLE_NAME}", table.getTableName().toUpperCase())
								.replace("${TABLE_NAME_LOWER}", table.getTableName().toLowerCase())
								.replace("${MODULE_NAME_LOWER}", moduleName.toLowerCase())
								.replace("${SUBMODEL_NAME_LOWER}", table.getSubmodelName().toLowerCase())
								.replace("${SUBMODEL_NAME_JAVA_FU}", McUtil.toJavaFirstUpper(table.getSubmodelName()))
								.replace("${SUBMODEL_NAME_JAVA_FL}", McUtil.toJavaFirstLower(table.getSubmodelName()));
						McFile.writeFile(outFile, content);
					}
					startFlag = false;
				}
			}
		}
	}

	public static void init(McTable table, List<McColumn> listColumn, List<String> content) throws Exception {
		if (content != null) {
			listColumn.addAll(McUtil.listMcColumn(content));
		}
		table.setTableName(tableName);
		table.setTableNameLow(tableName.toLowerCase());
		table.setTableNameUp(tableName.toUpperCase());
		table.setTableNameJavaFL(McUtil.toJavaFirstLower(tableName));
		table.setTableNameJavaFU(McUtil.toJavaFirstUpper(tableName));
		table.setTableComment(tableComment);
		table.setClassPath(classPack);
		table.setModelNameUp(moduleName.toUpperCase());
		table.setModelNameLow(moduleName.toLowerCase());
		table.setModelNameJavaFL(McUtil.toJavaFirstLower(moduleName));
		table.setModelNameJavaFU(McUtil.toJavaFirstUpper(moduleName));
		table.setSubmodelName(subModelName);
		table.setSubmodelNameLow(subModelName.toLowerCase());
		table.setSubmodelNameUp(subModelName.toUpperCase());
		table.setSubmodelNameJavaFL(McUtil.toJavaFirstLower(subModelName));
		table.setSubmodelNameJavaFU(McUtil.toJavaFirstUpper(subModelName));
		table.setUrlPath(classPack.replace("cn.bafniq.xrt.", "") + "/" + subModelName);
		for (McColumn column : listColumn) {
			if (column.getDesc() != null && column.getDesc().toLowerCase().contains("pk")) {
				table.setPkColumn(column);
				break;
			}
		}
	}

	public static void main(String args[]) throws Exception {
		writeFile();
	}
}
