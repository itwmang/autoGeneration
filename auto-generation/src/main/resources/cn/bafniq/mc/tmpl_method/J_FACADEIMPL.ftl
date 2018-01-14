package ${basePack}.${modulePack}.core.facade.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.${modulePack}.api.facade.${m.classNameFU}Facade;
import ${basePack}.${modulePack}.core.biz.${m.classNameFU}Biz;
import com.neusoft.framework.api.biz.BaseMgrBiz;
import com.neusoft.framework.api.facade.AbstractMgrFacade;
import com.neusoft.framework.api.dto.response.BaseResponse;
import com.midea.css.common.exception.BaseException;

 /**
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Service("${m.classNameFL}Facade")
public class ${m.classNameFU}FacadeImpl implements ${m.classNameFU}Facade {
	
	protected static Logger logger = LoggerFactory.getLogger(${m.classNameFU}FacadeImpl.class);
	
	@Autowired
	private ${m.classNameFU}Biz ${m.classNameFL}Biz;
}

