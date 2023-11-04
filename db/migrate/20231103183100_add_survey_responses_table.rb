class AddSurveyResponsesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_responses do |t|
      t.integer :status, null: false, default: 0
      t.references :survey, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
