class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_date, nil: false
      t.datetime :end_date, nil: false
      t.string :clientName, default: ''
      t.string :clientSurName, default: ''
      t.string :clientNumber, default: ''
      t.references :specialist, null: false, foreign_key: true
          
      t.timestamps        
    end
  end
end