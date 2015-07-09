class UsersController < ApplicationController
	
  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :and_other_params_you_want_to_allow)
  end
end