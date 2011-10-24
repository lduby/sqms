class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t| 
      t.string :priority
        t.text :details
     t.integer :estimated_effort
     t.integer :real_effort
      t.timestamps
    end
  end
end
