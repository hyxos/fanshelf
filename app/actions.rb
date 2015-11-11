# Homepage (Root path)

helpers do
  def current_user
    if session[:id] and user = User.find(session[:id])
      user
    end
  end
end

get '/' do
  erb :index
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
    redirect "/user/#{@user.id}"
  else
    erb :'/'
  end
end

get '/user/:id' do
  @user = User.find params[:id]
  @shelves = Shelf.where(user_id: @user.id)
  erb :'user/index'
end

post '/user/login' do 
  if @user = User.find_by_name(params[:name]).try(:authenticate, params[:password])
    session[:id] = @user.id
    redirect "/user/#{@user.id}"
  else 
    @error = "Wrong user name/password"
    redirect '/'
  end
end

post '/logout' do 
  session.clear
  redirect '/'
end

post '/shelf/new' do
  @shelf = Shelf.new(
    name: params[:name]
  )
  if current_user != []
    @user = current_user
    @shelf.user = @user
  end
  redirect "/user/#{@user.id}"
end



