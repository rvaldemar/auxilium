require 'faker'

User.destroy_all
Question.destroy_all

puts 'deleted'

puts 'creating'

questions_categories = ["Experiment Methods", "Age in Days", "What is your Name", "Stupid Coaching", "Colourful Algorithm", "IP Address Converter", "Credit Card Checker", "Morse Code" ]

userCount = 0
5.times do
  userCount += 1
  email = "#{userCount.to_s}@email.com"
  password = "123654"
  name = Faker::Name.name
  points = rand(1..1100)
  role = "student"

  User.create(email: email, password: password,
              name: name, points: points, role: role)

  questions = rand(2..6)

  questions.times do
    title = Faker::OnePiece.akuma_no_mi
    content = "{\"ops\":[{\"insert\":\"Hello !\\nSome initial \"},{\"attributes\":{\"bold\":true},\"insert\":\"bold\"},{\"insert\":\" text\\n\\n\"}]}"
    user = User.find(userCount)
    category = questions_categories.sample
    tags = "student"
    Question.create(title: title, content: content,
                user: user, category: category, tags: tags)
  end
end

questionsNumber = Question.all.length

60.times do
  content = "{\"ops\":[{\"insert\":\"Hello !\\nSome initial \"},{\"attributes\":{\"bold\":true},\"insert\":\"bold\"},{\"insert\":\" text\\n\\n\"}]}"
  user = User.find(rand(1..5))
  question = Question.find(rand(1..questionsNumber))
  votes = rand(1..10)
  is_answer = false
  is_hint = true
  Answer.create(content: content, user: user,
              question: question, votes: votes, is_answer: is_answer, is_hint: is_hint)
end

50.times do
  content = "{\"ops\":[{\"insert\":\"Hello !\\nSome initial \"},{\"attributes\":{\"bold\":true},\"insert\":\"bold\"},{\"insert\":\" text\\n\\n\"}]}"
  user = User.find(rand(1..5))
  answer = Answer.find(rand(1..60))
  votes = rand(1..8)
  is_answer = true
  is_hint = false
  Comment.create(content: content, user: user,
              answer: answer, votes: votes, is_answer: is_answer, is_hint: is_hint)
end


puts 'finished'
