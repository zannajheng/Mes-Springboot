package com.wangziyang.mes.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangziyang.mes.system.entity.SysRoleMenu;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author SongPeng
 * @since 2020-03-05
 */
public interface ISysRoleMenuService extends IService<SysRoleMenu> {

    /**
     * 保存角色菜单授权（先清除后批量插入，事务保护）
     *
     * @param roleId  角色ID
     * @param menuIds 菜单ID列表
     */
    void saveRoleMenuAuth(String roleId, List<String> menuIds);
}
