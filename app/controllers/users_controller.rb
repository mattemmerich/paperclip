class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new(name: params[:name])
		@user.save
		redirect_to user_path
	end


	def create
		@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "User Created"
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "Try Again"
  		render :new
  	end
  end

   def edit
  	@user = User.find(params[:id])
  end


  private
	  def user_params
	  	params.require(:user).permit(:name, :avatar)
	  end
	end

end