class Api::CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]

  def index
    @cities = City.all

    render json: @cities
  end

  def show
    render json: @city
  end

  def create
    @city = City.new(city_params)

    if @city.save
      render json: @city, status: :created, location: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def update
    if @city.update(city_params)
      render json: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @city.destroy
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.fetch(:city, {})
    end
end