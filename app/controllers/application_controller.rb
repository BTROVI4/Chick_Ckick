class ApplicationController < ActionController::Base
  
    include Pundit

    def index
    end

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
