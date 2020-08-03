class CreateWhours < ActiveRecord::Migration[6.0]
  def change
    create_table :whours do |t|
      t.integer :month, default: 0
      t.integer :year, default: 0
      t.integer :day, default: 0
      t.text :time, default: ''
      t.references :specialist, null: false, foreign_key: true
      
      t.timestamps    
    end
  end
end
