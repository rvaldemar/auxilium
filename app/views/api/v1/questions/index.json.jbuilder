json.questions do
  json.array! @questions do |question|
    json.extract! question, :id, :title, :content, :category, :subcategory
    json.extract! question.user, :name, :avatar
    key = calculates_time(question)
    json.extract! key, :time
  end
end
