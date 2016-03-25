users_amount  = 0
questions_per_user = 5
answers_per_question  = 3

comments_per_question = 2
comments_per_answer   = 2

votes_per_question    = (1..10).to_a
votes_per_comment     = (1..10).to_a


User.create(username: 'joe', email: 'joe@joe.com', password: 'pw', description: 'I am a ruby ninja and OO disciple who likes red wine and ASP.net')
User.create(username: 'ryan', email: 'ryan@ryan.com', password: 'pw', description: 'I am a regular person with hobbies and stuff.')
User.create(username: 'peter', email: 'peter@peter.com', password: 'pw', description: 'I am Batman.')



user_ids = User.all.map {|user| user.id }
users = User.all

users.each do |user|
  questions_per_user.times do
    question = Question.create(title: Faker::Hacker.say_something_smart,
                                body: Faker::Hipster.paragraph(4),
                                user: user
                                )
    answers_per_question.times do
      Answer.create(body: Faker::Hipster.paragraph(4),
                    user: user,
                    question: question
                     )
    end
  end
end






