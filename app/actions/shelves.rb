get '/shelf/:id' do
  @shelf = Shelf.find params[:id]
  
  erb :'show_shelf'
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
  redirect "/user"
end

delete '/shelf/:id/delete' do
  if current_user
    @user = current_user
    @shelf = Shelf.find params[:id]
    @shelf.destroy unless @shelf.name == "Top Shelf"

    redirect "/user"
  end
end