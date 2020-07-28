# class CompaniesController < ApplicationController

#     def create
#       @city = City.find(params[:city_id])
#       @company = @city.companies.new(company_params)

#       if @company.save
#         render json: @company, status: :created, location: @company
#       else
#         render json: @company.errors, status: :unprocessable_entity
#       end
#     end
  
#     def update
#       if @company.update(company_params)
#         render json: @company
#       else
#         render json: @company.errors, status: :unprocessable_entity
#       end
#     end
    
#     def destroy
#         @city = City.find(params[:city_id])
#         @company = @city.companies.find(params[:id])
#         @company.destroy
#     end
    
#     private
#       def company_params
#         params.require(:company).permit(:title, :adress)
#       end    
    
# end

class CompaniesController < ActionController::Base
    def show
      @city = City.find(params[:city_id])
      @company = @city.companies.find(params[:id])
    end
    
    def create
      @city = City.find(params[:city_id])
      company = @city.companies.new(company_params)
      company.save
      redirect_to city_path(@city)
    end
  
    def destroy
      @city = City.find(params[:city_id])
      @company = @city.companies.find(params[:id])
      @company.destroy
      redirect_to city_path(@city)
    end
  
    private
      def company_params
        params.require(:company).permit(:company_name, :adress)
      end
  end