class AddAnswersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.references :question, index: true, null: false
      t.references :survey_response, index: true, null: false

      t.timestamps
    end
  end
end
