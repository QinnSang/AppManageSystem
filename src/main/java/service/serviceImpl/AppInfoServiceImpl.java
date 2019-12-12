package service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dto.AppInfoDto;
import mapper.AppInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.AppInfo;
import pojo.DevUser;
import service.AppInfoService;

import java.util.Date;
import java.util.List;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {

    @Autowired
    private AppInfoMapper appInfoMapper;

    @Override
    public PageInfo<AppInfo> query(AppInfoDto appInfoDto) {
        //防止导出功能没有分页的需求
        if(appInfoDto.getPage()!=null&&appInfoDto.getLimit()!=null)
            PageHelper.startPage(appInfoDto.getPage(),appInfoDto.getLimit());
        List<AppInfo> list=appInfoMapper.query(appInfoDto);
        PageInfo<AppInfo> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public boolean add(AppInfo appInfo, Long devId) {
        DevUser devUser = new DevUser();
        devUser.setId(devId);
        appInfo.setDevUser(devUser);
        appInfo.setDevId(devId);
        appInfo.setCreatedBy(devId);
        appInfo.setModifyBy(devId);
        appInfo.setCreationDate(new Date());
        appInfo.setDownloads((long) 0);
        boolean addFlag=appInfoMapper.add(appInfo)==1?true:false;
        return false;
    }

    @Override
    public boolean delete(Long appId) {
        if(appId!=null){
            return  appInfoMapper.delete(appId)==1?true:false;
        }
        return false;
    }

    @Override
    public AppInfo queryByAppId(Long appId) {
        return appInfoMapper.queryByAppId(appId);
    }

    @Override
    public Boolean updateSingleByAppId(AppInfo appInfo, Long devId) {
        if(appInfo.getId()!=null){
            appInfo.setUpdateDate(new Date());
            appInfo.setModifyDate(new Date());
            DevUser devUser=new DevUser();
            devUser.setId(devId);
            appInfo.setModifyUser(devUser);
            appInfo.setDevUser(devUser);
            appInfo.setModifyBy(devId);
            return appInfoMapper.updateSingleByAppId(appInfo)==1?true:false;
        }
        return false;
    }

    @Override
    public AppInfo queryAppDetail(Long appId) {
        return appInfoMapper.queryAppDetail(appId);
    }
}
