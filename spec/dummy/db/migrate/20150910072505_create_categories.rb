class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :position
    end
  end
end
