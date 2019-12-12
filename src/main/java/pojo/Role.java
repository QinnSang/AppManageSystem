package pojo;

import com.google.common.collect.Lists;
import org.apache.commons.lang.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

//需要引入谷歌的guava依赖

public class Role {
    private String id;

    private String name;

    private String remark;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date createDate;

    private Date updateDate;

    private DevUser createBy;

    private DevUser updateBy;

    private List<Menu> menuList;

    private DevUser devUser;

    public DevUser getDevUser() {
        return devUser;
    }

    public void setDevUser(DevUser devUser) {
        this.devUser = devUser;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }
    public List<Integer> getMenuIdList() {
        List<Integer> menuIdList = Lists.newArrayList();
        for (Menu menu : menuList) {
            menuIdList.add(menu.getId());
        }
        return menuIdList;
    }

    public void setMenuIdList(List<String> menuIdList) {
        menuList = Lists.newArrayList();
        for (String menuId : menuIdList) {
            Menu menu = new Menu();
            menu.setId(Integer.parseInt(menuId));
            menuList.add(menu);
        }
    }

    public String getMenuIds() {
        return StringUtils.join(getMenuIdList(), ",");
    }

    public void setMenuIds(String menuIds) {
        menuList = Lists.newArrayList();
        if (menuIds != null){
            String[] ids = StringUtils.split(menuIds, ",");
            setMenuIdList(Lists.newArrayList(ids));
        }
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public DevUser getCreateBy() {
        return createBy;
    }

    public void setCreateBy(DevUser createBy) {
        this.createBy = createBy;
    }

    public DevUser getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(DevUser updateBy) {
        this.updateBy = updateBy;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}