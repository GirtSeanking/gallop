import request from '@/utils/request'

// 查询用户认证审核列表
export function listAudit(query) {
  return request({
    url: '/system/audit/list',
    method: 'get',
    params: query
  })
}

// 查询用户认证审核详细
export function getAudit(userAuditId) {
  return request({
    url: '/system/audit/' + userAuditId,
    method: 'get'
  })
}

// 新增用户认证审核
export function addAudit(data) {
  return request({
    url: '/system/audit',
    method: 'post',
    data: data
  })
}

// 修改用户认证审核
export function updateAudit(data) {
  return request({
    url: '/system/audit',
    method: 'put',
    data: data
  })
}

// 删除用户认证审核
export function delAudit(userAuditId) {
  return request({
    url: '/system/audit/' + userAuditId,
    method: 'delete'
  })
}
