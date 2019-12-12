package pojo;

import java.beans.Transient;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DevUser {
    private Long id;

    private String devCode;

    private String devName;

    private String devPassword;

    private String devEmail;
    //邮箱激活码
    private String validateCode;
    //注册时间，用于判断激活码是否失效
    private Date creationDate;
    //用户是否激活
    private Integer status;

    private String devInfo;

    private Long createdBy;


    private Long modifyBy;

    private Date modifyDate;

    private List<AppInfo> appInfos;

    private List<Role> roleList;


    /**
     * 设置激活码有效期为两天
     * @return
     */
    @Transient
    public Date getLastActivateTime() {
        Calendar cl = Calendar.getInstance();
        cl.setTime(this.creationDate);
        cl.add(Calendar.DATE , 2);

        return cl.getTime();
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }
    public String getValidateCode() {
        return validateCode;
    }

    public void setValidateCode(String validateCode) {
        this.validateCode = validateCode;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getDevCode() {
        return devCode;
    }

    public void setDevCode(String devCode) {
        this.devCode = devCode == null ? null : devCode.trim();
    }

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName == null ? null : devName.trim();
    }

    public String getDevPassword() {
        return devPassword;
    }

    public void setDevPassword(String devPassword) {
        this.devPassword = devPassword == null ? null : devPassword.trim();
    }

    public String getDevEmail() {
        return devEmail;
    }

    public void setDevEmail(String devEmail) {
        this.devEmail = devEmail == null ? null : devEmail.trim();
    }

    public String getDevInfo() {
        return devInfo;
    }

    public void setDevInfo(String devInfo) {
        this.devInfo = devInfo == null ? null : devInfo.trim();
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(Long modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public List<AppInfo> getAppInfos() {
        return appInfos;
    }

    public void setAppInfos(List<AppInfo> appInfos) {
        this.appInfos = appInfos;
    }
}