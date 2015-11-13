get '/' do
  if current_user
    redirect '/user'
  else
    erb :index
  end
end