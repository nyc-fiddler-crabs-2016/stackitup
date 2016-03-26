users_amount          = 0
questions_per_user    = 5
answers_per_question  = 3
tags_total            = 10
tags_per_question     = (3..5).to_a

comments_per_question = 2
comments_per_answer   = 2

votes_per_question    = (1..10).to_a
votes_per_answer     = (1..10).to_a
vote_values = [1,-1]


tags = []

tags_total.times do
  tags << Tag.create(name: Faker::Hacker.abbreviation)
end


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

    tags_per_question.sample.times do
      QuestionTag.create(question: question,
                          tag:      tags.sample
                          )
    end

    comments_per_question.times do
      Comment.create(user: users.sample,
                     body: Faker::Hipster.paragraph(2),
                     commentable_id: question.id,
                     commentable_type: 'Question'
                     )
    end

    votes_per_question.sample.times do
      Vote.create(user: users.sample,
                  value: vote_values.sample,
                  voteable_id: question.id,
                  voteable_type: 'Question'
                  )
    end

    answers_per_question.times do
      answer = Answer.create(body: Faker::Hipster.paragraph(4),
                             user: user,
                             question: question
                             )

      comments_per_answer.times do
        Comment.create(user: users.sample,
                       body: Faker::Hipster.paragraph(2),
                       commentable_id: answer.id,
                       commentable_type: 'Answer'
            )
      end

      votes_per_answer.sample.times do
        Vote.create(user: users.sample,
                    value: vote_values.sample,
                    voteable_id: answer.id,
                    voteable_type: 'Answer'
                    )
      end
    end
  end
end






