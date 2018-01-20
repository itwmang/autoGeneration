package cn.bafniq.mc;

import java.util.ArrayList;
import java.util.List;

import cn.bafniq.common.util.ValueUtil;

public class McUtil {
	
	public static List<McColumn> listMcColumn(List<String> listContent) throws Exception {
		List<McColumn> list=new ArrayList<McColumn>();
		int i=1;
		for (String line:listContent) {
			String [] columns=line.split("\t");
			
			if (columns!=null&&columns.length>=3) {
				try{
					String name=columns[1].toLowerCase();
					
					if (name.contains(" ")) {
						throw new Exception("字段【"+name+"】存在空格");
					}
					
					if (name.length()>30) {
						throw new Exception("字段【"+name+"】长度超过30");
					}
					
					String type=getType(columns[2]);
					McColumn column=new McColumn();
					column.setComment(columns[0]);
					if (columns.length>=4) {
						if (!ValueUtil.isEmpty(columns[3])) {
							//如果备注包含中文名称，则只取备注作为最终备注
							if (columns[3].contains(columns[0])){
								column.setFullComment(columns[3].trim());
							}
							else{
								column.setFullComment(columns[0]+"，"+columns[3].trim());
							}
						}
					}
					if (ValueUtil.isEmpty(column.getFullComment())) {
						column.setFullComment(columns[0]);
					}
					column.setDataType(type);
					column.setNameLow(name.toLowerCase());
					column.setNameUp(name.toUpperCase());
					column.setNameJavaFL(toJavaFirstLower(name));
					column.setNameJavaFU(toJavaFirstUpper(name));
					
					column.setGetmethod(toGetMethod(name));
					column.setSetmethod(toSetMethod(name));
					
					column.setTypeJava(McJavaDbMap.getJavaType(type));
					column.setTypeJdbc(McJavaDbMap.getJavaJdbcType(type));
					
					column.setIndex(i);
					
					if (columns.length>3) {
						column.setDesc(columns[3].trim());
					}
					
					list.add(column);
				}catch(Exception e){
					e.printStackTrace();
					throw new Exception("第"+i+"行数据异常:" + line);
				}
			} else {
				throw new Exception("第"+i+"行数据异常");
			}
			
			i++;
		}
		return list;
	}
	
	private static String getType(String type) {
		if (type.toLowerCase().startsWith("varchar")) {
			return "varchar";
		}
		if (type.toLowerCase().startsWith("char")) {
			return "char";
		}
		if (type.toLowerCase().startsWith("clob")) {
			return "varchar";
		}
		if (type.toLowerCase().startsWith("int")) {
			return "int";
		}
		if (type.toLowerCase().startsWith("datetime")) {
			return "datetime";
		}
		if (type.toLowerCase().startsWith("bigint")) {
			return "bigint";
		}
		if (type.toLowerCase().startsWith("double")) {
			return "double";
		}
		if (type.toLowerCase().startsWith("decimal")) {
			if (type.contains(",")) {
				return "double";
			}
			else {
				return "bigint";
			}
		}
		
		// 兼容oracle的数字类型判断
		if (type.toLowerCase().startsWith("number")) {
			// 如果定义的类型没有长度定义，则返回number类
			if (!type.contains("(")) {
				return "number";
			}
			String [] lengths=type.substring(type.indexOf("(")+1,type.indexOf(")")).split(",");
			
			if (lengths==null) {
				return null;
			}
			
			// 如果没有小数点
			if (lengths.length==1) {
				Integer length=ValueUtil.toInt(lengths[0]);
				// byte -128~127
				if (length<=2) {
					return "tinyint";
				}
				// int -2147483648~2147483647（10个数字）
				if (length<=9) {
					return "int";
				}
				// long -9223372036854775808~9223372036854775807（19个数字）
				if (length<=18) {
					return "bigint";
				}
			}
			
			return "number";
		}
		
		return type;
	}
	
	/**
	 * 如：ORG_ID 转换成： orgId
	 * _ORG_ID_ 转换成： orgId
	 */
	public static String toJavaFirstLower(String str){
		if (str==null||str.length()<1) {
			return "";
		}
		StringBuffer sb=new StringBuffer();
		boolean flag=false;		// true 当前字符为符号
		boolean first=false;	// false 第一个字母未出现
		for (int i=0;i<str.length();i++) {
			char c=str.charAt(i);
			if (isCharNum(c)) {
				if (flag&&first) {
					sb.append(Character.toUpperCase(c));
				} else {
					sb.append(Character.toLowerCase(c));
				};
				flag=false;
				if (!first) {
					first=true;
				}
			} else {
				flag=true;
			}
		}
		return sb.toString();
	}
	
	/**
	 * 如：T_SYM_ORG 转换成： TSymOrg
	 * _T_SYM_ORG_ 转换成： TSymOrg
	 */
	public static String toJavaFirstUpper(String str){
		if (str==null||str.length()<1) {
			return "";
		}
		StringBuffer sb=new StringBuffer();
		boolean flag=true;
		for (int i=0;i<str.length();i++) {
			char c=str.charAt(i);
			if (isCharNum(c)) {
				if (flag) {
					sb.append(Character.toUpperCase(c));
				} else {
					sb.append(Character.toLowerCase(c));
				};
				flag=false;
			} else {
				flag=true;
			}
		}
		return sb.toString();
	}
	
	/**
	 * get方法
	 */
	public static String toGetMethod(String str){
		if (str==null||str.length()<1) {
			return "";
		}
		return "get"+toJavaFirstUpper(str);
	}
	
	/**
	 * set方法
	 */
	public static String toSetMethod(String str){
		if (str==null||str.length()<1) {
			return "";
		}
		return "set"+toJavaFirstUpper(str);
	}
	
	/**
	 * 判断字符串是否为空
	 */
	public static boolean isStrEmpt(String str){
		if (str==null||str.trim().length()<1){
			return true;
		}
		return false;
	}
	
	/**
	 * 忽略符号与大小写的比较，即只对英文字母和数字进行比较
	 */
	public static boolean isEqualsIgnoreSign(String str1,String str2){
		if (str1==null||str2==null){
			return false;
		}
		char c1;
		char c2;
		int i=0;
		int j=0;
		int res=0;
		while(i<str1.length()&&j<str2.length()){
			c1=str1.charAt(i);
			if (!isCharNum(c1)){
				i++;
				continue;
			}
			c2=str2.charAt(j);
			if (!isCharNum(c2)){
				j++;
				continue;
			}
			res=c1-c2;
			if (!(res==0||res==32||res==-32)){
				return false;
			}
			i++;
			j++;
		}
		if (i<str1.length()){
			while(i<str1.length()){
				if (isCharNum(str1.charAt(i))){
					return false;
				}
				i++;
			}
		}
		if (j<str2.length()){
			while(j<str2.length()){
				if (isCharNum(str2.charAt(j))){
					return false;
				}
				j++;
			}
		}
		return true;
	}
	
	/**
	 * 是否字母或者数字 
	 */
	public static boolean isCharNum(char c){
		if ((c>='A'&&c<='Z')||(c>='a'&&c<='z')||(c>='0'&&c<='9')){
			return true;
		}
		return false;
	}
	
	/**
	 * 是否字母 
	 */
	public static boolean isChar(char c) {
		return ((c>='a'&&c<='z')||(c>='A'&&c<='Z'));
	}
	
	public static void main(String[] args) {
		String type="number(9)";
		System.out.println(type.substring(type.indexOf("(")+1,type.indexOf(")")));
	}
}
