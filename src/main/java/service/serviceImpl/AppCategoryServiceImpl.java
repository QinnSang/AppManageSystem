package service.serviceImpl;

import mapper.AppCategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.AppCategory;
import service.AppCategoryService;

import java.util.List;

@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {

    @Autowired
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryAllLevel1() {
        return appCategoryMapper.queryAllLevel1();
    }

    @Override
    public List<AppCategory> queryLevel2ByLevel1id(Long level1id) {
        return appCategoryMapper.queryLevel2ByLevel1id(level1id);
    }

    @Override
    public List<AppCategory> queryLevel3ByLevel2id(Long level2id) {
        return appCategoryMapper.queryLevel3ByLevel2id(level2id);
    }
}
