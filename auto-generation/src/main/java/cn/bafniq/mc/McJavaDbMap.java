package cn.bafniq.mc;

public class McJavaDbMap {
	static String [] typesDB={"INTEGER","INT","CHAR","VARCHAR","BIGINT","FLOAT","DOUBLE","LONGTEXT","DATETIME","TINYINT","TIMESTAMP","DATE","NUMBER"};
	static String [] typesDbJava={"Integer","Integer","String","String","Long","Float","Double","String","Date","Byte","Date","Date","BigDecimal"};
	static String [] typesDbJavaSql={"Integer","Integer","String","String","Long","BigDecimal","BigDecimal","String","Date","Byte","Date","Date","BigDecimal"};
	static String [] typesDbJavaJdbc={"DECIMAL","DECIMAL","VARCHAR","VARCHAR","DECIMAL","DECIMAL","DECIMAL","VARCHAR","TIMESTAMP","DECIMAL","TIMESTAMP","TIMESTAMP","DECIMAL"};
	static String [] typesDbJavaHBM={"java.lang.Integer","java.lang.Integer","java.lang.String","java.lang.String","java.lang.Long","java.lang.Float","java.lang.Double","java.lang.String","java.util.Date","java.lang.Byte","java.util.Date","java.util.Date","java.math.BigDecimal"};
	
	public static String getJavaType(String dbColumnType){
		for (int i=0;i<typesDB.length;i++) {
			if (typesDB[i].intern().equals(dbColumnType.toUpperCase())) {
				return typesDbJava[i];
			}
		}
		return "";
	}
	
	public static String getJavaSqlType(String dbColumnType){
		for (int i=0;i<typesDB.length;i++) {
			if (typesDB[i].intern().equals(dbColumnType.toUpperCase())) {
				return typesDbJavaSql[i];
			}
		}
		return "";
	}
	
	public static String getJavaJdbcType(String dbColumnType){
		for (int i=0;i<typesDB.length;i++) {
			if (typesDB[i].intern().equals(dbColumnType.toUpperCase())) {
				return typesDbJavaJdbc[i];
			}
		}
		return "";
	}
	
	public static String getJavaHBMType(String dbColumnType){
		for (int i=0;i<typesDB.length;i++) {
			if (typesDB[i].intern().equals(dbColumnType.toUpperCase())) {
				return typesDbJavaHBM[i];
			}
		}
		return "";
	}
}
