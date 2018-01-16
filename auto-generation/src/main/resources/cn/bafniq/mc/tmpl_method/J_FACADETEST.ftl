package com.midea.ccss.${modulePack}.core.facade;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ${basePack}.api.facade.${m.classNameFU}Facade;
import com.neusoft.framework.utils.FastJSONHelper;
import com.midea.css.common.exception.BaseException;

/**
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/test-ccss-facade.xml")
public class ${m.classNameFU}FacadeTest {
	protected static Logger logger = LoggerFactory.getLogger(${m.classNameFU}FacadeTest.class);
	
	@Autowired
	private ${m.classNameFU}Facade ${m.classNameFL}Facade;

}
