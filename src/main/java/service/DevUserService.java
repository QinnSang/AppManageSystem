package service;

import constant.StateType;
import pojo.DevUser;

public interface DevUserService {
    StateType login(DevUser devUser);

    StateType register(DevUser devUser);

    DevUser queryByName(String userName);
}
