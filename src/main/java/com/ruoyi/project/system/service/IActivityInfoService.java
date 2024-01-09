package com.ruoyi.project.system.service;

import java.util.List;
import com.ruoyi.project.system.domain.ActivityInfo;

/**
 * 活动信息Service接口
 * 
 * @author gallop
 * @date 2023-09-11
 */
public interface IActivityInfoService 
{
    /**
     * 查询活动信息
     * 
     * @param activityId 活动信息主键
     * @return 活动信息
     */
    public ActivityInfo selectActivityInfoByActivityId(Long activityId);

    /**
     * 查询活动信息列表
     * 
     * @param activityInfo 活动信息
     * @return 活动信息集合
     */
    public List<ActivityInfo> selectActivityInfoList(ActivityInfo activityInfo);

    /**
     * 新增活动信息
     * 
     * @param activityInfo 活动信息
     * @return 结果
     */
    public int insertActivityInfo(ActivityInfo activityInfo);

    /**
     * 修改活动信息
     * 
     * @param activityInfo 活动信息
     * @return 结果
     */
    public int updateActivityInfo(ActivityInfo activityInfo);

    /**
     * 批量删除活动信息
     * 
     * @param activityIds 需要删除的活动信息主键集合
     * @return 结果
     */
    public int deleteActivityInfoByActivityIds(Long[] activityIds);

    /**
     * 删除活动信息信息
     * 
     * @param activityId 活动信息主键
     * @return 结果
     */
    public int deleteActivityInfoByActivityId(Long activityId);

    /*
     * @Author GirtSeanking
     * @Description //TODO 活动状态修改
     * @Date 21:54 2023/9/11
     * @Param [activityInfo]
     * @return
     **/
    public int updateActivityStatus(ActivityInfo activityInfo);
}
