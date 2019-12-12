package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import pojo.DevUser;

import java.util.List;

@Mapper
public interface DevUserMapper {
    List<DevUser> queryByNameAndPwd(DevUser devUser);

    DevUser queryByName(@Param("devCode") String devCode);

    DevUser queryByEmail(@Param("devEmail") String devEmail);

    int register(DevUser devUser);

    int updateDevUser(DevUser devUser);
}
