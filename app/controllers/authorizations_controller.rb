class AuthorizationsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: authorization_params[:email])

    if user&.authenticate(authorization_params[:password])
      session[:user_id] = user.id
      redirect_to root_path,  notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "ログアウトしました"
  end

  private

  def authorization_params
    params.require(:authorization).permit(:email, :password)
  end
end
