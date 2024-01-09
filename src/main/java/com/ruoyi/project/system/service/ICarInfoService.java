package com.ruoyi.project.system.service;

import java.util.List;
import com.ruoyi.project.system.domain.CarInfo;

/**
 * 车辆信息Service接口
 * 
 * @author gallop
 * @date 2023-09-11
 */
public interface ICarInfoService 
{
    /**
     * 查询车辆信息
     * 
     * @param carId 车辆信息主键
     * @return 车辆信息
     */
    public CarInfo selectCarInfoByCarId(Long carId);

    /**
     * 查询车辆信息列表
     * 
     * @param carInfo 车辆信息
     * @return 车辆信息集合
     */
    public List<CarInfo> selectCarInfoList(CarInfo carInfo);

    /**
     * 新增车辆信息
     * 
     * @param carInfo 车辆信息
     * @return 结果
     */
    public int insertCarInfo(CarInfo carInfo);

    /**
     * 修改车辆信息
     * 
     * @param carInfo 车辆信息
     * @return 结果
     */
    public int updateCarInfo(CarInfo carInfo);

    /**
     * 批量删除车辆信息
     * 
     * @param carIds 需要删除的车辆信息主键集合
     * @return 结果
     */
    public int deleteCarInfoByCarIds(Long[] carIds);

    /**
     * 删除车辆信息信息
     * 
     * @param carId 车辆信息主键
     * @return 结果
     */
    public int deleteCarInfoByCarId(Long carId);

    public List<CarInfo> selectCarInfoListForCustomer(CarInfo carInfo);
}
