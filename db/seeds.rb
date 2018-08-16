require 'faker'

User.destroy_all
Question.destroy_all

puts 'deleted'

puts 'creating'

userCount = 0
15.times do
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
    content = Faker::OnePiece.quote
    user = User.find(userCount)
    category = Faker::OnePiece.location
    tags = "student"
    Question.create(title: title, content: content,
                user: user, category: category, tags: tags)
  end
end

questionsNumber = Question.all.length

30.times do
  content = Faker::OnePiece.quote
  user = User.find(rand(1..15))
  question = Question.find(rand(1..questionsNumber))
  votes = rand(1..10)
  is_answer = false
  is_hint = true
  Answer.create(content: content, user: user,
              question: question, votes: votes, is_answer: is_answer, is_hint: is_hint)
end

20.times do
  content = Faker::OnePiece.quote
  user = User.find(rand(1..15))
  answer = Answer.find(rand(1..30))
  votes = rand(1..8)
  is_answer = true
  is_hint = false
  Comment.create(content: content, user: user,
              answer: answer, votes: votes, is_answer: is_answer, is_hint: is_hint)
end


puts 'finished'

# puts 'finished creating users'

# Repo.destroy_all
# puts 'destroy old repos'

# puts 'creating new repos'
# 40.times do
#   name = Faker::SiliconValley.invention
#   description = Faker::Lorem.paragraph(2, true, 6)
#   user_id = rand(1..4)
#   Repo.create(name: name, description: description, user_id: user_id)
# end
# puts 'finished creating repos'

# Collaboration.destroy_all
# puts 'destroy old collabs'

# 40.times do
#   user_id = rand (1..4)
#   repo_id = rand(1..10)
#   accepted = 1
#   Collaboration.create(user_id: user_id, repo_id: repo_id, accepted: accepted)
# end
# puts 'finished creating collabs'
