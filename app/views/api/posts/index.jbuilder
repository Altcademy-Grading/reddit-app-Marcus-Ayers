json.posts do
  json.array! @posts do |post|
    json.id post.id
    json.title post.title
    json.body post.body
    json.subreddit post.subreddit
    json.created_at post.created_at
    json.user post.user
    json.comments post.comments
  end
end