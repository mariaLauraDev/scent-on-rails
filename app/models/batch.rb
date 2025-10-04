class Batch < ApplicationRecord
  has_many :batch_materials, dependent: :destroy
  has_many :materials, through: :batch_materials
  has_many :batch_questions, dependent: :destroy
  has_many :questions, through: :batch_questions
  has_many :interviews, dependent: :destroy
  has_many :interviewees, through: :interviews
  has_many :answers, through: :interviews

  validates :name, presence: true
  validates :status, presence: true

  enum :status, { draft: 'draft', active: 'active', completed: 'completed', archived: 'archived' }
  STATUS_OPTIONS = [
    ['Rascunho', 'draft'],
    ['Arquivado', 'draft'],
    ['Ativo', 'active'],
    ['Completo', 'completed'],
  ]

  # Métodos úteis para análise
  def total_interviews
    interviews.count
  end

  def completed_interviews
    interviews.completed.count
  end

  def completion_rate
    return 0 if total_interviews.zero?
    (completed_interviews.to_f / total_interviews * 100).round(1)
  end
end
