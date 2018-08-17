json.question do
  json.extract! @question, :id, :title, :content, :category
  json.extract! @question.user, :name

  json.answers do
    json.array! @question.answers do |answer|
      json.extract! answer, :id, :content, :votes
      json.extract! answer.user, :name

      json.comments do
        json.array! answer.comments do |comment|
          json.extract! comment, :id, :content, :votes
          json.extract! comment.user, :name
        end
      end

    end

  end
end



# json.array! @questions do |question|
#   json.extract! question, :id, :title, :content, :category
#   json.extract! question.user, :name
#   json.answers question.answers do |answer|
#     json.extract! answer, :id, :content, :votes
#     json.extract! answer.user, :name
#     json.comments answer.comments do |comment|
#       json.extract! comment, :id, :content, :votes
#       json.extract! comment.user, :name
#     end
#   end
# end
