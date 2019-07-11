import request from '@/utils/request'

export function getDepts(params) {
  return request({
    url: 'sys/dept/tree',
    method: 'get',
    params
  })
}

export function add(data) {
  return request({
    url: 'sys/dept/add',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'sys/dept/delete/' + id,
    method: 'get'
  })
}

export function edit(data) {
  return request({
    url: 'sys/dept/modify',
    method: 'post',
    data
  })
}
