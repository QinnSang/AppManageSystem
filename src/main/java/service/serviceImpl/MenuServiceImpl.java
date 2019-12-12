package service.serviceImpl;

import mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Menu;
import service.MenuService;

import java.util.List;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;
    @Override
    public List<Menu> findAllMenu() {
        return menuMapper.findAllMenu();
    }

    @Override
    public List<Menu> getMenuList(Long id) {
        return menuMapper.getMenuList(id);
    }
}
