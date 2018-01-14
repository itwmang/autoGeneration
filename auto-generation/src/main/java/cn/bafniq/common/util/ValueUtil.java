package cn.bafniq.common.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.regex.Pattern;

public class ValueUtil {
	private static DecimalFormat DecimalFormatter=new DecimalFormat("#.######");
	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat sdf2=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private static Pattern datetimepattern=Pattern.compile("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\s(((0?[0-9])|([2][0-3])|([1][0-9]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
	private static Pattern datepattern=Pattern.compile("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))");

	/**
	 * 对象转字符串
	 * @author: 陈志光
	 * @date: 2014年11月20日上午10:32:48
	 */
	public static String toStrNull(Object value) {
		if (null==value) {
			return null;
		}
		if (value instanceof Double||value instanceof Float) {
			return DecimalFormatter.format(value);
		}
		return value.toString().trim();
	}

	/**
	 * 返回字符串，为空则返回""
	 * Description: 
	 * @author: 陈志光
	 * @date: 2014年11月20日上午10:32:48
	 */
	public static String toStr(Object value) {
		if (null==value) {
			return "";
		}
		if (value instanceof Double||value instanceof Float) {
			return DecimalFormatter.format(value);
		}
		return value.toString().trim();
	}

	/**
	 * 返回整数，为空则返回null
	 * Description: 
	 * @author: 陈志光
	 * @date: 2014年11月20日上午10:32:48
	 */
	public static Integer toIntNull(Object value) {
		if (null==value) {
			return null;
		}
		Integer val=null;
		if (value instanceof String) {
			try {
				val=Integer.valueOf(value.toString());
			} catch (Exception e) {
			}
			if (null==val) {
				try {
					val=Float.valueOf(value.toString()).intValue();
				} catch (Exception er) {
					return null;
				}
			}
			return val;
		}
		if (value instanceof BigDecimal) {
			val=((BigDecimal)value).intValue();
			return val;
		}
		if (value instanceof Number) {
			val=((Number)value).intValue();
			return val;
		}

		return null;
	}

	/**
	 * 返回整数，为空则返回0
	 * Description: 
	 * @author: 陈志光
	 * @date: 2014年11月20日上午10:32:48
	 */
	public static Integer toInt(Object value) {
		if (null==value) {
			return 0;
		}
		Integer val=0;
		if (value instanceof String) {
			try {
				val=Integer.valueOf(value.toString());
			} catch (Exception e) {
			}
			if (null==val) {
				try {
					val=Float.valueOf(value.toString()).intValue();
				} catch (Exception er) {
					return 0;
				}
			}
			return val;
		}
		if (value instanceof BigDecimal) {
			val=((BigDecimal)value).intValue();
			return val;
		}
		if (value instanceof Number) {
			val=((Number)value).intValue();
			return val;
		}

		return 0;
	}

	public static Float toFloatNull(Object value) {
		if (null==value) {
			return null;
		}
		Float val=null;
		if (value instanceof String) {
			try {
				val=Float.valueOf(value.toString());
			} catch (Exception e) {
				return null;
			}
			return val;
		}
		if (value instanceof BigDecimal) {
			val=((BigDecimal)value).floatValue();
			return val;
		}
		if (value instanceof Number) {
			val=((Number)value).floatValue();
			return val;
		}

		return null;
	}

	public static Double toDoubleNull(Object value) {
		if (null==value) {
			return null;
		}
		Double val=null;
		if (value instanceof String) {
			try {
				val=Double.valueOf(value.toString());
			} catch (Exception e) {
			}
			return val;
		}
		if (value instanceof BigDecimal) {
			val=((BigDecimal)value).doubleValue();
			return val;
		}
		if (value instanceof Number) {
			val=((Number)value).doubleValue();
			return val;
		}

		return val;
	}

	public static Double toDouble(Object value) {
		if (null==value) {
			return 0d;
		}
		Double val=0d;
		if (value instanceof String) {
			try {
				val=Double.valueOf(value.toString());
			} catch (Exception e) {
			}
			return val;
		}
		if (value instanceof BigDecimal) {
			val=((BigDecimal)value).doubleValue();
			return val;
		}
		if (value instanceof Number) {
			val=((Number)value).doubleValue();
			return val;
		}

		return val;
	}

	public static Long toLongNull(Object value) {
		if (null==value) {
			return null;
		}
		Long val=null;
		if (value instanceof String) {
			try {
				val=Long.valueOf(value.toString());
			} catch (Exception e) {
			}
			if (null==val) {
				try {
					val=Double.valueOf(value.toString()).longValue();
				} catch (Exception er) {
				}
			}
			return val;
		}
		if (value instanceof BigDecimal) {
			val=((BigDecimal)value).longValue();
			return val;
		}
		if (value instanceof Number) {
			val=((Number)value).longValue();
			return val;
		}

		return val;
	}

	public static Long toLong(Object value) {
		if (null==value) {
			return 0l;
		}
		Long val=0l;
		if (value instanceof String) {
			try {
				val=Long.valueOf(value.toString());
			} catch (Exception e) {
			}
			if (null==val) {
				try {
					val=Double.valueOf(value.toString()).longValue();
				} catch (Exception er) {
				}
			}
			return val;
		}
		if (value instanceof BigDecimal) {
			val=((BigDecimal)value).longValue();
			return val;
		}
		if (value instanceof Number) {
			val=((Number)value).longValue();
			return val;
		}

		return val;
	}

	public static Date toDateNull(Object value) {
		if (null==value) {
			return null;
		}

		if (value instanceof Date) {
			return (Date)value;
		}

		if ((value instanceof Integer)||(value instanceof Long)) {
			try {
				return new Date(Long.parseLong(value.toString()));
			} catch (Exception e) {
				return null;
			}
		}

		if ((value instanceof String)&&(value.toString().trim().length()>0)) {
			if (datepattern.matcher(value.toString()).matches()) {
				try {
					return sdf.parse(value+" 00:00:00");
				} catch (Exception e) {
				}
				try {
					return sdf2.parse(value+" 00:00:00");
				} catch (Exception e) {
				}
				return null;
			} else if (datetimepattern.matcher(value.toString()).matches()) {
				try {
					return sdf.parse(value.toString());
				} catch (Exception e) {
				}
				try {
					return sdf2.parse(value.toString());
				} catch (Exception e) {
				}
				return null;
			} else {
				boolean flag=true;
				for (char c:((String)value).toCharArray()) {
					if (c>='0'&&c<='9') {
						continue;
					} else {
						flag=false;
						break;
					}
				}
				if (flag) {
					try {
						return new Date(Long.parseLong(value.toString()));
					} catch (Exception e) {
						return null;
					}
				} else {
					return null;
				}
			}
		}
		return null;
	}
	
	/**
	 * @Description 转换BigDecimal
	 * @author 陈志光
	 */
	public static BigDecimal toBigDecimalNull(Object value) {
		if (null==value) {
			return null;
		}
		
		try {
			BigDecimal deciaml=new BigDecimal(value+"");
			
			return deciaml;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 判断是否相等
	 */
	public static boolean equals(Object value1,Object value2) {
		if (null==value1||null==value2) {
			return false;
		}
		return value1.equals(value2);
	}

	// 浮点型判断
	public static boolean isDecimal(String str) {
		if (null==str||"".equals(str))
			return false;
		Pattern pattern=Pattern.compile("[0-9]*(\\.?)[0-9]*");
		return pattern.matcher(str).matches();
	}

	// 整型判断
	public static boolean isInteger(String str) {
		if (null==str)
			return false;
		Pattern pattern=Pattern.compile("[0-9]+");
		return pattern.matcher(str).matches();
	}

	public static String lpad(String str,int n,String padStr) {
		while (str.length()<n) {
			str=padStr+str;
		}
		return str;
	}
	public static String rpad(String str,int n,String padStr) {
		while (str.length()<n) {
			str=str+padStr;
		}
		return str;
	}

	/**
	 * 判断对象是否为空，字符串，集合，数组
	 * Description: 
	 * @author: 陈志光
	 * @date: 2014年11月20日上午10:32:48
	 */
	
	
	public static boolean isEmpty(Object obj) {
		if (null==obj) {
			return true;
		}
		if (obj instanceof String) {
			return ((String)obj).trim().length()==0;
		}
		if (obj instanceof Collection) {
			return ((Collection<?>)(obj)).size()==0;
		}
		if (obj instanceof Object[]) {
			return ((Object[])(obj)).length==0;
		}
		return false;
	}
	
	/**
	 * @Description: 比较
	 * @author: 陈志光
	 * @date: 2014年11月20日上午10:32:48
	 */
	public static int compare(Object value1,Object value2) {
		if (value1 instanceof String) {
			return ValueUtil.toStr(value1).compareTo(ValueUtil.toStr(value2));
		}
		if (value1 instanceof Number) {
			return ValueUtil.toDouble(value1).compareTo(ValueUtil.toDouble(value2));
		}
		return 0;
	}

	public static void main(String[] args) throws Exception {
		System.out.println(toStrNull(new Double(123121231233123.123123123123)));
	}
}
