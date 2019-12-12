package mapper;

import dto.AppInfoDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import pojo.AppInfo;

import java.util.List;

@Mapper
public interface AppInfoMapper {

    List<AppInfo> query(AppInfoDto appInfoDto);

    int add(AppInfo appInfo);

    int delete(@Param("appId") Long appId);

    AppInfo queryByAppId(Long appId);

    int updateSingleByAppId(AppInfo appInfo);

    AppInfo queryAppDetail(@Param("appId") Long appId);
}
