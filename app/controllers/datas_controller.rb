class DatasController < ApplicationController
    def create
      @specialist = Specialist.find(params[:specialist_id])
      @data = @specialist.companies.new(data)
    
      if @data.save
        render json: @data, status: :created, location: @data
      else
        render json: @data.errors, status: :unprocessable_entity
      end
    end
    
    def update
      if @data.update(data_params)
        render json: @data
      else
        render json: @data.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
        @specialist = Specialist.find(params[:specialist_id])
        @data = @specialist.companies.find(params[:id])
        @data.destroy
    end
    
    private
        def data_params
          params.require(:data).permit(:month, :year, :day, :time)
        end
  end
    