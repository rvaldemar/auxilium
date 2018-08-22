json.question do
  json.extract! @question, :id, :title, :content, :category, :subcategory
  json.extract! @question.user, :name, :avatar
end
