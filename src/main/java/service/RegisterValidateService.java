package service;

import exception.ServiceException;
import pojo.DevUser;

public interface RegisterValidateService {
    void sendEmail(DevUser devUser);

    void activateUser(String devEmail, String validateCode) throws ServiceException;
}
