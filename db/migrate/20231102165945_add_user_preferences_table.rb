class AddUserPreferencesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :user_preferences do |t|
      t.boolean :women_fashion, null: false, default: false
      t.boolean :men_fashion, null: false, default: false
      t.boolean :children_fashion, null: false, default: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
