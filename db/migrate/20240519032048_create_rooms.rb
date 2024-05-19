class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :current_question, foreign_key: { to_table: :questions }

      t.timestamps
    end
  end
end
