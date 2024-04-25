class CreateRespondents < ActiveRecord::Migration[7.1]
  def change
    create_table :respondents do |t|
      t.string :name

      t.timestamps
    end
  end
end
