class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :company_name, default: ''
      t.text :adress, default: ''
      t.references :city, null: false, foreign_key: true
      
      t.timestamps     
    end
  end
end
