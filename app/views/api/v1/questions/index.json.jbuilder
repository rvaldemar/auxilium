json.array! @questions do |question|
  json.extract! question, :id, :title, :content, :category
  json.extract! question.user, :name
  json.answers question.answers do |answer|
    json.extract! answer, :id, :content, :votes
    json.extract! answer.user, :name
    json.comments answer.comments do |comment|
      json.extract! comment, :id, :content, :votes
      json.extract! comment.user, :name
    end
  end
end
