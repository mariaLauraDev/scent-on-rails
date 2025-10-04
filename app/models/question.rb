class Question < ApplicationRecord
  has_and_belongs_to_many :batches
  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validates :question_type, presence: true

  enum :question_type, { text: 'text', numeric: 'numeric', scale: 'scale', multiple_choice: 'multiple_choice', boolean: 'boolean' }
end
