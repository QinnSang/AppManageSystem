package service;

import pojo.Menu;

import java.util.List;

public interface MenuService {
    List<Menu> findAllMenu();

    List<Menu> getMenuList(Long id);
}
