class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :ressources_tags, :id => false do |t|
      t.references :ressource, :tag
    end
    
  end
end
