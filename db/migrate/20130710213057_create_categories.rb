class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string     :name, :null => false
      t.references :user, :null => false

      t.timestamps
    end
  end
end
