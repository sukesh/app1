 class UsersController < ApplicationController
  before_filter :authenticate,:only=>[:index,:edit,:updates]
  before_filter :correct_user,:only=>[:edit,:update]
  def index
   @users=User.all
   @title="All Users"
  end
  def  show
    #@user=User.find_by_email("sukesh@futurenow.biz")
     #@user=User.find("3")
     @user=User.find(params[:id])
     @title=@user.name
  end
  def new
        @user=User.new
  	@title="Sign up"
  end
  def create
     #raise params[:user].inspect
     @user = User.new(params[:user])
     if @user.save
         #flash[:success] = "Welcome to the Home Page!!"
        redirect_to @user,:flash=>{:success=>"Welcome to the Home Page!!"}
     else
        @title= "Sign up"
        render 'new'
     end
  end
  def edit
   @user= User.find(params[:id])
   @title="Edit user"
end
  def update
   @user= User.find(params[:id])
   if @user.update_attributes(params[:user])
    redirect_to @user,:flash=>{:success=>"Profile Updated!!"}

   else
    @title= "Edit user"
    render 'edit'
   end

end
private
 def authenticate
   deny unless signed_in? 
 end
 def correct_user
 @user=User.find(params[:id])
 flash[:notice]="Access Denied!!"
 redirect_to root_path unless current_user?(@user)
 end

end 
