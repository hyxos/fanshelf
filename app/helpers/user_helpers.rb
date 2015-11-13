helpers do
  def current_user
    if session[:id] and user = User.find(session[:id])
      user
    end
  end
end