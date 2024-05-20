class Answer < ApplicationRecord
  belongs_to :respondent
  has_one :question_answer, dependent: :destroy

  accepts_nested_attributes_for :question_answer
end
