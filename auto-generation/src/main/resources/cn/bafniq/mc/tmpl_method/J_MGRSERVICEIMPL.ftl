package ${basePack}.${modulePack}.web.core.service.impl;

import java.util.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${basePack}.${modulePack}.api.facade.${m.classNameFU}Facade;
import ${basePack}.${modulePack}.web.core.service.${m.classNameFU}MgrService;
import com.wmang.mode.utils.base.BaseResponse;
import com.midea.css.common.exception.BaseException;
import com.neusoft.framework.utils.Constants;

/**
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Service("${m.classNameFL}MgrService")
public class ${m.classNameFU}MgrServiceImpl implements ${m.classNameFU}MgrService {
	
	protected Logger logger = LoggerFactory.getLogger(${m.classNameFU}MgrServiceImpl.class);
	
	@Autowired
	private ${m.classNameFU}Facade ${m.classNameFL}Facade;
}
