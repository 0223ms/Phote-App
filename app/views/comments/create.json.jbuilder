json.content  @comment.content
json.user_id  @comment.user.id
json.user_name  @comment.user.nickname
json.time  time_ago_in_words(@comment.created_at)
json.post_id  @comment.post.id