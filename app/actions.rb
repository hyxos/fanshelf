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

get '/data' do
  @users = User.all
  @shelves = Shelf.all
  @fanfics = Fanfic.all

  erb :show_data
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
    redirect "/user/#{@user.id}"
  else
    erb :'index'
  end
end

post '/shelf/:id/delete' do
  if current_user
    @user = current_user
    @shelf = Shelf.find params[:id]
    @shelf.destroy unless @shelf.name == "Top Shelf"

    redirect "/user/#{@user.id}"
  end
end
# get '/shelf/:id' do
#   if current_user != []
#     @user = current_user
#   end

#   @shelf = Shelf.find params[:id]
  
#   erb :'user/index'
# end

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
  if current_user
    @user = current_user
    @shelf.user = @user
  end
  @shelf.save
  redirect "/user/#{@user.id}"
end

post '/shelf/:id/fanfic/new' do
  if current_user
    @user = current_user
  end
  @fanfic = Fanfic.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
  )
  @shelf = Shelf.find params[:id]
  @fanfic.shelf = @shelf
  @fanfic.save
  redirect "/user/#{@user.id}"
end

post '/shelf/:id/fanfic/:id/delete' do
  if current_user
    @user = current_user
  end
  @fanfic = Fanfic.find params[:id]
  @fanfic.destroy

  redirect "/user/#{@user.id}"
end

get '/submit' do
  if current_user
    @user = current_user
    @fanfic = Fanfic.new({url: params[:url], title: params[:title]})
    @fanfic.shelf = Shelf.where(user_id: @user.id).where(name: 'Top Shelf').first
    @fanfic.save
  end
end
