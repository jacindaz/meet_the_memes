class Admin::UsersController < Admin::BaseController
  before_filter :authorize

  def index
    @users = User.order(:admin, :username)
  end

  def update
    @users = User.order(:admin, :username)
    @user = User.find(params[:id])

    if @user.update_attribute(:admin, true)
      flash[:notice] = "Such promotion!"
      redirect_to admin_users_path
    else
      flash.now[:notice] = "No has promotion."
      render :'admin/users/index'
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "Wow. Much destroy."
      redirect_to admin_users_path
    else
      flash.now[:notice] = "Whoopsie Goldberg. Such trouble."
      render :'admin/users/index'
    end
  end
end
