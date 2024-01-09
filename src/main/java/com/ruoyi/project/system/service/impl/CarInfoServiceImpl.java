package com.ruoyi.project.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.aspectj.lang.annotation.DataScope;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.CarInfoMapper;
import com.ruoyi.project.system.domain.CarInfo;
import com.ruoyi.project.system.service.ICarInfoService;

/**
 * 车辆信息Service业务层处理
 * 
 * @author gallop
 * @date 2023-09-11
 */
@Service
public class CarInfoServiceImpl implements ICarInfoService 
{
    @Autowired
    private CarInfoMapper carInfoMapper;

    /**
     * 查询车辆信息
     * 
     * @param carId 车辆信息主键
     * @return 车辆信息
     */
    @Override
    public CarInfo selectCarInfoByCarId(Long carId)
    {
        return carInfoMapper.selectCarInfoByCarId(carId);
    }

    /**
     * 查询车辆信息列表
     * 
     * @param carInfo 车辆信息
     * @return 车辆信息
     */
    @Override
    @DataScope(deptAlias = "d")
    public List<CarInfo> selectCarInfoList(CarInfo carInfo)
    {
        return carInfoMapper.selectCarInfoList(carInfo);
    }

    /**
     * 新增车辆信息
     * 
     * @param carInfo 车辆信息
     * @return 结果
     */
    @Override
    public int insertCarInfo(CarInfo carInfo)
    {
        carInfo.setCreateTime(DateUtils.getNowDate());
        return carInfoMapper.insertCarInfo(carInfo);
    }

    /**
     * 修改车辆信息
     * 
     * @param carInfo 车辆信息
     * @return 结果
     */
    @Override
    public int updateCarInfo(CarInfo carInfo)
    {
        carInfo.setUpdateTime(DateUtils.getNowDate());
        return carInfoMapper.updateCarInfo(carInfo);
    }

    /**
     * 批量删除车辆信息
     * 
     * @param carIds 需要删除的车辆信息主键
     * @return 结果
     */
    @Override
    public int deleteCarInfoByCarIds(Long[] carIds)
    {
        return carInfoMapper.deleteCarInfoByCarIds(carIds);
    }

    /**
     * 删除车辆信息信息
     * 
     * @param carId 车辆信息主键
     * @return 结果
     */
    @Override
    public int deleteCarInfoByCarId(Long carId)
    {
        return carInfoMapper.deleteCarInfoByCarId(carId);
    }

    @Override
    public List<CarInfo> selectCarInfoListForCustomer(CarInfo carInfo) {
        carInfo.setStatus("0");
        return carInfoMapper.selectCarInfoList(carInfo);
    }
}
