class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
          t.string :title
            t.text :note
      t.references :ressource
      t.timestamps
    end    
  end
end
