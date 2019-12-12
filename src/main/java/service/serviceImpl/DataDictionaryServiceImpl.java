package service.serviceImpl;


import mapper.DataDictionaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.DataDictionary;
import service.DataDictionaryService;

import java.util.List;

@Service("dataDictionaryService")
public class DataDictionaryServiceImpl implements DataDictionaryService {

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;

    @Override
    public List<DataDictionary> queryAllAppStatus() {
        return dataDictionaryMapper.queryAllAppStatus();
    }

    @Override
    public List<DataDictionary> queryAllFlatform() {
        return dataDictionaryMapper.queryAllFlatform();
    }
}
