class AddSurveysTable < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :name, null: false
      t.integer :survey_type, null: false, default: 0
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
