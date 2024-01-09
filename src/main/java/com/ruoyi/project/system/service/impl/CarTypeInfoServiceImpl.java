package com.ruoyi.project.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.system.domain.CarInfo;
import com.ruoyi.project.system.service.ICarInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.CarTypeInfoMapper;
import com.ruoyi.project.system.domain.CarTypeInfo;
import com.ruoyi.project.system.service.ICarTypeInfoService;

/**
 * 车型信息Service业务层处理
 * 
 * @author gallop
 * @date 2023-09-11
 */
@Service
public class CarTypeInfoServiceImpl implements ICarTypeInfoService 
{
    @Autowired
    private CarTypeInfoMapper carTypeInfoMapper;

    @Autowired
    private ICarInfoService carInfoService;

    /**
     * 查询车型信息
     * 
     * @param carTypeId 车型信息主键
     * @return 车型信息
     */
    @Override
    public CarTypeInfo selectCarTypeInfoByCarTypeId(Long carTypeId)
    {
        return carTypeInfoMapper.selectCarTypeInfoByCarTypeId(carTypeId);
    }

    /**
     * 查询车型信息列表
     * 
     * @param carTypeInfo 车型信息
     * @return 车型信息
     */
    @Override
    public List<CarTypeInfo> selectCarTypeInfoList(CarTypeInfo carTypeInfo)
    {
        return carTypeInfoMapper.selectCarTypeInfoList(carTypeInfo);
    }

    /**
     * 新增车型信息
     * 
     * @param carTypeInfo 车型信息
     * @return 结果
     */
    @Override
    public int insertCarTypeInfo(CarTypeInfo carTypeInfo)
    {
        carTypeInfo.setCreateTime(DateUtils.getNowDate());
        return carTypeInfoMapper.insertCarTypeInfo(carTypeInfo);
    }

    /**
     * 修改车型信息
     * 
     * @param carTypeInfo 车型信息
     * @return 结果
     */
    @Override
    public int updateCarTypeInfo(CarTypeInfo carTypeInfo)
    {
        carTypeInfo.setUpdateTime(DateUtils.getNowDate());
        return carTypeInfoMapper.updateCarTypeInfo(carTypeInfo);
    }

    /**
     * 批量删除车型信息
     * 
     * @param carTypeIds 需要删除的车型信息主键
     * @return 结果
     */
    @Override
    public AjaxResult deleteCarTypeInfoByCarTypeIds(Long[] carTypeIds)
    {
        boolean deleteState = true;
        Long carTypeId = -1L;
        for (Long id : carTypeIds) {
            CarInfo item = new CarInfo();
            item.setCarTypeId(id);
            List result = carInfoService.selectCarInfoList(item);
            if (result.size() > 0) {
                deleteState = false;
                carTypeId = id;
                break;
            }
        }
        if (deleteState) {
            return AjaxResult.success(carTypeInfoMapper.deleteCarTypeInfoByCarTypeIds(carTypeIds));
        } else {
            CarTypeInfo carTypeInfo = carTypeInfoMapper.selectCarTypeInfoByCarTypeId(carTypeId);
            return AjaxResult.error("删除失败，车型名称为" + carTypeInfo.getCarTypeName() + "的数据下存在车辆");
        }
    }

    /**
     * 删除车型信息信息
     * 
     * @param carTypeId 车型信息主键
     * @return 结果
     */
    @Override
    public int deleteCarTypeInfoByCarTypeId(Long carTypeId)
    {
        return carTypeInfoMapper.deleteCarTypeInfoByCarTypeId(carTypeId);
    }

    @Override
    public int updateCarTypeStatus(CarTypeInfo carTypeInfo) {
        return carTypeInfoMapper.updateCarTypeInfo(carTypeInfo);
    }
}
