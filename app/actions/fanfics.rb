get '/fanfic/:id/edit' do
  if current_user
    @user = current_user
  end
  @shelves = Shelf.where(user_id: @user.id)
  @fanfic = Fanfic.find params[:id]

  erb :'user/fanfic'
end

post '/fanfic/new' do
  if current_user
    @user = current_user
  end
  @fanfic = Fanfic.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
  )
  @shelf = Shelf.find params[:shelf]
  @fanfic.shelf = @shelf
  @fanfic.save
  redirect "/user"
end

put '/fanfic/:id/edit' do
  if current_user
    @user = current_user
  end
  @fanfic = Fanfic.find params[:id]
  @fanfic.title = params[:title]
  @fanfic.author = params[:author]
  @fanfic.url = params[:url]
  @shelf = Shelf.find params[:shelf]
  @fanfic.shelf = @shelf
  @fanfic.save

  redirect "/user"
end

delete '/fanfic/:id/delete' do
  if current_user
    @user = current_user
  end
  @fanfic = Fanfic.find params[:id]
  @fanfic.destroy

  redirect "/user"
end

