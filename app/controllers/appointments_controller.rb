class AppointmentsController < ApplicationController
    def create
        @city = City.find(params[:city_id])
        @company = @city.companies.find(params[:company_id])
        @service = @company.services.find(params[:service_id])
        @specialist = @service.specialists.find(params[:specialist_id])
        appointment = @specialist.appointments.new(appointment_params)
        appointment.save
        redirect_to city_company_service_specialist_path(@city, @company, @service, @specialist)
    end
    
    def destroy
        @city = City.find(params[:city_id])
        @company = @city.companies.find(params[:company_id])
        @service = @company.services.find(params[:service_id])
        @specialist = @service.specialists.find(params[:specialist_id])
        @appointment = @specialist.appointments.find(params[:id])
        @appointment.destroy
        redirect_to city_company_service_specialist_path(@city, @company, @service, @specialist)
    end
    
    private
        def appointment_params
          params.require(:appointment).permit(:start_date, :clientName, :clientSurName, :clientNumber, :end_date)
        end
end