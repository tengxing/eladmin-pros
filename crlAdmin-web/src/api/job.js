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
    url: 'sys/job/add',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'sys/job/remove/' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/job/modify',
    method: 'get',
    data
  })
}
