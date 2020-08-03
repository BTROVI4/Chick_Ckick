class CreateAppoiments < ActiveRecord::Migration[6.0]
  def change
    create_table :appoiments do |t|
      t.references :specialist, null: false, foreign_key: true

      t.timestamps    
    end
  end
end
