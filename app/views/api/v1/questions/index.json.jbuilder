json.questions do
  json.array! @questions do |question|
    json.extract! question, :id, :title, :content, :category, :subcategory
    json.extract! question.user, :name, :avatar

    json.answers do
    json.array! question.answers do |answer|
      json.extract! answer, :id, :content, :votes
      json.extract! answer.user, :name, :avatar

      json.comments do
        json.array! answer.comments do |comment|
          json.extract! comment, :id, :content, :votes
          json.extract! comment.user, :name, :avatar
        end
      end

    end

  end
  end
end
