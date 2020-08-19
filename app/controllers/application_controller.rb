class ApplicationController < ActionController::Base
    include Pundit
    def index
    end 
    protect_from_forgery prepend: true
  
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    private
  
    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore
      flash[:warning] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_to(request.referrer || root_path)
    end
    









    # include Pundit

    # def index
    # end

    # unless Rails.env.production?
    #     after_action :verify_authorized, except: [:index, :show]
    #     after_action :verify_policy_scoped, only: :index
    # end
    
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    # protect_from_forgery with: :exception
    # before_action :authenticate, except: %i[login], if: -> { !Rails.env.development? }
    
    # private
    # def user_not_authorized
    #     redirect_to welcome_path
    # end
end
