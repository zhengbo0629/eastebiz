package com.eastebiz.entity;


import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EbizUser implements Serializable {
        /*
        *  id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FirstName` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CompanyName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PhoneNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateTime` date NULL DEFAULT NULL,
  `UpdateTime` date NULL DEFAULT NULL,
  `Mnote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态  已激活或未激活   active  unactive',
  `UserType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生or 护士   doctor   user',
  `Permissions` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Balance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PersonalLimit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Introducer` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
        **/

    private Integer id;
    private String userName;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private String phoneNumber;
    private String address;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    private String mnote;
    private String status;
    private String userType;
    private String permissions;
    private String balance;
    private String zipCode;
    private String introducer;

    //关系属性
    private  EbizCompany  ebizCompany = new EbizCompany();


    private List<PackageList> packageList = new ArrayList<PackageList>();

    //get set


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getMnote() {
        return mnote;
    }

    public void setMnote(String mnote) {
        this.mnote = mnote;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }


    public String getIntroducer() {
        return introducer;
    }

    public void setIntroducer(String introducer) {
        this.introducer = introducer;
    }

    public List<PackageList> getPackageList() {
        return packageList;
    }

    public void setPackageList(List<PackageList> packageList) {
        this.packageList = packageList;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public EbizCompany getEbizCompany() {
        return ebizCompany;
    }

    public void setEbizCompany(EbizCompany ebizCompany) {
        this.ebizCompany = ebizCompany;
    }

    //构造方法


    public EbizUser() {
    }

    public EbizUser(Integer id) {
        this.id = id;
    }



    public EbizUser(String address) {
        this.address = address;
    }


    //修改信息



    public EbizUser(Integer id, String password, String email, String phoneNumber, String address, String mnote, String status, String userType, String permissions, String balance, String introducer) {
        this.id = id;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.mnote = mnote;
        this.status = status;
        this.userType = userType;
        this.permissions = permissions;
        this.balance = balance;
        this.introducer = introducer;
    }

//注册


    public EbizUser(String userName, String firstName, String lastName, String password, String email, String phoneNumber, String address, Date createTime, String status, String userType, String zipCode, EbizCompany ebizCompany) {
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.createTime = createTime;
        this.status = status;
        this.userType = userType;
        this.zipCode = zipCode;
        this.ebizCompany = ebizCompany;
    }

    public EbizUser(String userName, String firstName, String lastName, String password, String email, String phoneNumber, String address, Date createTime, Date updateTime, String mnote, String status, String userType, String permissions, String balance, String introducer) {
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.mnote = mnote;
        this.status = status;
        this.userType = userType;
        this.permissions = permissions;
        this.balance = balance;
        this.introducer = introducer;
    }

    public EbizUser(String userName, String firstName, String lastName, String password, String email, String phoneNumber, String address, Date createTime, Date updateTime, String mnote, String status, String userType, String permissions, String balance, String introducer, List<PackageList> packageList) {
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.mnote = mnote;
        this.status = status;
        this.userType = userType;
        this.permissions = permissions;
        this.balance = balance;
        this.introducer = introducer;
        this.packageList = packageList;
    }


    public EbizUser(Integer id, String userName, String firstName, String lastName, String password, String email, String phoneNumber, String address, Date createTime, Date updateTime, String mnote, String status, String userType, String permissions, String balance, String introducer, List<PackageList> packageList) {
        this.id = id;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.mnote = mnote;
        this.status = status;
        this.userType = userType;
        this.permissions = permissions;
        this.balance = balance;
        this.introducer = introducer;
        this.packageList = packageList;
    }

    @Override
    public String toString() {
        return "EbizUser{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", mnote='" + mnote + '\'' +
                ", status='" + status + '\'' +
                ", userType='" + userType + '\'' +
                ", permissions='" + permissions + '\'' +
                ", balance='" + balance + '\'' +
                ", introducer='" + introducer + '\'' +
                ", packageList=" + packageList +
                '}';
    }
}