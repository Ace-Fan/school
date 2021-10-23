package com.thinkgem.jeesite.modules.sc.entity.teacher;



import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.crud.BaseCrudEntity;
import com.thinkgem.jeesite.modules.card.utils.AESUtil;

/**
 * @title 教师信息表持久层
 * @author wufan
 * @version 2019-12-21
 */
public class ScTeacher extends BaseCrudEntity {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 教师编码
	private String name;		// 教师名称
	private String sex;		// 性别
	private String age;		// 年龄
	private String jgId;		// 字典表籍贯编号
	private String xzId;		// 字典表星座编号
	private String mzId;		// 字典表民族编号
	private String zzmmId;		// 字典表政治面貌编号
	private String sxId;		// 字典表生肖编号
	private String phone;		// 手机号码
	private String emergencyContact;		// 紧急联系人
	private String emergencyTel;		// 紧急联系电话
	private String idNum;		// 身份证号码
	private String wxNum;		// 微信号码
	private String qqNum;		// QQ号码
	private String email;		// 电子邮箱
	private String province;		// 所在省(三级联动)
	private String city;		// 所在市
	private String county;		// 所在区县
	private String address;		// 常住地址(腾讯地图)
	private String lng;		// 经度
	private String lat;		// 纬度
	private String glBirthday;		// 公历生日
	private String nlBirthday;		// 农历生日
	private String registeredAddr;		// 户口所在地
	private String birthAddr;		// 出生地
	private String height;		// 身高
	private String bloodType;		// 血型
	private String hoby;		// 兴趣爱好
	private String teachImg;		// 教师头像(图片上传)
	private String remark;		// 备注
	private String teachCert;   //教师证书
	private String teachBiref; //教师简介
	private String isEnable;		// 是否启用（0：未启用，1：启用）
	private String orderNo;		// 排序号
	
	private String tableName = AESUtil.AESEncode("pulsation", "sc_teacher"); // SQL表名
	
	public ScTeacher() {
		super();
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	@Length(min=0, max=100, message="教师编码长度必须介于 0 和 100 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=0, max=100, message="教师名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=4, message="性别长度必须介于 0 和 4 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=100, message="年龄长度必须介于 0 和 100 之间")
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	@Length(min=0, max=100, message="字典表籍贯编号长度必须介于 0 和 100 之间")
	public String getJgId() {
		return jgId;
	}

	public void setJgId(String jgId) {
		this.jgId = jgId;
	}
	
	@Length(min=0, max=100, message="字典表星座编号长度必须介于 0 和 100 之间")
	public String getXzId() {
		return xzId;
	}

	public void setXzId(String xzId) {
		this.xzId = xzId;
	}
	
	@Length(min=0, max=100, message="字典表民族编号长度必须介于 0 和 100 之间")
	public String getMzId() {
		return mzId;
	}

	public void setMzId(String mzId) {
		this.mzId = mzId;
	}
	
	@Length(min=0, max=100, message="字典表政治面貌编号长度必须介于 0 和 100 之间")
	public String getZzmmId() {
		return zzmmId;
	}

	public void setZzmmId(String zzmmId) {
		this.zzmmId = zzmmId;
	}
	
	@Length(min=0, max=100, message="字典表生肖编号长度必须介于 0 和 100 之间")
	public String getSxId() {
		return sxId;
	}

	public void setSxId(String sxId) {
		this.sxId = sxId;
	}
	
	@Length(min=0, max=100, message="手机号码长度必须介于 0 和 100 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=100, message="紧急联系人长度必须介于 0 和 100 之间")
	public String getEmergencyContact() {
		return emergencyContact;
	}

	public void setEmergencyContact(String emergencyContact) {
		this.emergencyContact = emergencyContact;
	}
	
	@Length(min=0, max=100, message="紧急联系电话长度必须介于 0 和 100 之间")
	public String getEmergencyTel() {
		return emergencyTel;
	}

	public void setEmergencyTel(String emergencyTel) {
		this.emergencyTel = emergencyTel;
	}
	
	@Length(min=0, max=100, message="身份证号码长度必须介于 0 和 100 之间")
	public String getIdNum() {
		return idNum;
	}

	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}
	
	@Length(min=0, max=100, message="微信号码长度必须介于 0 和 100 之间")
	public String getWxNum() {
		return wxNum;
	}

	public void setWxNum(String wxNum) {
		this.wxNum = wxNum;
	}
	
	@Length(min=0, max=100, message="QQ号码长度必须介于 0 和 100 之间")
	public String getQqNum() {
		return qqNum;
	}

	public void setQqNum(String qqNum) {
		this.qqNum = qqNum;
	}
	
	@Length(min=0, max=100, message="电子邮箱长度必须介于 0 和 100 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=100, message="所在省(三级联动)长度必须介于 0 和 100 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	@Length(min=0, max=100, message="所在市长度必须介于 0 和 100 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Length(min=0, max=100, message="所在区县长度必须介于 0 和 100 之间")
	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}
	
	@Length(min=0, max=200, message="常住地址(腾讯地图)长度必须介于 0 和 200 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=50, message="经度长度必须介于 0 和 50 之间")
	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}
	
	@Length(min=0, max=50, message="纬度长度必须介于 0 和 50 之间")
	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getGlBirthday() {
		return glBirthday;
	}

	public void setGlBirthday(String glBirthday) {
		this.glBirthday = glBirthday;
	}
	public String getNlBirthday() {
		return nlBirthday;
	}

	public void setNlBirthday(String nlBirthday) {
		this.nlBirthday = nlBirthday;
	}
	
	@Length(min=0, max=200, message="户口所在地长度必须介于 0 和 200 之间")
	public String getRegisteredAddr() {
		return registeredAddr;
	}

	public void setRegisteredAddr(String registeredAddr) {
		this.registeredAddr = registeredAddr;
	}
	
	@Length(min=0, max=200, message="出生地长度必须介于 0 和 200 之间")
	public String getBirthAddr() {
		return birthAddr;
	}

	public void setBirthAddr(String birthAddr) {
		this.birthAddr = birthAddr;
	}
	
	@Length(min=0, max=200, message="身高长度必须介于 0 和 200 之间")
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
	@Length(min=0, max=200, message="血型长度必须介于 0 和 200 之间")
	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}
	
	@Length(min=0, max=200, message="兴趣爱好长度必须介于 0 和 200 之间")
	public String getHoby() {
		return hoby;
	}

	public void setHoby(String hoby) {
		this.hoby = hoby;
	}
	
	@Length(min=0, max=1000, message="教师头像(图片上传)长度必须介于 0 和 1000 之间")
	public String getTeachImg() {
		return teachImg;
	}

	public void setTeachImg(String teachImg) {
		this.teachImg = teachImg;
	}
	
	@Length(min=0, max=200, message="备注长度必须介于 0 和 200 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Length(min=0, max=4, message="是否启用（0：未启用，1：启用）长度必须介于 0 和 4 之间")
	public String getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(String isEnable) {
		this.isEnable = isEnable;
	}
	
	@Length(min=0, max=20, message="排序号长度必须介于 0 和 20 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getTeachCert() {
		return teachCert;
	}

	public void setTeachCert(String teachCert) {
		this.teachCert = teachCert;
	}

	public String getTeachBiref() {
		return teachBiref;
	}

	public void setTeachBiref(String teachBiref) {
		this.teachBiref = teachBiref;
	}

}