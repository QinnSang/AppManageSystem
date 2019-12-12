package service;

import com.github.pagehelper.PageInfo;
import dto.AppInfoDto;
import pojo.AppInfo;

public interface AppInfoService {

    PageInfo<AppInfo> query(AppInfoDto appInfoDto);

    boolean add(AppInfo appInfo, Long devId);

    boolean delete(Long appId);

    AppInfo queryByAppId(Long appId);

    Boolean updateSingleByAppId(AppInfo appInfo, Long devId);

    AppInfo queryAppDetail(Long appId);
}
