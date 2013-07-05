enable :sessions

get '/' do
  @surveys = Survey.all
  erb :index
end

#--- CREATE NEW SURVEY
get '/surveys/new' do
  erb :"surveys/new"
end

post '/surveys' do
  survey = Survey.create(params[:survey])
  question = Question.create(text: params[:question])
  survey.questions << question
  params[:choice].values.each do |choice|
    question.choices << Choice.create(text: choice)
  end

  # debugger
  # puts "Params: #{params}"
  redirect '/'

end

#--- SHOW SURVEY
get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  erb :"surveys/show"
end

post '/surveys/:id' do |id|

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
