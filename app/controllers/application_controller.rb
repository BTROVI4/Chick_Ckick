class ApplicationController < ActionController::Base
    # before_action :authenticate_user!, only: [:create, :update, :destroy, :new, :edit]
  
    def index
    end

    # private
    #  def authenticate_user!
    #     unless current_user
    #       if request.xhr?
    #         render json: {msg: "Вы не авторизованы"}, status: 403            
    #       else
    #         redirect_to root_path
    #       end
    #     end
    #  end
end
