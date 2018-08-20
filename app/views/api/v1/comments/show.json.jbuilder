json.comment do
  json.extract! @comment, :id, :content, :votes
  json.extract! @comment.user, :name, :avatar
end
