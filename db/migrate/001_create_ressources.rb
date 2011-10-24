class CreateRessources < ActiveRecord::Migration
  def change
    create_table :ressources do |t|        
       t.integer :heir_id
        t.string :heir_type
        t.string :title
		t.string :status
      t.timestamps
    end
  end
end
