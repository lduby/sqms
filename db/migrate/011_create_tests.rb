class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
            t.text :description
      t.references :ticket
	      t.string :test_type

      t.timestamps
    end
    add_index :tests, :ticket_id
    
    create_table :campaigns_tests, :id => false do |t|
      t.references :campaign, :test
    end
  end
end
