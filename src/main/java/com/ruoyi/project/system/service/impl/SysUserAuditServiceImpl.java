package com.ruoyi.project.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.SysUserAuditMapper;
import com.ruoyi.project.system.domain.SysUserAudit;
import com.ruoyi.project.system.service.ISysUserAuditService;

/**
 * 用户认证审核Service业务层处理
 *
 * @author gallop
 * @date 2023-09-14
 */
@Service
public class SysUserAuditServiceImpl implements ISysUserAuditService
{
    @Autowired
    private SysUserAuditMapper sysUserAuditMapper;

    /**
     * 查询用户认证审核
     *
     * @param userAuditId 用户认证审核主键
     * @return 用户认证审核
     */
    @Override
    public SysUserAudit selectSysUserAuditByUserAuditId(Long userAuditId)
    {
        return sysUserAuditMapper.selectSysUserAuditByUserAuditId(userAuditId);
    }

    /**
     * 查询用户认证审核列表
     *
     * @param sysUserAudit 用户认证审核
     * @return 用户认证审核
     */
    @Override
    public List<SysUserAudit> selectSysUserAuditList(SysUserAudit sysUserAudit)
    {
        return sysUserAuditMapper.selectSysUserAuditList(sysUserAudit);
    }

    /**
     * 新增用户认证审核
     *
     * @param sysUserAudit 用户认证审核
     * @return 结果
     */
    @Override
    public int insertSysUserAudit(SysUserAudit sysUserAudit)
    {
        sysUserAudit.setCreateTime(DateUtils.getNowDate());
        return sysUserAuditMapper.insertSysUserAudit(sysUserAudit);
    }

    /**
     * 修改用户认证审核
     *
     * @param sysUserAudit 用户认证审核
     * @return 结果
     */
    @Override
    public int updateSysUserAudit(SysUserAudit sysUserAudit)
    {
        sysUserAudit.setUpdateTime(DateUtils.getNowDate());
        return sysUserAuditMapper.updateSysUserAudit(sysUserAudit);
    }

    /**
     * 批量删除用户认证审核
     *
     * @param userAuditIds 需要删除的用户认证审核主键
     * @return 结果
     */
    @Override
    public int deleteSysUserAuditByUserAuditIds(Long[] userAuditIds)
    {
        return sysUserAuditMapper.deleteSysUserAuditByUserAuditIds(userAuditIds);
    }

    /**
     * 删除用户认证审核信息
     *
     * @param userAuditId 用户认证审核主键
     * @return 结果
     */
    @Override
    public int deleteSysUserAuditByUserAuditId(Long userAuditId)
    {
        return sysUserAuditMapper.deleteSysUserAuditByUserAuditId(userAuditId);
    }

    @Override
    public SysUserAudit selectSysUserAuditByUserId(Long userId) {
        return sysUserAuditMapper.selectSysUserAuditByUserId(userId);
    }
}
