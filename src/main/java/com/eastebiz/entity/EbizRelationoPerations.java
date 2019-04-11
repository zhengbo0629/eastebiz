package com.eastebiz.entity;



import java.io.Serializable;

public class EbizRelationoPerations implements Serializable {

    private Integer id;
    private String companyName;
    private String userName;
    private String addStatus;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddStatus() {
        return addStatus;
    }

    public void setAddStatus(String addStatus) {
        this.addStatus = addStatus;
    }





    public EbizRelationoPerations() {
    }

    public EbizRelationoPerations(Integer id, String addStatus) {
        this.id = id;
        this.addStatus = addStatus;
    }

    public EbizRelationoPerations(String companyName, String userName, String addStatus) {
        this.companyName = companyName;
        this.userName = userName;
        this.addStatus = addStatus;
    }

    @Override
    public String toString() {
        return "EbizRelationoPerations{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", userName='" + userName + '\'' +
                ", addStatus='" + addStatus + '\'' +
                '}';
    }
}
