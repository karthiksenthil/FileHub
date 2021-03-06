class UsersController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:new, :create] 

  def index
  end

  
  def new
    @user = User.new
  end
  

  def create
    @user = User.new(user_param)
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:notice] = 'User created.'
      redirect_to(:action => 'index', :controller => 'uploads')
    else
      render("new")
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_param)
      flash[:notice] = "User data updated succesfully"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def show
  end

  def delete
  	@user = User.find(params[:id])
  end

  def destroy
  	user = User.find(params[:id])
    user.destroy
    flash[:notice] = "User '#{user.username}' destroyed successfully!"
    redirect_to(:action => 'index')
  end

  private

  def user_param
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
