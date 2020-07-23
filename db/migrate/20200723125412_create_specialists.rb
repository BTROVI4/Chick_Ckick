class CreateSpecialists < ActiveRecord::Migration[6.0]
  def change
    create_table :specialists do |t|
      t.string :name, default: ''
      t.string :speciality, default: ''
      t.text :info, default: ''
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
