package cn.bafniq.mc;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import cn.bafniq.common.util.PropertiesUtil;

/**
 * @Description
 * @Department 美的集团_流程IT_营销系统_电子商务产品
 * @Author wmang
 * @Date 2011年第一版，2014第二版，2015年第三版
 */
public class Mc_Main {
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
	// 表名tableName
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
	public static String tmplFilePath = projectPath+"/src/main/resources/cn/bafniq/mc/tmpl";

	public static String baseMapperPackage = PropertiesUtil.getKeyValue("mc.baseMapper.package");
	/********************************************************/
	public static String[] tmplFileNames = { "J_DB", "J_VO", "J_MAPPER", "J_CUSTOMMAPPER",
			"mysql".equals(databaseType) ? "X_MAPPER_MYSQL" : "X_MAPPER_ORACLE", "X_CUSTOMMAPPER","J_EXCHANGER",
			"J_CONTROL", "mysql".equals(databaseType) ? "S_SQL_MYSQL" : "S_SQL_ORACLE", "J_SERVICE", "J_SERVICEIMPL", 
			"J_BIZ", "J_BIZIMPL" };

	public static String[] outFileNames = { "${TABLE_NAME_JAVA}.java", "${TABLE_NAME_JAVA}VO.java",
			"${TABLE_NAME_JAVA}Mapper.java", "${TABLE_NAME_JAVA}ExtMapper.java", "${TABLE_NAME_JAVA}Mapper.xml",
			"${TABLE_NAME_JAVA}ExtMapper.xml", "${TABLE_NAME_JAVA}Exchanger.java", "${TABLE_NAME_JAVA}Controller.java",
			"${TABLE_NAME}.sql",  "${TABLE_NAME_JAVA}Service.java",
			"${TABLE_NAME_JAVA}ServiceImpl.java",  "${TABLE_NAME_JAVA}Biz.java", "${TABLE_NAME_JAVA}BizImpl.java" };

	public static String[] packages = { "mode.entity.${MODULE_PACKAGE}", "mode.dto.vo.${MODULE_PACKAGE}",
			"core.dao.${MODULE_PACKAGE}", "core.dao.${MODULE_PACKAGE}", "sqlmaps", "sqlmaps",
			"core.exchanger.${MODULE_PACKAGE}", "core.controller.${MODULE_PACKAGE}","sql", 
			"core.service.${MODULE_PACKAGE}", "core.service.impl.${MODULE_PACKAGE}",
			"core.biz.${MODULE_PACKAGE}", "core.biz.impl.${MODULE_PACKAGE}"};

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
						map.put("subModelName", subModelName);
						map.put("baseMapperPackage", baseMapperPackage);
						System.out.println(map.toString());
						
						// 否则从模板读取
						String content = McFreeMarkerUtil.getContent(tmplFilePath,tmplFileNames[i], map);
//						String content = McFreeMarkerUtil.getContent(tmplFileNames[i], map);
						String outFullPath = McFile.createPath(outFilePath,
								packages[i].replace("${MODULE_PACKAGE}", modulePack.toLowerCase()));
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
		table.setModelNameUp(tableName.toUpperCase());
		table.setModelNameLow(McUtil.toJavaFirstLower(tableName));
		table.setModelNameJavaFL(McUtil.toJavaFirstLower(tableName));
		table.setModelNameJavaFU(McUtil.toJavaFirstUpper(tableName));
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
