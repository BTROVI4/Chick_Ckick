class Api::AppointmentsController < ApplicationController
  before_action :set_city_company_service_specialist_appointment, only: [:show, :update, :destroy]
  
  protect_from_forgery except: :create


  def index
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    start_date = DateTime.parse(params[:start_date])
    @appointments = @specialist.appointments.where(start_date: start_date.all_day)
    render json: @appointments
  end
  
  def show
    render json: @appointment
  end
  
  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    @appointment = @specialist.appointments.new(appointment_params)
    if @appointment.save
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    @appointment = @specialist.appointments.find(params[:id])
    @appointment.destroy
  end

  private
    def appointment_params
      params.require(:appointment).permit(:start_date, :clientName, :clientSurName, :clientNumber, :end_date)
    end
    def set_city_company_service_specialist_appoiment
      @city = City.find(params[:city_id])
      @company = @city.companies.find(params[:company_id])
      @service = @company.services.find(params[:service_id])
      @specialist = @service.specialists.find(params[:specialist_id])
      @appointment = @specialist.appointments.find(params[:id])
    end
end
