class CreateSajuAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :saju_answers do |t|
      t.references :saju_bot, index: true
      t.text :content
      t.integer :next_bot_id

      t.timestamps
    end
  end
end
