 class UsersController < ApplicationController
  
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
  
end 
