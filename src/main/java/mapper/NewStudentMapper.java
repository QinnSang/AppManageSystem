package mapper;

import org.apache.ibatis.annotations.Mapper;
import pojo.NewStudent;

import java.util.List;

@Mapper
public interface NewStudentMapper {
     List<NewStudent> getAllStudent() ;
}
