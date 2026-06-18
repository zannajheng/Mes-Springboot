package com.wangziyang.mes.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangziyang.mes.system.entity.SysRoleMenu;
import com.wangziyang.mes.system.mapper.SysRoleMenuMapper;
import com.wangziyang.mes.system.service.ISysRoleMenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements ISysRoleMenuService {

    private static final Logger logger = LoggerFactory.getLogger(SysRoleMenuServiceImpl.class);

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveRoleMenuAuth(String roleId, List<String> menuIds) {
        logger.info("开始保存角色菜单授权, roleId={}, menuIds={}", roleId, menuIds);
        
        QueryWrapper<SysRoleMenu> qw = new QueryWrapper<>();
        qw.eq("role_id", roleId);
        int deleteCount = baseMapper.delete(qw);
        logger.info("删除旧授权记录, 删除数量={}", deleteCount);

        if (menuIds != null && !menuIds.isEmpty()) {
            int insertCount = 0;
            for (String menuId : menuIds) {
                if (org.apache.commons.lang3.StringUtils.isBlank(menuId)) {
                    continue;
                }
                SysRoleMenu rm = new SysRoleMenu();
                rm.setRoleId(roleId);
                rm.setMenuId(menuId);
                baseMapper.insert(rm);
                insertCount++;
            }
            logger.info("插入新授权记录, 插入数量={}", insertCount);
        }
        
        // 查询验证
        QueryWrapper<SysRoleMenu> checkQw = new QueryWrapper<>();
        checkQw.eq("role_id", roleId);
        List<SysRoleMenu> checkResult = baseMapper.selectList(checkQw);
        logger.info("验证保存结果, 当前角色{}的授权菜单数量={}", roleId, checkResult.size());
    }
}