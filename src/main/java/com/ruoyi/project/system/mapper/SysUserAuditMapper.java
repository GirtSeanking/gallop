package com.ruoyi.project.system.mapper;

import java.util.List;
import com.ruoyi.project.system.domain.SysUserAudit;

/**
 * 用户认证审核Mapper接口
 *
 * @author gallop
 * @date 2023-09-14
 */
public interface SysUserAuditMapper
{
    /**
     * 查询用户认证审核
     *
     * @param userAuditId 用户认证审核主键
     * @return 用户认证审核
     */
    public SysUserAudit selectSysUserAuditByUserAuditId(Long userAuditId);

    /**
     * 查询用户认证审核列表
     *
     * @param sysUserAudit 用户认证审核
     * @return 用户认证审核集合
     */
    public List<SysUserAudit> selectSysUserAuditList(SysUserAudit sysUserAudit);

    /**
     * 新增用户认证审核
     *
     * @param sysUserAudit 用户认证审核
     * @return 结果
     */
    public int insertSysUserAudit(SysUserAudit sysUserAudit);

    /**
     * 修改用户认证审核
     *
     * @param sysUserAudit 用户认证审核
     * @return 结果
     */
    public int updateSysUserAudit(SysUserAudit sysUserAudit);

    /**
     * 删除用户认证审核
     *
     * @param userAuditId 用户认证审核主键
     * @return 结果
     */
    public int deleteSysUserAuditByUserAuditId(Long userAuditId);

    /**
     * 批量删除用户认证审核
     *
     * @param userAuditIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserAuditByUserAuditIds(Long[] userAuditIds);

    public SysUserAudit selectSysUserAuditByUserId(Long userId);
}
