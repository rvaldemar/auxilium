json.answer do
  json.extract! @answer, :id, :content, :votes
  json.extract! @answer.user, :name, :avatar
end
