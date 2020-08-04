class CreateWhours < ActiveRecord::Migration[6.0]
  def change
    create_table :whours do |t|
      t.string :date, default: ''
      t.string :clientName, default: ''
      t.string :clientSurName, default: ''
      t.string :clientNumber, default: ''
      t.integer :minOffsetX, default: 0
      t.integer :minOffsetY, default: 0
      t.integer :maxOffsetX, default: 0
      t.integer :maxOffsetY, default: 0
      t.references :specialist, null: false, foreign_key: true
      
      t.timestamps    
    end
  end
end
