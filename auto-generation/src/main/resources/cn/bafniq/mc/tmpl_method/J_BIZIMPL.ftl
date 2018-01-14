package ${basePack}.${modulePack}.core.biz.impl;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.framework.api.exchanger.AbstractExchanger;
import com.neusoft.framework.api.dto.response.BaseResponse;
import com.midea.css.common.exception.BaseException;
import ${basePack}.${modulePack}.core.biz.${m.classNameFU}Biz;

 /**
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Service("${m.classNameFL}Biz")
public class ${m.classNameFU}BizImpl implements ${m.classNameFU}Biz {
	
	protected static Logger logger = LoggerFactory.getLogger(${m.classNameFU}BizImpl.class);
}
