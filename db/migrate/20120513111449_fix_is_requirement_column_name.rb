class FixIsRequirementColumnName < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.rename :is_requirement, :type
    end
  end
end
