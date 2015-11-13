get '/submit' do
  if current_user
    @user = current_user
    @fanfic = Fanfic.new({url: params[:url], title: params[:title]})
    @fanfic.shelf = Shelf.where(user_id: @user.id).where(name: 'Top Shelf').first
    @fanfic.save

    redirect "/user"
  end
end