package ${basePack}.core.facade.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.api.facade.${m.classNameFU}Facade;
import ${basePack}.core.biz.${m.classNameFU}Biz;
import com.wmang.mode.utils.base.BaseMgrBiz;
import com.neusoft.framework.api.facade.AbstractMgrFacade;
import com.wmang.mode.utils.base.BaseResponse;
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

