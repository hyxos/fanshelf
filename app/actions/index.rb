get '/' do
  if current_user
    erb :'user/index'
  else
    erb :index
  end
end