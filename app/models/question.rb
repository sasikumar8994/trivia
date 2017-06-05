class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :answers, inverse_of: :question
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  has_many :submitted_answers
end
