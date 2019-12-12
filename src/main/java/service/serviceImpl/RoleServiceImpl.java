package service.serviceImpl;

import mapper.RoleMapper;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Role;
import service.RoleService;
import util.ExcelBean;
import util.ExcelUtil;
import util.IdGen;

import java.util.*;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Override
    public void saveRole(Role role) {
        //增加角色
        if (StringUtils.isBlank(role.getId())){
            role.setId(IdGen.uuid());
            role.setCreateDate(new Date());
            roleMapper.insert(role);
        }//更新角色
        else{
            role.setUpdateDate(new Date());
            roleMapper.update(role);
        }
        // 更新角色与菜单关联
        roleMapper.deleteRoleMenu(role);
        if (role.getMenuList().size() > 0){
            roleMapper.insertRoleMenu(role);
        }
    }

    @Override
    public List<Role> queryAllRole() {
        return roleMapper.queryAllRole();
    }

    @Override
    public XSSFWorkbook exportExcelInfo(String sheetName) throws Exception {
        //根据条件查询数据，把数据装载到一个list中
        List<Role> list = roleMapper.queryAllRole();
        List<ExcelBean> excel=new ArrayList<>();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap<>();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("序号","id",0));
        excel.add(new ExcelBean("角色姓名","name",0));
        excel.add(new ExcelBean("备注","remark",0));
        excel.add(new ExcelBean("创建日期","createDate",0));
        map.put(0, excel);
        //调用ExcelUtil的方法
        xssfWorkbook = ExcelUtil.createExcelFile(Role.class, list, map, sheetName);
        return xssfWorkbook;
    }
}
