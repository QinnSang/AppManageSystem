package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import pojo.Menu;

import java.util.List;

@Mapper
public interface MenuMapper {
    List<Menu> findAllMenu();

    List<Menu> getMenuList(@Param("id") Long id);
}
