package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import pojo.AppCategory;

import java.util.List;

@Mapper
public interface AppCategoryMapper {
    List<AppCategory> queryAllLevel1();

    List<AppCategory> queryLevel2ByLevel1id(@Param("level1id") Long level1id);

    List<AppCategory> queryLevel3ByLevel2id(@Param("level2id") Long level2id);
}
