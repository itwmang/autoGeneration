package cn.bafniq.mc;
import java.io.BufferedWriter;
import java.io.File;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class McFreeMarkerUtil {
	private static Configuration OAConfig = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
	
	private static Logger log = LoggerFactory.getLogger(McFreeMarkerUtil.class);

	static {
		OAConfig.setClassForTemplateLoading(McFreeMarkerUtil.class, "tmpl");
		OAConfig.setEncoding(Locale.getDefault(), "UTF-8");
	}

	public static String getContent(String tmplName, Map<String, Object> root) throws Exception {
		String templateName = ""+tmplName + ".ftl";

		String templateEncoding = "UTF-8";

		StringWriter stringWriter = new StringWriter();

		try {
			BufferedWriter writer = new BufferedWriter(stringWriter);
			Template template = OAConfig.getTemplate(templateName, templateEncoding);
			template.process(root, writer);
		} catch (Exception e) {
			log.error("Unchecked exception", e);
			throw new Exception("Unchecked exception",e);
		}

		return stringWriter.toString();
	}
	
	public static String getContent(String dir,String tmplName,Map<String, Object> root) throws Exception {
		String templateName = ""+tmplName + ".ftl";

		String templateEncoding = "UTF-8";

		StringWriter stringWriter = new StringWriter();

		try {
			OAConfig.setDirectoryForTemplateLoading(new File(dir));
			BufferedWriter writer = new BufferedWriter(stringWriter);
			Template template = OAConfig.getTemplate(templateName, templateEncoding);
			template.process(root, writer);
		} catch (Exception e) {
			log.error("Unchecked exception", e);
			throw new Exception("Unchecked exception",e);
		}

		return stringWriter.toString();
	}
	
	public static void main(String args[]) throws Exception {
		// System.out.println(getContent("J_VO",new HashMap()));
		
		System.out.println(getContent("D:/midea_develop/workspace_css/c_css/Css-MC/src/main/resources/cn/bafniq/mc/tmpl_method","J_CONTROL", new HashMap<String,Object>()));
	}
}
