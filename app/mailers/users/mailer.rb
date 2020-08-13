if defined?(ActionMailer)
  class User::Mailer < Devise.parent_mailer.constantize
    include User::Mailers::Helpers

    def confirmation_instructions(record, token, opts={})
      @token = token
      user_mail(record, :confirmation_instructions, opts)
    end

    def reset_password_instructions(record, token, opts={})
      @token = token
      user_mail(record, :reset_password_instructions, opts)
    end

    def unlock_instructions(record, token, opts={})
      @token = token
      user_mail(record, :unlock_instructions, opts)
    end

    def email_changed(record, opts={})
      user_mail(record, :email_changed, opts)
    end

    def password_change(record, opts={})
      user_mail(record, :password_change, opts)
    end
  end  
end
  