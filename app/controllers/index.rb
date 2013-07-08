enable :sessions

get '/' do
  @surveys = Survey.all
  erb :index
end

#--- CREATE NEW SURVEY
get '/surveys/new' do
  if current_user
    erb :"surveys/new"
  else
    erb :index
  end
end

post '/surveys' do
  survey = Survey.new(params[:survey])
  question = Question.create(text: params[:question])
  survey.questions << question
  params[:choice].values.each do |choice|
    question.choices << Choice.create(text: choice)
  end
  survey.creator_id=session[:user_id]
  survey.save
  redirect '/'
end

#--- SHOW SURVEY
get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  if current_user
    erb :"surveys/show"
  else
    erb :index
  end

end

post '/surveys/:id/answers' do |id| 
  choice = Choice.find(params[:choice])
  answer = Answer.create(choice_id: choice.id)
  puts "Current User: #{current_user.answers}"
  puts "answer: #{answer}"

  current_user.answers << answer
  puts "Current User after: #{current_user.answers}"
  redirect '/'
end  

#--- NEW USER
get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/'
end 

#--- SHOW USER
get '/users/:id' do |id|
  @user=User.find(id)
  @surveys_answered = @user.answers.last.choice.question.survey
  erb :'users/show'
end

#--- NEW SESSIONS
get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  @user = User.find_by_email(params[:user][:email])
  unless @user.nil?
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    end
  end
  redirect '/'
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
