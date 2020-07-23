class SpecialistsController < ApplicationController
    def create
      @service = Service.find(params[:service_id])
      @specialist = @service.companies.new(specialist)
    
      if @specialist.save
        render json: @specialist, status: :created, location: @specialist
      else
        render json: @specialist.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @specialist.update(specialist_params)
        render json: @specialist
      else
        render json: @specialist.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
        @service = Service.find(params[:service_id])
        @specialist = @service.companies.find(params[:id])
        @specialist.destroy
    end
    
    private
        def specialist_params
          params.require(:specialist).permit(:name, :speciality, :info)
        end
  end 