class UsersController < ApplicationController
  def login
  end

#  def sign_up
 # 	@user = User.new
  #	if request.post?
  #		@user = User.new(params[:user])

  	#	if @user.save
  	#		flash[:noticia]="#{user.nombre} se ha registrado correctamente"
  	#		redirect_to root_path
  	#	end
  #	end
#  end

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    	if @user.save
    	  flash[:noticia] = "Te has registrado correctamente"
    	  redirect_to root_path
    	else
    	  render action: 'sign_up'
    	end
  end

  private
  def user_params
    params.require(:user).permit(:nombre, :email, :password,
                                   :password_confirmation)
  end
end
