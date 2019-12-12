package service;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import pojo.Role;

import java.util.List;

public interface RoleService {
    void saveRole(Role role);

    List<Role> queryAllRole();

    XSSFWorkbook exportExcelInfo(String sheetName) throws Exception;
}
