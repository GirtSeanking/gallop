package com.ruoyi.project.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 活动信息对象 activity_info
 * 
 * @author gallop
 * @date 2023-09-11
 */
public class ActivityInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 活动编号 */
    private Long activityId;

    /** 活动标题 */
    @Excel(name = "活动标题")
    private String activityTitle;

    /** 活动内容 */
    @Excel(name = "活动内容")
    private String activityContent;

    /** 活动封面 */
    @Excel(name = "活动封面")
    private String activityCover;

    /** 活动状态（0正常 1停用） */
    @Excel(name = "活动状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setActivityId(Long activityId) 
    {
        this.activityId = activityId;
    }

    public Long getActivityId() 
    {
        return activityId;
    }
    public void setActivityTitle(String activityTitle) 
    {
        this.activityTitle = activityTitle;
    }

    public String getActivityTitle() 
    {
        return activityTitle;
    }
    public void setActivityContent(String activityContent) 
    {
        this.activityContent = activityContent;
    }

    public String getActivityContent() 
    {
        return activityContent;
    }
    public void setActivityCover(String activityCover) 
    {
        this.activityCover = activityCover;
    }

    public String getActivityCover() 
    {
        return activityCover;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("activityId", getActivityId())
            .append("activityTitle", getActivityTitle())
            .append("activityContent", getActivityContent())
            .append("activityCover", getActivityCover())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
