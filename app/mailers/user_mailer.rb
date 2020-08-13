class UserMailer < ApplicationMailer
    def example(user)
        @user = user
        mail(to: @user.email, subject: 'Confirmation Letter')
    end
end
