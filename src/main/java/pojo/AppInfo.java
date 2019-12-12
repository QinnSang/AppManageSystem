package pojo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 采用面向对象的方法：
 * 在AppInfo中：
 *  App需要有多个版本的信息，所以app类中用集合存储APP的版本 List<AppVersion>
 *  App又有多级分类，所以持有三个级别的分类对象
 *  在AppVersion中：
 *  一个id对应一个App，所以APPVersion需要持有一个APPInfo对象
 *  在AppCategory中：
 *  一个分类对象多个App，所以APPCategory持有AppInfo对象的集合属性
 */
public class AppInfo {
    private Long id;

    private String softwareName;

    private String apkName;

    private String supportRom;

    private String interfaceLanguage;

    private BigDecimal softwareSize;

    private Date updateDate;

    private Long devId;

    private String appInfo;

    private Long status;

    private Date onSaledate;

    private Date offSaledate;

    private Long flatformId;

    private Long downloads;

    private Long createdBy;

    private Date creationDate;

    private Long modifyBy;

    private Date modifyDate;
    /**
     * 开发者
     */
    private DevUser devUser;
    /**
     * 修改者
     */
    private DevUser modifyUser;
    /**
     * 创建者
     */
    private DevUser createUser;

    //    private Long categoryLevel1;
////
////    private Long categoryLevel2;
////
////    private Long categoryLevel3;
    //面向对象的方式
    private AppCategory categoryLevel1;

    private AppCategory categoryLevel2;

    private AppCategory categoryLevel3;


    private String logoPicpath;

    private String logoLocpath;

    private Long versionId;
    //所有版本
    private List<AppVersion> appVersions;
    //最新的版本
    private AppVersion latestAppVersion;

    //所属平台
    private DataDictionary flatform;
    //App状态
    private DataDictionary appStatus;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName == null ? null : softwareName.trim();
    }

    public String getApkName() {
        return apkName;
    }

    public void setApkName(String apkName) {
        this.apkName = apkName == null ? null : apkName.trim();
    }

    public String getSupportRom() {
        return supportRom;
    }

    public void setSupportRom(String supportRom) {
        this.supportRom = supportRom == null ? null : supportRom.trim();
    }

    public String getInterfaceLanguage() {
        return interfaceLanguage;
    }

    public void setInterfaceLanguage(String interfaceLanguage) {
        this.interfaceLanguage = interfaceLanguage == null ? null : interfaceLanguage.trim();
    }

    public BigDecimal getSoftwareSize() {
        return softwareSize;
    }

    public void setSoftwareSize(BigDecimal softwareSize) {
        this.softwareSize = softwareSize;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Long getDevId() {
        return devId;
    }

    public void setDevId(Long devId) {
        this.devId = devId;
    }

    public String getAppInfo() {
        return appInfo;
    }

    public void setAppInfo(String appInfo) {
        this.appInfo = appInfo == null ? null : appInfo.trim();
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Date getOnSaledate() {
        return onSaledate;
    }

    public void setOnSaledate(Date onSaledate) {
        this.onSaledate = onSaledate;
    }

    public Date getOffSaledate() {
        return offSaledate;
    }

    public void setOffSaledate(Date offSaledate) {
        this.offSaledate = offSaledate;
    }

    public Long getFlatformId() {
        return flatformId;
    }

    public void setFlatformId(Long flatformId) {
        this.flatformId = flatformId;
    }

    public Long getDownloads() {
        return downloads;
    }

    public void setDownloads(Long downloads) {
        this.downloads = downloads;
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

    public DevUser getDevUser() {
        return devUser;
    }

    public void setDevUser(DevUser devUser) {
        this.devUser = devUser;
    }

    public DevUser getModifyUser() {
        return modifyUser;
    }

    public void setModifyUser(DevUser modifyUser) {
        this.modifyUser = modifyUser;
    }

    public DevUser getCreateUser() {
        return createUser;
    }

    public void setCreateUser(DevUser createUser) {
        this.createUser = createUser;
    }

    public AppCategory getCategoryLevel1() {
        return categoryLevel1;
    }

    public void setCategoryLevel1(AppCategory categoryLevel1) {
        this.categoryLevel1 = categoryLevel1;
    }

    public AppCategory getCategoryLevel2() {
        return categoryLevel2;
    }

    public void setCategoryLevel2(AppCategory categoryLevel2) {
        this.categoryLevel2 = categoryLevel2;
    }

    public AppCategory getCategoryLevel3() {
        return categoryLevel3;
    }

    public void setCategoryLevel3(AppCategory categoryLevel3) {
        this.categoryLevel3 = categoryLevel3;
    }

    public String getLogoPicpath() {
        return logoPicpath;
    }

    public void setLogoPicpath(String logoPicpath) {
        this.logoPicpath = logoPicpath == null ? null : logoPicpath.trim();
    }

    public String getLogoLocpath() {
        return logoLocpath;
    }

    public void setLogoLocpath(String logoLocpath) {
        this.logoLocpath = logoLocpath == null ? null : logoLocpath.trim();
    }

    public Long getVersionId() {
        return versionId;
    }

    public void setVersionId(Long versionId) {
        this.versionId = versionId;
    }

    public List<AppVersion> getAppVersions() {
        return appVersions;
    }

    public void setAppVersions(List<AppVersion> appVersions) {
        this.appVersions = appVersions;
    }

    public AppVersion getLatestAppVersion() {
        return latestAppVersion;
    }

    public void setLatestAppVersion(AppVersion latestAppVersion) {
        this.latestAppVersion = latestAppVersion;
    }

    public DataDictionary getFlatform() {
        return flatform;
    }

    public void setFlatform(DataDictionary flatform) {
        this.flatform = flatform;
    }

    public DataDictionary getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(DataDictionary appStatus) {
        this.appStatus = appStatus;
    }
}