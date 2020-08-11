sclass Appointment < ApplicationRecord
  belongs_to :specialist, foreign_key: "specialist_id", class_name: "Specialist"
  # belongs_to :service, optional: true

  # before_validation :set_end_date
  # validate :appointment_check

  # private

    # def set_end_date
    #   # Appointment.joins(:services).where()
    #   self.end_date = self.start_date + self.service.wminutes.minutes
    # end

    # def appointment_check
    #   # valid = self.specialist.appointments.where("(appointments.start_date <= ? AND appointments.end_date >= ?) OR (appointments.start_date <= ? AND appointments.end_date >= ?)", start_date, start_date, end_date, end_date).count == 0
    #   # self.errors.add(:start_date, "Alreadedy booked")

    #   Appointment.all.each do |appointment|
        
    #     if start_date.to_date == appointment.start_date.to_date

    #       # Appointment.where("start_date <= ? AND end_date >= ?", start_date, end_date)

    #       if start_date.to_time < appointment.start_date.to_time && end_date.to_time <= appointment.start_date.to_time || start_date.to_time > appointment.end_date.to_time && end_date.to_time >= appointment.end_date.to_time
        
    #       else
    #         errors.add(:start_date, "Alreadedy booked")
    #         break     
    #       end
    #     end

    #   end

    # end
end
