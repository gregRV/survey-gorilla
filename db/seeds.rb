10.times do 
  User.create(name: Faker::Name.first_name + ' ' + Faker::Name.last_name,
              email: Faker::Internet.email,
              password: 'password'
              )

end

1.upto(10)  do |i|
  Survey.create(title:  "Title #{i}",
                description:  "Description #{i}",
                creator_id: i)
  # Survey.creators << i
end

1.upto(10) do |i|
  question = Question.create(text: Faker::Lorem.sentence.chomp,
                  survey_id:  i)

  answer = ['Yes', 'No', 'Maybe']
  3.times do |j|
    question.choices << Choice.create(text: answer[j])
  end
  
end
