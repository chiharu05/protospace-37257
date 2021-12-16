class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    
  end

  def create
    User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :occupation, :position)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end