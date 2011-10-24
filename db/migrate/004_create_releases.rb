class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t| 
      t.string :name
      t.string :version_number 
    t.datetime :due_date
    t.datetime :real_date
      t.timestamps
    end
  end
end
