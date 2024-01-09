package com.ruoyi.project.system.mapper;

import java.util.List;
import com.ruoyi.project.system.domain.RepairInfo;

/**
 * 维修信息Mapper接口
 * 
 * @author gallop
 * @date 2023-09-17
 */
public interface RepairInfoMapper 
{
    /**
     * 查询维修信息
     * 
     * @param repairId 维修信息主键
     * @return 维修信息
     */
    public RepairInfo selectRepairInfoByRepairId(Long repairId);

    /**
     * 查询维修信息列表
     * 
     * @param repairInfo 维修信息
     * @return 维修信息集合
     */
    public List<RepairInfo> selectRepairInfoList(RepairInfo repairInfo);

    /**
     * 新增维修信息
     * 
     * @param repairInfo 维修信息
     * @return 结果
     */
    public int insertRepairInfo(RepairInfo repairInfo);

    /**
     * 修改维修信息
     * 
     * @param repairInfo 维修信息
     * @return 结果
     */
    public int updateRepairInfo(RepairInfo repairInfo);

    /**
     * 删除维修信息
     * 
     * @param repairId 维修信息主键
     * @return 结果
     */
    public int deleteRepairInfoByRepairId(Long repairId);

    /**
     * 批量删除维修信息
     * 
     * @param repairIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRepairInfoByRepairIds(Long[] repairIds);
}
