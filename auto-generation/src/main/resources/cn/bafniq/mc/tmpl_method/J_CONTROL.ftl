package ${basePack}.web.core.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ${basePack}.web.core.service.${m.classNameFU}MgrService;
import com.neusoft.cs.core.controller.BaseController;
import com.neusoft.framework.api.dto.response.BasePageResponse;
import com.wmang.mode.utils.base.BaseResponse;
import com.neusoft.framework.api.dto.response.BodyData;
import com.midea.css.common.exception.BaseException;
import com.neusoft.framework.utils.FastJSONHelper;
import com.neusoft.framework.utils.ListCarrier;
import com.neusoft.framework.utils.ValueUtil;

/**
 * Copyright: ${copyRight}
 * Company: ${company}
 * @Author: ${author}
 * @CreateDate: ${.now?string("yyyy-MM")}
 * @version 1.0 初稿
 */
@Controller
public class ${m.classNameFU}Controller extends UserContextController {

	@Autowired
	private ${m.classNameFU}MgrService ${m.classNameFL}MgrService;
	
}
