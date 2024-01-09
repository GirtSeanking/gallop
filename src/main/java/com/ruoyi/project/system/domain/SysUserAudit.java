package com.ruoyi.project.system.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excels;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 用户认证审核对象 sys_user_audit
 * 
 * @author gallop
 * @date 2023-09-14
 */
public class SysUserAudit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户审核表编号 */
    private Long userAuditId;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    /** 用户身份证号 */
    @Excel(name = "用户身份证号")
    private String userIdCard;

    /** 用户审核名字 */
    @Excel(name = "用户审核名字")
    private String userAuditName;

    /** 用户身份证照片信息 */
    @Excel(name = "用户身份证照片信息")
    private String idCardImgs;

    /** 驳回理由 */
    @Excel(name = "驳回理由")
    private String rejectReason;

    /** 订单状态（0未审核 1审核中 2驳回审核 3审核通过） */
    @Excel(name = "订单状态", readConverterExp = "0=未审核,1=审核中,2=驳回审核,3=审核通过")
    private String status;

    @Excels({@Excel(name = "用户昵称", targetAttr = "nickName"), @Excel(name = "用户账户", targetAttr = "userName")})
    private SysUser user;

    public void setUserAuditId(Long userAuditId) 
    {
        this.userAuditId = userAuditId;
    }

    public Long getUserAuditId() 
    {
        return userAuditId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUserIdCard(String userIdCard) 
    {
        this.userIdCard = userIdCard;
    }

    public String getUserIdCard() 
    {
        return userIdCard;
    }
    public void setUserAuditName(String userAuditName) 
    {
        this.userAuditName = userAuditName;
    }

    public String getUserAuditName() 
    {
        return userAuditName;
    }
    public void setIdCardImgs(String idCardImgs) 
    {
        this.idCardImgs = idCardImgs;
    }

    public String getIdCardImgs() 
    {
        return idCardImgs;
    }
    public void setRejectReason(String rejectReason) 
    {
        this.rejectReason = rejectReason;
    }

    public String getRejectReason() 
    {
        return rejectReason;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userAuditId", getUserAuditId())
            .append("userId", getUserId())
            .append("userIdCard", getUserIdCard())
            .append("userAuditName", getUserAuditName())
            .append("idCardImgs", getIdCardImgs())
            .append("rejectReason", getRejectReason())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("user", getUser())
            .toString();
    }
}
