class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t| 
        t.string :name
      t.datetime :start_date
      t.datetime :end_date
    t.references :release
      t.timestamps
    end
  end
end
