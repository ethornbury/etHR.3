class AccountActivationsController < ApplicationController
    
    def edit
        user = User.find_by(email: params[:email])
        ##user = User.find_by_email(params[:session][:email].downcase) #in case of problem, this was the fix elsewhere
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
          user.update_attribute(:activated,    true)
          user.update_attribute(:activated_at, Time.zone.now)
          sign_in user
          flash[:success] = "Account activated!"
          redirect_to user
        else
          flash[:danger] = "Invalid activation link"
          redirect_to root_url
        end
    end
    
end
