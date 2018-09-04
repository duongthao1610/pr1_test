class Admin::UsersController < AdminsController
  # load_and_authorize_resource
  before_action :authenticate_user!, only: [:index, :destroy]

  def index
    # @users= User.paginate(page: params[:page])
    # binding.pry
  #   if params[:search_user].present?
  #     @users= User.search params[:search_user], page: params[:page],
  #     per: Settings.user.per_page
  #   else
  #     @user= User.latest.page(params[:page]).per Settings.user.per_page
  #   end
  #   @users= User.search params[:search_user]
  # end
    if params[:search_user].present?
      @users = User.where(['name LIKE ?', "%#{params[:search_user]}%"])
    else
      @users= User.paginate(page: params[:page])
    end
  end

  def destroy
    @user= User.find(params[:id])
    # binding.pry
    if @user.destroy
      flash[:success] = @user.name+ "has been deleted!"
    else
      flash[:danger] = @user.name+ "can't be delete!"
    end
    redirect_to admin_users_url
  end
end
