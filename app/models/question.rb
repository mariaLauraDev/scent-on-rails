class Question < ApplicationRecord
  has_many :batch_questions, dependent: :destroy
  has_many :batches, through: :batch_questions
  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validates :question_type, presence: true

  enum :question_type, { text: 'text', numeric: 'numeric', scale: 'scale', multiple_choice: 'multiple_choice', boolean: 'boolean' }
end
