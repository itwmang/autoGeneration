package com.wmang.logis.mode.dto.vo.user;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

 /**
 * Title: 客户主数据
 * Description: 客户主数据VO类
 * @Author: wmang
 * @CreateDate: 2018-01
 * @version 1.0 初稿
 */
@com.fasterxml.jackson.annotation.JsonIgnoreProperties(ignoreUnknown = true)
@org.codehaus.jackson.annotate.JsonIgnoreProperties(ignoreUnknown = true)
public class SysUserVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 主键 **/
	private Integer id;
	/** 账号 **/
	private String account;
	/** 名称 **/
	private String name;
	/** 密码 **/
	private String passwd;
	/** 邮箱 **/
	private String email;
	/** 用户类型 **/
	private String userType;
	/** 用户状态 **/
	private String userStatus;
	/** 电话号码 **/
	private String phone;
	/** 家庭地址 **/
	private String address;
	/** 密码最后修改时间 **/
	private Date version;
	/** 密码最后修改时间字符 **/
	private String versionStr;
	/** 密码最后修改时间开始 **/
	private String versionBeginStr;
	/** 密码最后修改时间结束 **/
	private String versionEndStr;
	/** 账户是否有效 **/
	private String pubValidly;
	/** 备注 **/
	private String pubRemark;
	/** 创建人 **/
	private String pubCreatePerson;
	/** 创建时间 **/
	private Date pubCreateDate;
	/** 创建时间字符 **/
	private String pubCreateDateStr;
	/** 创建时间开始 **/
	private String pubCreateDateBeginStr;
	/** 创建时间结束 **/
	private String pubCreateDateEndStr;
	/** 修改人 **/
	private String pubModiPerson;
	/** 修改时间 **/
	private Date pubModiDate;
	/** 修改时间字符 **/
	private String pubModiDateStr;
	/** 修改时间开始 **/
	private String pubModiDateBeginStr;
	/** 修改时间结束 **/
	private String pubModiDateEndStr;
	
	/** 主键 */
	public Integer getId() {
		return id;
	}
	/** 主键 */
	public void setId(Integer id) {
		this.id=id;
	}
	/** 账号 */
	public String getAccount() {
		return account;
	}
	/** 账号 */
	public void setAccount(String account) {
		this.account=account;
	}
	/** 名称 */
	public String getName() {
		return name;
	}
	/** 名称 */
	public void setName(String name) {
		this.name=name;
	}
	/** 密码 */
	public String getPasswd() {
		return passwd;
	}
	/** 密码 */
	public void setPasswd(String passwd) {
		this.passwd=passwd;
	}
	/** 邮箱 */
	public String getEmail() {
		return email;
	}
	/** 邮箱 */
	public void setEmail(String email) {
		this.email=email;
	}
	/** 用户类型 */
	public String getUserType() {
		return userType;
	}
	/** 用户类型 */
	public void setUserType(String userType) {
		this.userType=userType;
	}
	/** 用户状态 */
	public String getUserStatus() {
		return userStatus;
	}
	/** 用户状态 */
	public void setUserStatus(String userStatus) {
		this.userStatus=userStatus;
	}
	/** 电话号码 */
	public String getPhone() {
		return phone;
	}
	/** 电话号码 */
	public void setPhone(String phone) {
		this.phone=phone;
	}
	/** 家庭地址 */
	public String getAddress() {
		return address;
	}
	/** 家庭地址 */
	public void setAddress(String address) {
		this.address=address;
	}
	/** 密码最后修改时间 */
	public Date getVersion() {
		return version;
	}
	/** 密码最后修改时间 */
	public void setVersion(Date version) {
		this.version=version;
	}
	/** 密码最后修改时间字符 **/
	public String getVersionStr() {
		return versionStr;
	}
	/** 密码最后修改时间字符 **/
	public void setVersionStr(String versionStr) {
		this.versionStr=versionStr;
	}
	/** 密码最后修改时间开始 **/
	public String getVersionBeginStr() {
		return versionBeginStr;
	}
	/** 密码最后修改时间开始 **/
	public void setVersionBeginStr(String versionBeginStr) {
		this.versionBeginStr=versionBeginStr;
	}
	/** 密码最后修改时间结束 **/
	public String getVersionEndStr() {
		return versionEndStr;
	}
	/** 密码最后修改时间结束 **/
	public void setVersionEndStr(String versionEndStr) {
		this.versionEndStr=versionEndStr;
	}
	/** 账户是否有效 */
	public String getPubValidly() {
		return pubValidly;
	}
	/** 账户是否有效 */
	public void setPubValidly(String pubValidly) {
		this.pubValidly=pubValidly;
	}
	/** 备注 */
	public String getPubRemark() {
		return pubRemark;
	}
	/** 备注 */
	public void setPubRemark(String pubRemark) {
		this.pubRemark=pubRemark;
	}
	/** 创建人 */
	public String getPubCreatePerson() {
		return pubCreatePerson;
	}
	/** 创建人 */
	public void setPubCreatePerson(String pubCreatePerson) {
		this.pubCreatePerson=pubCreatePerson;
	}
	/** 创建时间 */
	public Date getPubCreateDate() {
		return pubCreateDate;
	}
	/** 创建时间 */
	public void setPubCreateDate(Date pubCreateDate) {
		this.pubCreateDate=pubCreateDate;
	}
	/** 创建时间字符 **/
	public String getPubCreateDateStr() {
		return pubCreateDateStr;
	}
	/** 创建时间字符 **/
	public void setPubCreateDateStr(String pubCreateDateStr) {
		this.pubCreateDateStr=pubCreateDateStr;
	}
	/** 创建时间开始 **/
	public String getPubCreateDateBeginStr() {
		return pubCreateDateBeginStr;
	}
	/** 创建时间开始 **/
	public void setPubCreateDateBeginStr(String pubCreateDateBeginStr) {
		this.pubCreateDateBeginStr=pubCreateDateBeginStr;
	}
	/** 创建时间结束 **/
	public String getPubCreateDateEndStr() {
		return pubCreateDateEndStr;
	}
	/** 创建时间结束 **/
	public void setPubCreateDateEndStr(String pubCreateDateEndStr) {
		this.pubCreateDateEndStr=pubCreateDateEndStr;
	}
	/** 修改人 */
	public String getPubModiPerson() {
		return pubModiPerson;
	}
	/** 修改人 */
	public void setPubModiPerson(String pubModiPerson) {
		this.pubModiPerson=pubModiPerson;
	}
	/** 修改时间 */
	public Date getPubModiDate() {
		return pubModiDate;
	}
	/** 修改时间 */
	public void setPubModiDate(Date pubModiDate) {
		this.pubModiDate=pubModiDate;
	}
	/** 修改时间字符 **/
	public String getPubModiDateStr() {
		return pubModiDateStr;
	}
	/** 修改时间字符 **/
	public void setPubModiDateStr(String pubModiDateStr) {
		this.pubModiDateStr=pubModiDateStr;
	}
	/** 修改时间开始 **/
	public String getPubModiDateBeginStr() {
		return pubModiDateBeginStr;
	}
	/** 修改时间开始 **/
	public void setPubModiDateBeginStr(String pubModiDateBeginStr) {
		this.pubModiDateBeginStr=pubModiDateBeginStr;
	}
	/** 修改时间结束 **/
	public String getPubModiDateEndStr() {
		return pubModiDateEndStr;
	}
	/** 修改时间结束 **/
	public void setPubModiDateEndStr(String pubModiDateEndStr) {
		this.pubModiDateEndStr=pubModiDateEndStr;
	}
}
