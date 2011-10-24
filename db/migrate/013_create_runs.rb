class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.references :step
            t.text :actual
            t.boolean :successful
            t.datetime :date
      t.timestamps
    end
    add_index :runs, :step_id
  end
end
