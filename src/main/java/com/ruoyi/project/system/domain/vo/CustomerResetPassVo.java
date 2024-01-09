package com.ruoyi.project.system.domain.vo;

/**
 * @ClassName CustomerResetPassVo
 * @Description TODO
 * @Author GirtSeanking
 * @Date 2024/1/9 10:19
 **/
public class CustomerResetPassVo {
    private Long userId;
    private String oldPassword;
    private String newPassword;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
