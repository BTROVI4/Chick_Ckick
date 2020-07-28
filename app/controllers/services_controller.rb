# class ServicesController < ApplicationController
#     def create
#       @company = Company.find(params[:company_id])
#       @service = @company.companies.new(service_params)
    
#       if @service.save
#         render json: @service, status: :created, location: @service
#       else
#         render json: @service.errors, status: :unprocessable_entity
#       end
#     end
  
#     def destroy
#         @company = Company.find(params[:company_id])
#         @service = @company.companies.find(params[:id])
#         @service.destroy
#     end
    
#     private
#         def service_params
#           params.require(:service).permit(:title, :cost)
#         end 
# end  


class ServicesController < ActionController::Base

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    service = @companies.services.new(service_params)
    service.save
    redirect_to company_path(@company)
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
    @service.destroy
    redirect_to company_path(@company)
  end

  private
    def service_params
      params.require(:service).permit(:service_name, :cost)
    end
end