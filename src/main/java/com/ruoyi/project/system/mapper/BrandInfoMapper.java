package com.ruoyi.project.system.mapper;

import java.util.List;
import com.ruoyi.project.system.domain.BrandInfo;

/**
 * 品牌信息Mapper接口
 * 
 * @author gallop
 * @date 2023-09-11
 */
public interface BrandInfoMapper 
{
    /**
     * 查询品牌信息
     * 
     * @param brandId 品牌信息主键
     * @return 品牌信息
     */
    public BrandInfo selectBrandInfoByBrandId(Long brandId);

    /**
     * 查询品牌信息列表
     * 
     * @param brandInfo 品牌信息
     * @return 品牌信息集合
     */
    public List<BrandInfo> selectBrandInfoList(BrandInfo brandInfo);

    /**
     * 新增品牌信息
     * 
     * @param brandInfo 品牌信息
     * @return 结果
     */
    public int insertBrandInfo(BrandInfo brandInfo);

    /**
     * 修改品牌信息
     * 
     * @param brandInfo 品牌信息
     * @return 结果
     */
    public int updateBrandInfo(BrandInfo brandInfo);

    /**
     * 删除品牌信息
     * 
     * @param brandId 品牌信息主键
     * @return 结果
     */
    public int deleteBrandInfoByBrandId(Long brandId);

    /**
     * 批量删除品牌信息
     * 
     * @param brandIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBrandInfoByBrandIds(Long[] brandIds);
}
