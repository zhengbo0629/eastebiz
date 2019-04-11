package com.eastebiz.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class EbizStatus implements Serializable{

    private Integer id;
    private Integer companyId;
    private Integer userId;
    private String  status;
    private String starLevel;
    private Integer userPersonalLimit;
    private String userMnote;


    //关系属性
    private   EbizUser ebizUser;
    private EbizCompany ebizCompany;

    //get     set


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStarLevel() {
        return starLevel;
    }

    public void setStarLevel(String starLevel) {
        this.starLevel = starLevel;
    }

    public Integer getUserPersonalLimit() {
        return userPersonalLimit;
    }

    public void setUserPersonalLimit(Integer userPersonalLimit) {
        this.userPersonalLimit = userPersonalLimit;
    }

    public String getUserMnote() {
        return userMnote;
    }

    public void setUserMnote(String userMnote) {
        this.userMnote = userMnote;
    }

    public EbizUser getEbizUser() {
        return ebizUser;
    }

    public void setEbizUser(EbizUser ebizUser) {
        this.ebizUser = ebizUser;
    }

    public EbizCompany getEbizCompany() {
        return ebizCompany;
    }

    public void setEbizCompany(EbizCompany ebizCompany) {
        this.ebizCompany = ebizCompany;
    }

    //构造

    public EbizStatus() {
    }

    //添加

    public EbizStatus(Integer companyId, Integer userId, String status) {
        this.companyId = companyId;
        this.userId = userId;
        this.status = status;
    }

    public EbizStatus(Integer companyId, Integer userId, String status, String starLevel) {
        this.companyId = companyId;
        this.userId = userId;
        this.status = status;
        this.starLevel = starLevel;
    }

    public EbizStatus(Integer companyId, Integer userId, String status, String starLevel, Integer userPersonalLimit) {
        this.companyId = companyId;
        this.userId = userId;
        this.status = status;
        this.starLevel = starLevel;
        this.userPersonalLimit = userPersonalLimit;
    }

    public EbizStatus(Integer companyId, Integer userId, String status, String starLevel, Integer userPersonalLimit, String userMnote) {
        this.companyId = companyId;
        this.userId = userId;
        this.status = status;
        this.starLevel = starLevel;
        this.userPersonalLimit = userPersonalLimit;
        this.userMnote = userMnote;
    }

    //用于修改状态

    public EbizStatus(Integer id, Integer companyId, Integer userId, String status, String starLevel, Integer userPersonalLimit, String userMnote) {
        this.id = id;
        this.companyId = companyId;
        this.userId = userId;
        this.status = status;
        this.starLevel = starLevel;
        this.userPersonalLimit = userPersonalLimit;
        this.userMnote = userMnote;
    }

    public EbizStatus(Integer id, String status) {
        this.id = id;
        this.status = status;
    }

    public EbizStatus(Integer id, String status, String starLevel, Integer userPersonalLimit, String userMnote) {
        this.id = id;
        this.status = status;
        this.starLevel = starLevel;
        this.userPersonalLimit = userPersonalLimit;
        this.userMnote = userMnote;
    }

    public EbizStatus(Integer id, String status, String starLevel, String userMnote) {
        this.id = id;
        this.status = status;
        this.starLevel = starLevel;
        this.userMnote = userMnote;
    }

    //其他

    public EbizStatus(Integer id, Integer companyId, Integer userId, String status, String starLevel, Integer userPersonalLimit, String userMnote, EbizUser ebizUser, EbizCompany ebizCompany) {
        this.id = id;
        this.companyId = companyId;
        this.userId = userId;
        this.status = status;
        this.starLevel = starLevel;
        this.userPersonalLimit = userPersonalLimit;
        this.userMnote = userMnote;
        this.ebizUser = ebizUser;
        this.ebizCompany = ebizCompany;
    }


    //toString


    @Override
    public String toString() {
        return "EbizStatus{" +
                "id=" + id +
                ", companyId=" + companyId +
                ", userId=" + userId +
                ", status='" + status + '\'' +
                ", starLevel='" + starLevel + '\'' +
                ", userPersonalLimit=" + userPersonalLimit +
                ", userMnote='" + userMnote + '\'' +
                ", ebizUser=" + ebizUser +
                ", ebizCompany=" + ebizCompany +
                '}';
    }
}
