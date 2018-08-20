json.questions do
  json.array! @questions do |question|
    json.extract! question, :id, :title, :content, :category, :subcategory
    json.extract! question.user, :name, :avatar
  end
end
