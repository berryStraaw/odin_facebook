class UserMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to Odin facebook')
      end

    def forgot_password
        @user = params[:user]
        mail(to: @user.email, subject: 'Odin facebook Password recovery')
    end
end
