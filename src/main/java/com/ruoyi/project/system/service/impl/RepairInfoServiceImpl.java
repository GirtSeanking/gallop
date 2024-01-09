package com.ruoyi.project.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.aspectj.lang.annotation.DataScope;
import com.ruoyi.project.system.domain.CarInfo;
import com.ruoyi.project.system.service.ICarInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.RepairInfoMapper;
import com.ruoyi.project.system.domain.RepairInfo;
import com.ruoyi.project.system.service.IRepairInfoService;

/**
 * 维修信息Service业务层处理
 * 
 * @author gallop
 * @date 2023-09-17
 */
@Service
public class RepairInfoServiceImpl implements IRepairInfoService 
{
    @Autowired
    private RepairInfoMapper repairInfoMapper;

    @Autowired
    private ICarInfoService carInfoService;

    /**
     * 查询维修信息
     * 
     * @param repairId 维修信息主键
     * @return 维修信息
     */
    @Override
    public RepairInfo selectRepairInfoByRepairId(Long repairId)
    {
        return repairInfoMapper.selectRepairInfoByRepairId(repairId);
    }

    /**
     * 查询维修信息列表
     * 
     * @param repairInfo 维修信息
     * @return 维修信息
     */
    @Override
    @DataScope(deptAlias = "d")
    public List<RepairInfo> selectRepairInfoList(RepairInfo repairInfo)
    {
        return repairInfoMapper.selectRepairInfoList(repairInfo);
    }

    /**
     * 新增维修信息
     * 
     * @param repairInfo 维修信息
     * @return 结果
     */
    @Override
    public int insertRepairInfo(RepairInfo repairInfo)
    {
        repairInfo.setCreateTime(DateUtils.getNowDate());
        CarInfo carInfo = carInfoService.selectCarInfoByCarId(repairInfo.getCarId());
        carInfo.setStatus("2");
        carInfoService.updateCarInfo(carInfo);
        return repairInfoMapper.insertRepairInfo(repairInfo);
    }

    /**
     * 修改维修信息
     * 
     * @param repairInfo 维修信息
     * @return 结果
     */
    @Override
    public int updateRepairInfo(RepairInfo repairInfo)
    {
        repairInfo.setUpdateTime(DateUtils.getNowDate());
        CarInfo carInfo = carInfoService.selectCarInfoByCarId(repairInfo.getCarId());
        if ("0".equals(repairInfo.getStatus()) || "2".equals(repairInfo.getStatus())) {
            carInfo.setStatus("0");
            carInfoService.updateCarInfo(carInfo);
        }
        return repairInfoMapper.updateRepairInfo(repairInfo);
    }

    /**
     * 批量删除维修信息
     * 
     * @param repairIds 需要删除的维修信息主键
     * @return 结果
     */
    @Override
    public int deleteRepairInfoByRepairIds(Long[] repairIds)
    {
        return repairInfoMapper.deleteRepairInfoByRepairIds(repairIds);
    }

    /**
     * 删除维修信息信息
     * 
     * @param repairId 维修信息主键
     * @return 结果
     */
    @Override
    public int deleteRepairInfoByRepairId(Long repairId)
    {
        return repairInfoMapper.deleteRepairInfoByRepairId(repairId);
    }
}
