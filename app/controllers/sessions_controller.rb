class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:path) || root_path
    else
      flash.now[:alert] = 'Введите почту и пароль!'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'Вы успешно вышли из аккаунта!'
  end
end
