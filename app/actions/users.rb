get '/user' do
  if current_user
    @user = current_user
  end
  @shelves = Shelf.where(user_id: @user.id)
  erb :'user/index'
end

post '/user/new' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
  if @user.save
    session[:id] = @user.id
    @shelf = Shelf.new(
      name: 'Top Shelf'
      )
    @shelf.user = @user
    @shelf.save
    redirect "/user"
  else
    erb :'index'
  end
end

post '/user/login' do 
  if @user = User.find_by_name(params[:name]).try(:authenticate, params[:password])
    session[:id] = @user.id
    redirect "/user"
  else 
    @error = "Wrong user name/password"
    redirect '/'
  end
end

post '/logout' do 
  session.clear
  redirect '/'
end