class CompaniesController < ApplicationController
  before_action :authenticate_user!

  layout 'application'
  
  def index
    @city = City.find(params[:city_id])
    @company = @city.companies.all
  end

  def show
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:id])
  end
  
  def edit
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:id])
    authorize @company
  end

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.new(company_params)
    authorize @company
    @company.save
    redirect_to city_path(@city)
  end
  
  def update
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:id])
    authorize @company

    if @company.update(company_params)
      redirect_to city_path(@city)
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:id])
    authorize @company
    @company.destroy
    redirect_to city_path(@city)
  end
  
  private
    def company_params
      params.require(:company).permit(:title, :adress, :user_id)
    end
end