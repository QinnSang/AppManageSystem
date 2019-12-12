package service;

import pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryService {
    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatform();
}
