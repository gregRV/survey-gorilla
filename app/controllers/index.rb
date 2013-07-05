enable :sessions

get '/' do
  erb :index
end

#--- CREATE NEW SURVEY
get '/surveys/new' do

end

post '/surveys' do

end

#--- SHOW SURVEY
get '/surveys/:id' do |id|

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
    if @user.authenticate(params([:user][:password]))
      session[:user_id] = @user.id
    end
  end
  redirect '/'
end

get '/sessions/logout' do
  session.clear
end
