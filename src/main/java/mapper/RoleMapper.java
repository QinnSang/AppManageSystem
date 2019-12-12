package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import pojo.Role;

import java.util.List;

@Mapper
public interface RoleMapper {
    void insert(Role role);

    void update(Role role);

    void deleteRoleMenu(Role role);

    void insertRoleMenu(Role role);

    List<Role> queryAllRole();

    List<Role> getRoleByUser(@Param("id") Long id);
}
