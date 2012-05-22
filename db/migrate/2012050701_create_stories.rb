class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.boolean :is_requirement
      t.string :actor
        t.text :goal
        t.text :benefit
        t.text :description
      t.string :priority
      t.string :requirement_category
        t.text :business_context
        t.text :acceptance_criteria
     t.integer :story_points
     t.integer :estimated_effort
     t.integer :real_effort

      t.timestamps
    end
    
    storymngright = Permission.create! :name => 'User Story management', :description => 'All operations on stories', :action => 'manage', :subject_class => 'Story'
	storyreadright = Permission.create! :name => 'User Story visualization', :description => 'Only read operations on stories', :action => 'read', :subject_class => 'Story'
	Role.find_by_name('analyst').permissions << storymngright
	Role.find_by_name('developer').permissions << storyreadright
	Role.find_by_name('tester').permissions << storyreadright
  end
end
