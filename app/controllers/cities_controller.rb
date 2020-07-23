# class CitiesController < ActionController::Base
#   before_action :set_city, only: [:show, :update, :destroy]

#   def index
#     @cities = City.all

#     render json: @cities
#   end

#   def show
#     render json: @city
#   end

#   def create
#     @city = City.new(city_params)

#     if @city.save
#       render json: @city, status: :created, location: @city
#     else
#       render json: @city.errors, status: :unprocessable_entity
#     end
#   end

#   def update
#     if @city.update(city_params)
#       render json: @city
#     else
#       render json: @city.errors, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @city.destroy
#   end

#   private
#     def set_city
#       @city = City.find(params[:id])
#     end

#     def city_params
#       params.fetch(:city, {})
#     end
# end

class CitiesController < ActionController::Base
    def index
      @cities = City.all
    end
   
    def show
      @city = City.find(params[:id])
    end
   
    def new
      @city = City.new
    end
   
    def edit
      @city = City.find(params[:id])
    end
   
    def create
      @city = City.new(city_params)
   
      if @city.save
        redirect_to @city
      else
        render 'new'
      end
    end
   
    def update
      @city = City.find(params[:id])
   
      if @city.update(city_params)
        redirect_to @city
      else
        render 'edit'
      end
    end
   
    def destroy
      @city = City.find(params[:id])
      @city.destroy
   
      redirect_to cities_path
    end
   
    private
      def city_params
        params.require(:city).permit(:title, :code)
      end
  end