package service.serviceImpl;

import mapper.NewStudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.NewStudent;
import service.NewStudentInfoService;

import java.util.List;

@Service("newStudentInfoService")
public class NewStudentInfoServiceImpl implements NewStudentInfoService {

    @Autowired
    private NewStudentMapper newStudentMapper;
    @Override
    public List<NewStudent> getAllStudent() {
        return newStudentMapper.getAllStudent();
    }
}
