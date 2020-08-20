json.array! @users do |user|
  json.id  user.id
  json.username  user.username
  json.nickname  user.nickname
  json.image  user.image
end
