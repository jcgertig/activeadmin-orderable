class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :number
    end
  end
end
