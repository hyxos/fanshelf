# Homepage (Root path)
get '/' do
  erb :index
end

post '/users/new' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
  if @user.save
    session[:id] = @user.id
    redirect'/user/:id'
  else
    erb :'/'
  end
end