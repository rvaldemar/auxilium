def calculates_time(object)
  tempo_decorrido = (Time.now - object.created_at) / 3600

  if tempo_decorrido < 0.017
    message = "just now"
  elsif tempo_decorrido < 1
    message = "#{(tempo_decorrido * 60).to_i} minutes ago"
  elsif tempo_decorrido > 24
    message = "#{(tempo_decorrido.to_i) / 24} days ago"
  else
    message = "#{tempo_decorrido.to_i} hours ago"
  end

  { time: message }
end

json.questions do
  json.array! @questions do |question|
    json.extract! question, :id, :title, :content, :category, :subcategory
    json.extract! question.user, :name, :avatar
    key = calculates_time(question)
    json.extract! key, :time
    json.extract! @badges, :helper, :active, :assertive

    json.number_of_answers question.answers.length
  end
end
