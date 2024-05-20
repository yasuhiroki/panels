class Respondent < ApplicationRecord
  has_many :answers, dependent: :destroy
end
