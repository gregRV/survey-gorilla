10.times do 
  User.create(name: Faker::Name.first_name + ' ' + Faker::Name.last_name,
              email: Faker::Internet.email,
              password: 'password'
              )

end

1.upto(10)  do |i|
  Survey.create(title:  Faker::Lorem.words,
                description:  Faker::Lorem.sentence,
                creator_id: i)
end

1.upto(10) do |i|
  question = Question.create(text: Faker::Lorem.sentence,
                  survey_id:  i)

  3.times do
    question.choices << Choice.create(text: Faker::Lorem.words)
  end
  
end
