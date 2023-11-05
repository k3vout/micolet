class AddQuestionsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.references :survey, index: true, null: false
      t.integer :position, null: false
      t.index [:survey_id, :position], unique: true

      t.timestamps
    end
  end
end
