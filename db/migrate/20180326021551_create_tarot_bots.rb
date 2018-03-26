class CreateTarotBots < ActiveRecord::Migration[5.1]
  def change
    create_table :tarot_bots do |t|
      t.text :content
      t.string :ans_type
      t.boolean :is_init

      t.timestamps
    end
  end
end
