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


json.question do
  json.extract! @question, :id, :title, :content, :category, :subcategory
  json.extract! @question.user, :name, :avatar
  key = calculates_time(@question)
  json.extract! key, :time
  json.extract! @badges, :helper, :active, :assertive

  json.answers do
    json.array! @question.answers do |answer|
      json.extract! answer, :id, :content, :votes
      json.extract! answer.user, :name, :avatar
      key = calculates_time(answer)
      json.extract! key, :time

      json.answer_votes do
        if answer.answer_votes.find_by(user_id: @user.id)
          json.array! answer.answer_votes.where(user_id: @user.id) do |vote|
            json.extract! vote, :user_id, :vote, :user_name
          end
        end
      end

      json.comments do
        json.array! answer.comments do |comment|
          json.extract! comment, :id, :content, :votes
          json.extract! comment.user, :name, :avatar
          key = calculates_time(comment)
          json.extract! key, :time
        end
      end

    end

  end
end
