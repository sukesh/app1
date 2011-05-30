 class UsersController < ApplicationController
  before_filter :authenticate,:only=>[:edit,:updates]
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
 def deny
flash[:notice] = "Access Denied!! Please Sigin/signup to Edit"
  redirect_to signin_path
 end
end 
