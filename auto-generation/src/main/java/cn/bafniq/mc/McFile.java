package cn.bafniq.mc;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;

public class McFile {
	
	public static String lineSeparator=System.getProperty("line.separator");
	
	/**
	 * 读取文件，并保存到List每行为一单元 
	 */
	public static List<String> readFile(String filePath) {
		BufferedReader br=null;
		String str="";
		List<String> list=new ArrayList<String>();
		try {
			InputStreamReader isr=new InputStreamReader(new FileInputStream(filePath),"UTF-8");
			br=new BufferedReader(isr);
			while ((str=br.readLine())!=null) {
				list.add(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (br!=null) {
				try {
					br.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	public static List<String> readFile(String filePath,String code) {
		BufferedReader br=null;
		String str="";
		List<String> list=new ArrayList<String>();
		try {
			InputStreamReader isr=new InputStreamReader(new FileInputStream(filePath),code);
			br=new BufferedReader(isr);
			while ((str=br.readLine())!=null) {
				list.add(str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (br!=null) {
				try {
					br.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	public static List<String> strToList(String content) {
		String [] contents=content.split(lineSeparator);
		List<String> list=new ArrayList<String>();
		for (String line:contents) {
			list.add(line);
		}
		return list;
	}
	
	public static String listToStr(List<String> list) {
		StringBuilder sb=new StringBuilder();
		boolean firstFlag=true;
		for (String line:list) {
			if (firstFlag) {
				firstFlag=false;
			} else {
				sb.append(lineSeparator);
			}
			sb.append(line);
		}
		return sb.toString();
	}
	
	/**
	 * 读取文件，并保存到List每行为一单元 
	 */
	public static String readFileToString(String filePath) {
		List<String> list=readFile(filePath,"utf-8");
		return listToStr(list);
	}
	
	public static String createPath(String basePath,String subPath) {
		String fullPath=basePath+"/"+subPath.replace(".", "/");
		if (!new File(fullPath).exists()) { 
			new File(fullPath).mkdirs();
		}
		return fullPath;
	}
	
	public static void writeFile(String filePath,String content) {
		try {
            File file = new File(filePath);
            OutputStreamWriter osw = new OutputStreamWriter(new  FileOutputStream(file), "utf-8");
            osw.write(content);   
            osw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	public static void main(String[] args) {
		try {
			String [][] arrays={{"F000001","空气净化器","","1","814907884"},
				{"F000002","塔式空气净化器","F000001","2",""},
				{"F000003","箱式空气净化器","F000001","2",""},
				{"F000004","产品外观信息","F000002","3",""},
				{"F000005","铭牌参数信息","F000002","3",""},
				{"F000006","产品规格信息","F000002","3",""},
				{"F000007","产品基本信息","F000002","3",""},
				{"F000008","其他信息","F000002","3",""}};
			
			for (int i=0;i<arrays.length;i++) {
				String [] objs=arrays[i];
				Map<String,String> map=new HashMap<String,String>();
				
				map.put("typedefineCode", objs[0]);
				map.put("typedefineName", objs[1]);
				map.put("parentCode", objs[2]);
				map.put("typedefineLevel", objs[3]);
				map.put("orgCode", objs[4]);
				
				System.out.println(new ObjectMapper().writeValueAsString(map));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
