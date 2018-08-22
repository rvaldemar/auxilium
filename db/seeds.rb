require 'faker'

User.destroy_all
Question.destroy_all

puts 'deleted'

puts 'creating'

# Create Users

puts 'Creating users'
name = 'Talves6'
email = "#{name}@email.com"
password = "123654"
avatar = "https://avatars1.githubusercontent.com/u/40235414?v=4"

User.create(email: email, password: password, name: name, avatar: avatar)

name = 'ddcoelho'
email = "#{name}@email.com"
password = "123654"
avatar = "https://avatars2.githubusercontent.com/u/9859208?v=4"

User.create(email: email, password: password, name: name, avatar: avatar)

name = 'rvaldemar'
email = "#{name}@email.com"
password = "123654"
avatar = "https://avatars1.githubusercontent.com/u/40320519?v=4"

User.create(email: email, password: password, name: name, avatar: avatar)

userCount = 0
7.times do

  userCount += 1
  email = "#{userCount.to_s}@email.com"
  password = "123654"
  name = Faker::Name.name
  avatar = "https://t6.rbxcdn.com/ed0c3ba3beeb8ca85f68ab09ec24cdc1"

  User.create(email: email, password: password, name: name, avatar: avatar )
end

questions_categories = ["Experiment Methods", "Age in Days", "What is your Name", "Stupid Coaching", "Colourful Algorithm", "IP Address Converter", "Credit Card Checker", "Morse Code" ]

# Start of Question
title = 'How can I call a method?'
content = "The exercise says that we should find the right Ruby methods... Where can I find that?"
user = User.find(rand(1..10))
category = questions_categories[0]
Question.create(title: title, content: content, user: user, category: category)

content = "Well... it depends... You can have methods that have to be call in an object (like the downcase) or by themselves. It always depends on what you're trying to accomplish"
user = User.find(rand((1..10)))
question = Question.find(1)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Yep, that's basically it"
user = User.find(rand(1..10))
answer = Answer.find(1)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Having some issues while creating the age_in_days method'
content = "Can somebody explain me the logic that I can implement to do this?"
user = User.find(rand(1..10))
category = questions_categories[1]
Question.create(title: title, content: content, user: user, category: category)

content = "You have to define the date you're in and then subtract the initial date"
user = User.find(rand(1..10))
question = Question.find(2)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "That's the only way"
user = User.find(rand(1..5))
answer = Answer.find(2)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'What is the better way to concatenate strings?'
content = "In the exercise description it is mentioned that we should concatenate 'Hello' and the provided name. I saw several ways to concatenate stuff... Can anyone provide advice on which one is the better way?"
user = User.find(rand(1..10))
category = questions_categories[2]
Question.create(title: title, content: content, user: user, category: category)

content = "You can do it with the + sign, the << characters, and several other functions"
user = User.find(rand(1..10))
question = Question.find(3)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Agree"
user = User.find(rand(1..5))
answer = Answer.find(3)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Not finding a way of doing the if statement'
content = "I'm trying to implement the necessary conditions, but it keeps on failing. Is there any way of debugging this?"
user = User.find(rand(1..10))
category = questions_categories[3]
Question.create(title: title, content: content, user: user, category: category)

content = "The if follows the structure: if <condition> ... elsif <condition> ... else ... end"
user = User.find(rand(1..10))
question = Question.find(4)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Well, you could explain that better"
user = User.find(rand(1..5))
answer = Answer.find(4)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Questions on how to create the algorithm'
content = "Need someone that is willing to spend 20 minutes explaining the logic behind the algorithm. Thanks"
user = User.find(rand(1..10))
category = questions_categories[4]
Question.create(title: title, content: content, user: user, category: category)

content = "Maybe you should try to run rake. The examples really help"
user = User.find(rand(1..10))
question = Question.find(5)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Good advice!"
user = User.find(rand(1..5))
answer = Answer.find(5)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = "What do they mean with 'converting ip to numbers'?"
content = "I mean it. Is that even possible? Where can I learn about this?"
user = User.find(rand(1..10))
category = questions_categories[5]
Question.create(title: title, content: content, user: user, category: category)

content = "Sure, in the internet you cannot address something without translating the name into a readable address"
user = User.find(rand(1..10))
question = Question.find(6)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Something to do with DNS, right?"
user = User.find(rand(1..5))
answer = Answer.find(6)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Help with visa and mastercard concepts'
content = "Not understanding how to configure this..."
user = User.find(rand(1..10))
category = questions_categories[6]
Question.create(title: title, content: content, user: user, category: category)

content = "Try to read again the kitt specifications"
user = User.find(rand(1..10))
question = Question.find(7)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "The diagram is really useful!"
user = User.find(rand(1..5))
answer = Answer.find(7)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Morse code question'
content = "Do we have to consider special characters?"
user = User.find(rand(1..10))
category = questions_categories[7]
Question.create(title: title, content: content, user: user, category: category)

content = "Don't think so. We only have to consider the 26 normal characters"
user = User.find(rand(1..10))
question = Question.find(8)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "As it is put in the exercise description."
user = User.find(rand(1..5))
answer = Answer.find(8)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# SECOND ROUND
# Start of Question
title = 'What are Ruby built-in classes?'
content = "It seems that one of the objectives of this exercise is to learn about that... Can anyone help?"
user = User.find(rand(1..10))
category = questions_categories[0]
Question.create(title: title, content: content, user: user, category: category)

content = "Great question. I'll look at the lecture slides again."
user = User.find(rand(1..10))
question = Question.find(9)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "You should do that ;)"
user = User.find(rand(1..5))
answer = Answer.find(9)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Issues using Date class'
content = "I'm using the Date class but I think it's not working at all... Where should I write the 'require' statement?"
user = User.find(rand(1..10))
category = questions_categories[1]
Question.create(title: title, content: content, user: user, category: category)

content = "You should write it right at the top of your file!"
user = User.find(rand(1..10))
question = Question.find(10)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Nice tip"
user = User.find(rand(1..5))
answer = Answer.find(10)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Counting characters - HELP!'
content = "One of our objectives in the custom_message method is to return the number of characters. I'm not finding good tips on how to do that. Help please!"
user = User.find(rand(1..10))
category = questions_categories[2]
Question.create(title: title, content: content, user: user, category: category)

content = "You can try to do variable.length to see what happens ;)"
user = User.find(rand(1..10))
question = Question.find(11)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Nice!"
user = User.find(rand(1..5))
answer = Answer.find(11)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Loops - Infinite loop'
content = "I have defined a loop in my code. It's not stopping. Why?"
user = User.find(rand(1..10))
category = questions_categories[3]
Question.create(title: title, content: content, user: user, category: category)

content = "The best advice I can give you is that you look at the condition, and look in the code if you're incrementing you iterator in a correct manner"
user = User.find(rand(1..10))
question = Question.find(12)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)
# End of Question

# Start of Question
title = 'Should this work only for 3 digits?'
content = "The example in Kitt only shows two cases (236 and 263). Does it have to work with more digits?"
user = User.find(rand(1..10))
category = questions_categories[4]
Question.create(title: title, content: content, user: user, category: category)

content = "Think so, at least judging for the tests"
user = User.find(rand(1..10))
question = Question.find(13)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)
# End of Question

# Start of Question
title = 'Converting number to ip'
content = "I managed to convert an ip to a number, but I'm not finding a way to do the opposite... Any ideas?"
user = User.find(rand(1..10))
category = questions_categories[5]
Question.create(title: title, content: content, user: user, category: category)

content = "Struggling in it as well. Anyone?"
user = User.find(rand(1..10))
question = Question.find(14)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "If I manage to make my exercise work, I'll tell you how to do it!"
user = User.find(rand(1..5))
answer = Answer.find(14)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# Start of Question
title = 'Can anyone explain how to implement this?'
content = "I think that I understand the basics of this, but I when try to implement... I can do nothing..."
user = User.find(rand(1..10))
category = questions_categories[6]
Question.create(title: title, content: content, user: user, category: category)

content = "Can't help on this one... Still trying to understand the problem."
user = User.find(rand(1..10))
question = Question.find(15)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)
# End of Question

# Start of Question
title = 'Encoding stuff'
content = "Is there any easy documentation that we can use to understand how to do this. Should we do separate methods for this?"
user = User.find(rand(1..10))
category = questions_categories[7]
Question.create(title: title, content: content, user: user, category: category)

content = "Have you checked the exercise page for tips?"
user = User.find(rand(1..10))
question = Question.find(16)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "I did, and I am still finding it difficult to understand!"
user = User.find(rand(1..5))
answer = Answer.find(16)
Comment.create(content: content, user: user, answer: answer)
# End of Question

# More answers
content = "You should try to read the slides... It really helped me a lot to read the lecture material again."
user = User.find(rand((1..10)))
question = Question.find(1)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Is it possible to use the .size method as well?"
user = User.find(rand(1..10))
question = Question.find(11)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "It has to do with multiplications and stuff... Hate mathematical problems!"
user = User.find(rand(1..10))
question = Question.find(5)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)
# More answers


# Start of Question about Github
title = 'Github'
content = "Github is really cool, but I would really like to get some help in some particular projects that I have in mind, or even find some really cool projects where I can practice a little bit. Can anyone share some advice on this?"
user = User.find(1)
category = 'Github'
Question.create(title: title, content: content, user: user, category: category)

content = "There is a really cool app where you can share your repos and find people to work with you! It's called OScar!"
user = User.find(2)
question = Question.find(17)
votes = 0
Answer.create(content: content, user: user, question: question, votes: votes)

content = "Thanks! I'll definitely look into that!"
user = User.find(1)
answer = Answer.find(20)
Comment.create(content: content, user: user, answer: answer)
# End of Question


# userCount = 0
# 5.times do

#   questions = rand(2..6)

#   questions.times do
#     title = Faker::OnePiece.akuma_no_mi
#     content = "{\"ops\":[{\"insert\":\"Hello !\\nSome initial \"},{\"attributes\":{\"bold\":true},\"insert\":\"bold\"},{\"insert\":\" text\\n\\n\"}]}"
#     user = User.find(userCount)
#     category = questions_categories.sample
#     Question.create(title: title, content: content,
#                 user: user, category: category, tags: tags)
#   end
# end

# questionsNumber = Question.all.length

# 60.times do
#   content = "{\"ops\":[{\"insert\":\"Hello !\\nSome initial \"},{\"attributes\":{\"bold\":true},\"insert\":\"bold\"},{\"insert\":\" text\\n\\n\"}]}"
#   user = User.find(rand(1..5))
#   question = Question.find(rand(1..questionsNumber))
#   votes = rand(1..10)
#   is_answer = false
#   is_hint = true
#   Answer.create(content: content, user: user,
#               question: question, votes: votes, is_answer: is_answer, is_hint: is_hint)
# end

# 50.times do
#   content = "{\"ops\":[{\"insert\":\"Hello !\\nSome initial \"},{\"attributes\":{\"bold\":true},\"insert\":\"bold\"},{\"insert\":\" text\\n\\n\"}]}"
#   user = User.find(rand(1..5))
#   answer = Answer.find(rand(1..60))
#   votes = rand(1..8)
#   is_answer = true
#   is_hint = false
#   Comment.create(content: content, user: user,
#               answer: answer, votes: votes, is_answer: is_answer, is_hint: is_hint)
# end


puts 'finished'
