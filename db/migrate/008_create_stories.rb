class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :role
        t.text :goal
        t.text :benefit
      t.string :priority
        t.text :business_context
        t.text :acceptance_criteria
     t.integer :points
     t.integer :estimated_effort
     t.integer :real_effort

      t.timestamps
    end
  end
end
