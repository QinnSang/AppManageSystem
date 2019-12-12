package service;

import pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {
    List<AppCategory> queryAllLevel1();

    List<AppCategory> queryLevel2ByLevel1id(Long level1id);

    List<AppCategory> queryLevel3ByLevel2id(Long level2id);
}
