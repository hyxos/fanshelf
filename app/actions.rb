# Homepage (Root path)
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




