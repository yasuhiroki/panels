class Room < ApplicationRecord
  has_many :questions
  belongs_to :current_question, class_name: 'Question', optional: true
end
