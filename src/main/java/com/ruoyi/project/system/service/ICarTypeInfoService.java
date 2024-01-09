package com.ruoyi.project.system.service;

import java.util.List;

import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.system.domain.CarTypeInfo;

/**
 * 车型信息Service接口
 * 
 * @author gallop
 * @date 2023-09-11
 */
public interface ICarTypeInfoService 
{
    /**
     * 查询车型信息
     * 
     * @param carTypeId 车型信息主键
     * @return 车型信息
     */
    public CarTypeInfo selectCarTypeInfoByCarTypeId(Long carTypeId);

    /**
     * 查询车型信息列表
     * 
     * @param carTypeInfo 车型信息
     * @return 车型信息集合
     */
    public List<CarTypeInfo> selectCarTypeInfoList(CarTypeInfo carTypeInfo);

    /**
     * 新增车型信息
     * 
     * @param carTypeInfo 车型信息
     * @return 结果
     */
    public int insertCarTypeInfo(CarTypeInfo carTypeInfo);

    /**
     * 修改车型信息
     * 
     * @param carTypeInfo 车型信息
     * @return 结果
     */
    public int updateCarTypeInfo(CarTypeInfo carTypeInfo);

    /**
     * 批量删除车型信息
     * 
     * @param carTypeIds 需要删除的车型信息主键集合
     * @return 结果
     */
    public AjaxResult deleteCarTypeInfoByCarTypeIds(Long[] carTypeIds);

    /**
     * 删除车型信息信息
     * 
     * @param carTypeId 车型信息主键
     * @return 结果
     */
    public int deleteCarTypeInfoByCarTypeId(Long carTypeId);

    /*
     * @Author GirtSeanking
     * @Description //TODO 车型状态修改
     * @Date 21:01 2023/9/11
     * @Param [carTypeInfo]
     * @return
     **/
    public int updateCarTypeStatus(CarTypeInfo carTypeInfo);
}
