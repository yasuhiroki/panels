class Question < ApplicationRecord
  belongs_to :room
  has_many :question_answers
end
