class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :test
            t.text :action
            t.text :expected
      t.timestamps
    end
    add_index :steps, :test_id
  end
end
