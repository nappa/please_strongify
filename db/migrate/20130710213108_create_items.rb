class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, :null => false
      t.text   :text,  :null => false
      t.references :category, :null => true
      t.references :user,     :null => false

      t.timestamps
    end
  end
end
