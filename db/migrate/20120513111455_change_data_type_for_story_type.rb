class ChangeDataTypeForStoryType < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.change :type, :string
    end
  end
end
