package com.ruoyi.project.system.service.impl;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.BrandInfoMapper;
import com.ruoyi.project.system.domain.BrandInfo;
import com.ruoyi.project.system.service.IBrandInfoService;

/**
 * 品牌信息Service业务层处理
 * 
 * @author gallop
 * @date 2023-09-11
 */
@Service
public class BrandInfoServiceImpl implements IBrandInfoService 
{
    @Autowired
    private BrandInfoMapper brandInfoMapper;

    /**
     * 查询品牌信息
     * 
     * @param brandId 品牌信息主键
     * @return 品牌信息
     */
    @Override
    public BrandInfo selectBrandInfoByBrandId(Long brandId)
    {
        return brandInfoMapper.selectBrandInfoByBrandId(brandId);
    }

    /**
     * 查询品牌信息列表
     * 
     * @param brandInfo 品牌信息
     * @return 品牌信息
     */
    @Override
    public List<BrandInfo> selectBrandInfoList(BrandInfo brandInfo)
    {
        return brandInfoMapper.selectBrandInfoList(brandInfo);
    }

    /**
     * 新增品牌信息
     * 
     * @param brandInfo 品牌信息
     * @return 结果
     */
    @Override
    public int insertBrandInfo(BrandInfo brandInfo)
    {
        brandInfo.setCreateTime(DateUtils.getNowDate());
        return brandInfoMapper.insertBrandInfo(brandInfo);
    }

    /**
     * 修改品牌信息
     * 
     * @param brandInfo 品牌信息
     * @return 结果
     */
    @Override
    public int updateBrandInfo(BrandInfo brandInfo)
    {
        brandInfo.setUpdateTime(DateUtils.getNowDate());
        return brandInfoMapper.updateBrandInfo(brandInfo);
    }

    /**
     * 批量删除品牌信息
     * 
     * @param brandIds 需要删除的品牌信息主键
     * @return 结果
     */
    @Override
    public int deleteBrandInfoByBrandIds(Long[] brandIds)
    {
        return brandInfoMapper.deleteBrandInfoByBrandIds(brandIds);
    }

    /**
     * 删除品牌信息信息
     * 
     * @param brandId 品牌信息主键
     * @return 结果
     */
    @Override
    public int deleteBrandInfoByBrandId(Long brandId)
    {
        return brandInfoMapper.deleteBrandInfoByBrandId(brandId);
    }

    /**
     * @Author GirtSeanking
     * @Description //TODO 修改品牌状态
     * @Date 20:40 2023/9/11
     * @Param [brandInfo]
     * @return
     **/
    @Override
    public int updateBrandStatus(BrandInfo brandInfo) {
        return brandInfoMapper.updateBrandInfo(brandInfo);
    }
}
