import request from '@/utils/request'

// 获取所有的权限树
export function getPermissionTree() {
  return request({
    url: 'sys/permission/tree',
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: 'sys/permission/add',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'sys/permission/delete' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/permission/update',
    method: 'post',
    data
  })
}
