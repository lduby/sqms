class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|        
       t.integer :heir_id
        t.string :heir_type
	   t.integer :bts_id
	   t.references :iteration
      t.timestamps
    end
  end
end
