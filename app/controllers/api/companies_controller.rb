class Api::CompaniesController < ApplicationController
  before_action :set_city_company, only: [:show, :update, :destroy]
 
  def index
    @city = City.find(params[:city_id])
    @company = @city.companies
    render json: @company
  end

  def show
    render json: @company
  end
  
  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end
    
  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:id])
    @company.destroy
  end
    
  private
    def company_params
      params.fetch(:company, {})
    end    

    def set_city_company
      @city = City.find(params[:city_id])
      @company = @city.companies.find(params[:id])
    end
end