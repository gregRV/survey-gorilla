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

get '/users/new' do

end

post '/users' do

end 

#--- NEW SESSIONS
get '/sessions/new' do
  "Hello World"
end

post '/sessions' do

end

get '/sessions/logout' do
  session.clear
end
