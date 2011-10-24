class CreateDefects < ActiveRecord::Migration
  def change
    create_table :defects do |t| 
      t.string :priority
        t.text :details
     t.integer :estimated_effort
     t.integer :real_effort
    t.references :story
      t.timestamps
    end
  end
end
