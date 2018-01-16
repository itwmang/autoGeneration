<#if type=="J_CONTROL">
	/** ${m.methodComment} */
	@RequestMapping(value = "/${modulePack}/${m.classNameLow}/${m.methodNameLow}", method = RequestMethod.POST)
	@ResponseBody
	public BodyData ${m.methodName}(@RequestBody ${m.requestNameFU}Request request) throws Exception {
		BaseResponse<${m.responseNameFU}Response> response=${m.classNameFL}MgrService.${m.methodName}(request, super.getUserAccount());
		return super.success(response);
	}
<#elseif type=="J_CONTROL.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="J_MGRSERVICE">
	/** ${m.methodComment} */
	public BaseResponse<${m.responseNameFU}Response> ${m.methodName}(${m.requestNameFU}Request request, String userAccount) throws BaseException,Exception;
<#elseif type=="J_MGRSERVICE.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="J_MGRSERVICEIMPL">
	/** ${m.methodComment} */
	@Override
	public BaseResponse<${m.responseNameFU}Response> ${m.methodName}(${m.requestNameFU}Request request, String userAccount) throws BaseException,Exception {
		BaseResponse<${m.responseNameFU}Response> response=new BaseResponse<${m.responseNameFU}Response>();
		response.setStatus(false);
		try {
//			request.setOperator(userAccount);
//			request.setOperateTime(new Date());
			${m.responseNameFU}Response facadeResponse=${m.classNameFL}Facade.${m.methodName}(request);
			response.setStatus(true);
			response.setReturnObject(facadeResponse);
		} catch (BaseException e) {
			response.setErrorCode(e.getErrorCode());
			response.setErrorMsg(e.getErrorMsg());
		} catch (Exception e) {
			response.setErrorCode(Constants.ERROR_SYSTEM);
			response.setErrorMsg(e.getMessage());
		}
		return response;
	}
<#elseif type=="J_MGRSERVICEIMPL.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="J_FACADE">
	/** ${m.methodComment} */
	public ${m.responseNameFU}Response ${m.methodName}(${m.requestNameFU}Request request) throws BaseException,Exception;
<#elseif type=="J_FACADE.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="J_FACADEIMPL">
	/** ${m.methodComment} */
	@Override
	public ${m.responseNameFU}Response ${m.methodName}(${m.requestNameFU}Request request) throws BaseException,Exception {
		return ${m.classNameFL}Biz.${m.methodName}(request);
	}
<#elseif type=="J_FACADEIMPL.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="J_BIZ">
	/** ${m.methodComment} */
	public ${m.responseNameFU}Response ${m.methodName}(${m.requestNameFU}Request request) throws BaseException,Exception;
<#elseif type=="J_BIZ.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="J_BIZIMPL">
	/** ${m.methodComment} */
	@Override
	public ${m.responseNameFU}Response ${m.methodName}(${m.requestNameFU}Request request) throws BaseException,Exception {
		//TODO: 请实现...
		return null;
	}
<#elseif type=="J_BIZIMPL.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="J_FACADETEST">
	@Test
	/** ${m.methodComment} */
	public void ${m.methodName}() {
		${m.responseNameFU}Request request=new ${m.responseNameFU}Request();
		// TODO: 设置请求参数值
		try {
			Long start=System.currentTimeMillis();
			logger.debug("${m.classNameFU}FacadeTest_${m.methodName}_start");
			${m.responseNameFU}Response response=${m.classNameFL}Facade.${m.methodName}(request);
			logger.debug("${m.classNameFU}FacadeTest_${m.methodName}_end_usetime_{}",(System.currentTimeMillis()-start));
			System.out.println(FastJSONHelper.serialize(response));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
<#elseif type=="J_FACADETEST.import">
import ${basePack}.api.dto.response.${m.responseNameFU}Response;
import ${basePack}.api.dto.request.${m.requestNameFU}Request;
<#elseif type=="X_DUBBOSERVICE">
	<dubbo:service ref="${m.classNameFL}Facade" interface="${basePack}.api.facade.${m.classNameFU}Facade" timeout="5000" />
	<bean id="${m.classNameFL}Facade" class="${basePack}.core.facade.impl.${m.classNameFU}FacadeImpl" />
<#elseif type=="X_DUBBOCLIENT">
	<dubbo:reference id="${m.classNameFL}Facade" interface="${basePack}.api.facade.${m.classNameFU}Facade" />
<#else></#if>