class AddRoomIdToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_reference :questions, :room
    add_foreign_key :questions, :rooms
  end
end
