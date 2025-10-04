class Answer < ApplicationRecord
  belongs_to :interview
  belongs_to :material
  belongs_to :question

  validates :value, presence: true
  validates :response_type, presence: true

  enum :response_type, { text: 'text', numeric: 'numeric', scale: 'scale', boolean: 'boolean' }

  scope :by_material, ->(material) { where(material: material) }
  scope :by_question, ->(question) { where(question: question) }
end
