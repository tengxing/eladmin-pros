import request from '@/utils/request'

export function getAllJob(deptId) {
  const params = {
    deptId,
    page: 1,
    size: 9999
  }
  return request({
    url: 'sys/job',
    method: 'get',
    params
  })
}

export function add(data) {
  return request({
    url: 'sys/job/save',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'sys/job/delete/' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/job/update',
    method: 'get',
    data
  })
}
