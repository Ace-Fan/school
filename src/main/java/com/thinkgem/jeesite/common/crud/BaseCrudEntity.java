package com.thinkgem.jeesite.common.crud;

import java.util.Date;

import com.thinkgem.jeesite.common.utils.PageUtils;

public class BaseCrudEntity extends PageUtils {

	private static final long serialVersionUID = 1L;

	private String id; 				// 编号
	private String code; 			// 编码
	private String name; 			// 名称
	private String isEnable;		// 是否启用
	private String orderNo; 		// 排序号
	private String remark; 			// 备注
	private String createBy; 		// 创建人
	private Date createDate; 		// 创建人
	private String updateBy; 		// 更新人
	private Date updateDate; 		// 创建人
	private Integer delFlag; 		// 删除标记（0：正常；1：删除；2：审核）
	
	private String phone; 			// 手机号码
	private String email; 			// 邮箱
	private String dataSource; 		// 数据来源（1:公众号端 2: android端，3：ios端，4：PC端 5:PC后台）
	
	private String deviceType; 		// 设备类型
	private String deviceBrand; 	// 设备品牌
	private String deviceTypeName; 	// 设备类型名称
	private String deviceBrandName; // 设备品牌名称
	
	private String address;			// 详细地址
	private String lng; 			// 经度
	private String lat; 			// 纬度
	
	private String title;			// 标题名称
	private String content; 		// 内容
	
	private String auditStatu; 		// 认证状态（1：认证中 0:认证失败 2:认证成功 )
	private Date auditDate; 		// 认证日期
	private String auditMsg;		// 认证信息（给认证失败提供认证失败原因-textarea）
	private String auditBy;			// 认证者（即后台认证时认证人员）
	
	private String hitsCount;		// 浏览次数
	private String shareCount;		// 分享次数
	
	private String sex; 			// 性别 (1:男 0:女)
	private Date birthday; 			// 出生年月
	private Date birthdate; 		// 出生年月
	
	private String shortCode;		// 拼音简码
	
	private String tableName;		// 表名
	
	// V19.09.18
	private String typeName;		// 类型名称
	private String typeCode;		// 类型代码
	private String imgWidth;		// 图片宽度
	private String imgHeight;		// 图片高度
	private String imgFormat;		// 图片格式
	private String createOrg;		// 创建机构
	
	private String imgName;			// 图片名称
	private String imgUrl;			// 图片路径
	private String typeId;			// 图片所属类别(关联s_wechat_img_resource的id)
	
	// V19.09.21
	private String province;		// 社区所在省
	private String city;			// 社区所在市
	private String county;			// 社区所在区县
	
	// V19.10.07
	private String appName;
	
	// V19.10.21
	private String checkNameFlag;	// 校验名称是否唯一标识（1：已存在；0：未存在）
	private String checkOrderNoFlag;// 校验排序号是否唯一标识（1：已存在；0：未存在）
	private String checkCodeFlag;	// 校验编码是否唯一标识（1：已存在；0：未存在）
	private String checkContentFlag;// 检验内容是否唯一标识（1：已存在；0：未存在）
	private String checkTitleFlag;	// 检验标题是否唯一标识（1：已存在；0：未存在）
	private String checkFlag;		// 校验唯一标识（1：已存在；0：未存在）
	
	public BaseCrudEntity() {
		super();
	}
	
	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getBirthday() {
		return birthday;
	}
	
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAuditMsg() {
		return auditMsg;
	}

	public void setAuditMsg(String auditMsg) {
		this.auditMsg = auditMsg;
	}

	public String getAuditBy() {
		return auditBy;
	}

	public void setAuditBy(String auditBy) {
		this.auditBy = auditBy;
	}

	public String getHitsCount() {
		return hitsCount;
	}

	public void setHitsCount(String hitsCount) {
		this.hitsCount = hitsCount;
	}

	public String getShareCount() {
		return shareCount;
	}

	public void setShareCount(String shareCount) {
		this.shareCount = shareCount;
	}

	public String getAuditStatu() {
		return auditStatu;
	}

	public void setAuditStatu(String auditStatu) {
		this.auditStatu = auditStatu;
	}

	public Date getAuditDate() {
		return auditDate;
	}

	public void setAuditDate(Date auditDate) {
		this.auditDate = auditDate;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(String isEnable) {
		this.isEnable = isEnable;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	public String getDeviceBrand() {
		return deviceBrand;
	}

	public void setDeviceBrand(String deviceBrand) {
		this.deviceBrand = deviceBrand;
	}

	public String getDeviceTypeName() {
		return deviceTypeName;
	}

	public void setDeviceTypeName(String deviceTypeName) {
		this.deviceTypeName = deviceTypeName;
	}

	public String getDeviceBrandName() {
		return deviceBrandName;
	}

	public void setDeviceBrandName(String deviceBrandName) {
		this.deviceBrandName = deviceBrandName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShortCode() {
		return shortCode;
	}

	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getImgWidth() {
		return imgWidth;
	}

	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}

	public String getImgHeight() {
		return imgHeight;
	}

	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}

	public String getImgFormat() {
		return imgFormat;
	}

	public void setImgFormat(String imgFormat) {
		this.imgFormat = imgFormat;
	}

	public String getCreateOrg() {
		return createOrg;
	}

	public void setCreateOrg(String createOrg) {
		this.createOrg = createOrg;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getCheckNameFlag() {
		return checkNameFlag;
	}

	public void setCheckNameFlag(String checkNameFlag) {
		this.checkNameFlag = checkNameFlag;
	}

	public String getCheckOrderNoFlag() {
		return checkOrderNoFlag;
	}

	public void setCheckOrderNoFlag(String checkOrderNoFlag) {
		this.checkOrderNoFlag = checkOrderNoFlag;
	}

	public String getCheckCodeFlag() {
		return checkCodeFlag;
	}

	public void setCheckCodeFlag(String checkCodeFlag) {
		this.checkCodeFlag = checkCodeFlag;
	}

	public String getCheckContentFlag() {
		return checkContentFlag;
	}

	public void setCheckContentFlag(String checkContentFlag) {
		this.checkContentFlag = checkContentFlag;
	}

	public String getCheckTitleFlag() {
		return checkTitleFlag;
	}

	public void setCheckTitleFlag(String checkTitleFlag) {
		this.checkTitleFlag = checkTitleFlag;
	}

	public String getCheckFlag() {
		return checkFlag;
	}

	public void setCheckFlag(String checkFlag) {
		this.checkFlag = checkFlag;
	}
	
}