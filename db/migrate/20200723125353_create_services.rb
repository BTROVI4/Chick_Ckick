class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :service_name, default: ''
      t.integer :cost, default: 0
      t.references :company, null: false, foreign_key: true

      t.timestamps      
    end
  end
end
