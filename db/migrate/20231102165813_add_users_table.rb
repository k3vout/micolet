class AddUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.boolean :receive_newsletter, null: false, default: true

      t.timestamps
    end
  end
end
