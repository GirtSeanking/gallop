package com.ruoyi.project.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.mapper.ActivityInfoMapper;
import com.ruoyi.project.system.domain.ActivityInfo;
import com.ruoyi.project.system.service.IActivityInfoService;

/**
 * 活动信息Service业务层处理
 * 
 * @author gallop
 * @date 2023-09-11
 */
@Service
public class ActivityInfoServiceImpl implements IActivityInfoService 
{
    @Autowired
    private ActivityInfoMapper activityInfoMapper;

    /**
     * 查询活动信息
     * 
     * @param activityId 活动信息主键
     * @return 活动信息
     */
    @Override
    public ActivityInfo selectActivityInfoByActivityId(Long activityId)
    {
        return activityInfoMapper.selectActivityInfoByActivityId(activityId);
    }

    /**
     * 查询活动信息列表
     * 
     * @param activityInfo 活动信息
     * @return 活动信息
     */
    @Override
    public List<ActivityInfo> selectActivityInfoList(ActivityInfo activityInfo)
    {
        return activityInfoMapper.selectActivityInfoList(activityInfo);
    }

    /**
     * 新增活动信息
     * 
     * @param activityInfo 活动信息
     * @return 结果
     */
    @Override
    public int insertActivityInfo(ActivityInfo activityInfo)
    {
        activityInfo.setCreateTime(DateUtils.getNowDate());
        return activityInfoMapper.insertActivityInfo(activityInfo);
    }

    /**
     * 修改活动信息
     * 
     * @param activityInfo 活动信息
     * @return 结果
     */
    @Override
    public int updateActivityInfo(ActivityInfo activityInfo)
    {
        activityInfo.setUpdateTime(DateUtils.getNowDate());
        return activityInfoMapper.updateActivityInfo(activityInfo);
    }

    /**
     * 批量删除活动信息
     * 
     * @param activityIds 需要删除的活动信息主键
     * @return 结果
     */
    @Override
    public int deleteActivityInfoByActivityIds(Long[] activityIds)
    {
        return activityInfoMapper.deleteActivityInfoByActivityIds(activityIds);
    }

    /**
     * 删除活动信息信息
     * 
     * @param activityId 活动信息主键
     * @return 结果
     */
    @Override
    public int deleteActivityInfoByActivityId(Long activityId)
    {
        return activityInfoMapper.deleteActivityInfoByActivityId(activityId);
    }

    /*
     * @Author GirtSeanking
     * @Description //TODO 活动状态修改
     * @Date 21:54 2023/9/11
     * @Param [activityInfo]
     * @return
     **/
    @Override
    public int updateActivityStatus(ActivityInfo activityInfo) {
        return activityInfoMapper.updateActivityInfo(activityInfo);
    }
}
