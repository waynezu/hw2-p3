class UsersController < ApplicationController

  def new
	@user=User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
	  sign_in @user
	  flash[:success] = "Congratulation, #{@user.username}! You've successfully registered!"
      redirect_to controller: 'posts', :action => 'index'
    else
      render 'new'
    end
  end

end
