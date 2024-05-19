class Room < ApplicationRecord
  has_many :questions
  has_one :current_question, class_name: 'Question'
end
