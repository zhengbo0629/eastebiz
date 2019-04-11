package com.eastebiz.entity;

import java.util.Date;

public class Admin {

    private Integer id;
    private String adminName;
    private Date createTime;
    private Date updateTime;
    private String password;

    public Admin() {
    }

    public Admin(Integer id, String adminName, Date createTime, Date updateTime, String password) {
        this.id = id;
        this.adminName = adminName;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", adminName='" + adminName + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", password='" + password + '\'' +
                '}';
    }
}
