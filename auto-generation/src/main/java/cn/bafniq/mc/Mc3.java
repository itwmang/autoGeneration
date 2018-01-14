package cn.bafniq.mc;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import cn.bafniq.common.util.PropertiesUtil;
import cn.bafniq.common.util.ValueUtil;

/**
 * @Description
 * @Department 美的集团_流程IT_营销系统_电子商务产品
 * @Author 陈志光
 * @Date 2011年第一版，2014第二版，2015年第三版
 */
public class Mc3 {
	public static String projectPath=System.getProperty("user.dir").replace("\\", "/");
			
	public static String classPack = PropertiesUtil.getKeyValue("mc3.package.base");
	public static String basePack = PropertiesUtil.getKeyValue("mc3.package.base");
	public static String modulePack = PropertiesUtil.getKeyValue("mc3.package.subsystem");
	
	// 方法信息：类前缀名、方法名、请求类前缀、返回类前缀、描述
	public static String methodinfo = PropertiesUtil.getKeyValue("mc3.methodinfo");
	
	// 公司
	public static String company = PropertiesUtil.getKeyValue("mc3.annotation.company");
	// 商标
	public static String copyRight = PropertiesUtil.getKeyValue("mc3.annotation.copyRight");
	// 作者
	public static String author = PropertiesUtil.getKeyValue("mc3.annotation.author");
	// 模板文件位置
	public static String tmplFilePath = projectPath+"/src/main/resources/cn/bafniq/mc/tmpl_method";
	// 输出文件位置
	public static String outFilePath = projectPath+"/output";
	// web parent项目名
	public static String webproject = PropertiesUtil.getKeyValue("mc3.webproject");
	// rpc parent项目名
	public static String rpcproject = PropertiesUtil.getKeyValue("mc3.rpcproject");
	// workspace 路径
	public static String workspace = PropertiesUtil.getKeyValue("mc3.workspace");
	
	public static String line_separator=System.getProperty("line.separator");
	
	/********************************************************/
	public static String[] tmplFileNames = { 
		"J_CONTROL",
		"J_MGRSERVICE","J_MGRSERVICEIMPL",
		"J_FACADE","J_FACADEIMPL",
		"J_BIZ","J_BIZIMPL",
		"J_REQUEST","J_RESPONSE",
		"J_FACADETEST",
		"X_DUBBOSERVICE","X_DUBBOCLIENT"
	};
	
	public static String[] outFileNames = {
		"${classNameFU}Controller.java",
		"${classNameFU}MgrService.java","${classNameFU}MgrServiceImpl.java",
		"${classNameFU}Facade.java","${classNameFU}FacadeImpl.java",
		"${classNameFU}Biz.java","${classNameFU}BizImpl.java",
		"${requestNameFU}Request.java","${responseNameFU}Response.java",
		"${classNameFU}FacadeTest.java",
		"applicationContext-ccss-${modulePack}-dubbo-provider.xml","applicationContext-ccss-${modulePack}-facade.xml",
	};
	
	public static String[] packages = {
		"${webproject}.ccss-web-${modulePack}-core.src.main.java.com.midea.ccss.web.${modulePack}.controller",
		"${webproject}.ccss-web-${modulePack}-core.src.main.java.com.midea.ccss.web.${modulePack}.service",
		"${webproject}.ccss-web-${modulePack}-core.src.main.java.com.midea.ccss.web.${modulePack}.service.impl",
		"${rpcproject}.ccss-${modulePack}-api.src.main.java.com.midea.ccss.${modulePack}.api.facade",
		"${rpcproject}.ccss-${modulePack}-core.src.main.java.com.midea.ccss.${modulePack}.core.facade.impl",
		"${rpcproject}.ccss-${modulePack}-core.src.main.java.com.midea.ccss.${modulePack}.core.biz",
		"${rpcproject}.ccss-${modulePack}-core.src.main.java.com.midea.ccss.${modulePack}.core.biz.impl",
		"${rpcproject}.ccss-${modulePack}-api.src.main.java.com.midea.ccss.${modulePack}.api.dto.request",
		"${rpcproject}.ccss-${modulePack}-api.src.main.java.com.midea.ccss.${modulePack}.api.dto.response",
		"${rpcproject}.ccss-${modulePack}-core.src.test.java.com.midea.ccss.${modulePack}.core.facade",
		"${rpcproject}.ccss-${modulePack}-rpc.src.main.resources.ccss-${modulePack}-spring",
		"${webproject}.ccss-web-${modulePack}.src.main.resources.spring.${modulePack}"
	};

	public static void writeFile() throws Exception {
		McMethod method=new McMethod();
		
		init(method);
		
		for (int i = 0; i < tmplFileNames.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("m", method);
			map.put("company", company);
			map.put("copyRight", copyRight);
			map.put("author", author);
			map.put("basePack", basePack);
			map.put("modulePack", modulePack);
			
			String packagePath=packages[i].replace("${modulePack}", modulePack).replace("${webproject}", webproject).replace("${rpcproject}", rpcproject);
			String outFullPath = McFile.createPath(workspace,packagePath);
			
			String fileName=outFileNames[i].replace("${modulePack}", modulePack).replace("${classNameFU}", method.getClassNameFU()).replace("${requestNameFU}", method.getRequestNameFU()).replace("${responseNameFU}", method.getResponseNameFU());
			String outFile = outFullPath + "/"+ fileName;
			File file=new File(workspace + "/"+packagePath.replace(".", "/") +"/"+fileName);
			
			List<String> source=null;
			
			// 判断workspace下该文件是否存在
			if (file.exists()) {
				// 如果文件存在，将原文件读取出来
				source=McFile.readFile(workspace + "/"+packagePath.replace(".", "/") +"/"+fileName,"utf-8");
			} else {
				// 否则从模板读取
				String content = McFreeMarkerUtil.getContent(tmplFilePath,tmplFileNames[i], map);
				source=McFile.strToList(content);
			}
			
			if (source==null) {
				throw new Exception ("文件读取错误...");
			}
			
			// 获取方法的内容
			String methodContent = getMethodString(tmplFileNames[i],method,map);
			
			// JAVA文件处理
			if (tmplFileNames[i].startsWith("J")) {
				// 如果要添加的内容不为空，则判断原文件是否存在该方法，否则添加到最后
				if (!ValueUtil.isEmpty(methodContent)) {
					if (!isMethodExists(source,method.getMethodName())) {
						addMethodToTail(source,methodContent,"}");
						
						// 获取import的内容
						String importContent = getMethodString(tmplFileNames[i]+".import",method,map);
						if (importContent!=null) {
							addImport(source,importContent);
						}
					}
				}
			} else {
				// 配置文件处理
				if (!ValueUtil.isEmpty(methodContent)) {
					if (!isWordExists(source,"."+method.getClassNameFU()+"Facade")) {
						addMethodToTail(source,methodContent,"</beans>");
					}
				}
			}
			
			McFile.writeFile(outFile, McFile.listToStr(source));
		}
	}
	
	public static void init (McMethod method) throws Exception {
		String [] infos=methodinfo.split("\\ ");
		if (infos==null||infos.length<4) {
			throw new Exception("配置有误");
		}
		method.setClassName(infos[0]);
		method.setMethodName(infos[1]);
		method.setRequestName(infos[2]);
		method.setResponseName(infos[3]);
		method.setMethodComment(infos[4]);
		
		method.setClassNameFL(method.getClassName().substring(0, 1).toLowerCase()+method.getClassName().substring(1, method.getClassName().length()));
		method.setClassNameFU(method.getClassName().substring(0, 1).toUpperCase()+method.getClassName().substring(1, method.getClassName().length()));
		method.setClassNameLow(method.getClassName().toLowerCase());
		
		method.setMethodNameLow(method.getMethodName().toLowerCase());
		
		method.setRequestNameFL(method.getRequestName().substring(0, 1).toLowerCase()+method.getRequestName().substring(1, method.getRequestName().length()));
		method.setRequestNameFU(method.getRequestName().substring(0, 1).toUpperCase()+method.getRequestName().substring(1, method.getRequestName().length()));
		
		method.setResponseNameFL(method.getResponseName().substring(0, 1).toLowerCase()+method.getResponseName().substring(1, method.getResponseName().length()));
		method.setResponseNameFU(method.getResponseName().substring(0, 1).toUpperCase()+method.getResponseName().substring(1, method.getResponseName().length()));
	}
	
	// 判断方法是否已经存在
	public static boolean isMethodExists(List<String> contents,String methodName) {
		for (String line:contents) {
			if (line.contains(methodName)) {
				if (Arrays.asList(line.replaceAll("\t", " ").replaceAll("\\(", " ").split("\\ ")).contains(methodName)) {
					return true;
				}
			}
		}
		return false;
	}
	
	// 判断单词是否已经存在
	public static boolean isWordExists(List<String> contents,String methodName) {
		for (String line:contents) {
			if (line.contains(methodName)) {
				return true;
			}
		}
		return false;
	}
	
	public static String getMethodString(String type,McMethod method,Map<String, Object> map) throws Exception {
		map.put("type", type);
		String content = McFreeMarkerUtil.getContent(tmplFilePath,"J_METHOD", map);
		return content;
	}
	
	public static List<String> addMethodToTail(List<String> source,String methodContent,String tailStr) {
		int i=source.size()-1;
		for (;i>=0;i--) {
			if (source.get(i).trim().equals(tailStr)) {
				break;
			}
		}
		
		if (i>=0) {
			source.add(i, methodContent);
		}
		
		return source;
	}
	
	public static List<String> addImport(List<String> source,String importContent) {
		source.add(2, importContent);
		
		return source;
	}
	
	public static void main(String args[]) throws Exception {
		writeFile();
		
//		McMethod method=new McMethod();
//		
//		init(method);
//		
//		System.out.println(getMethodString("controller",method));
//		List<String> list=new ArrayList<String>();
//		list.add("{");
//		list.add("123");
//		list.add("}");
//		System.out.println(McFile.listToStr(addMethodToTail(list,"abc")));
	}
}
