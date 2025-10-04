class Interviewee < ApplicationRecord
  has_many :interviews, dependent: :destroy
  has_many :batches, through: :interviews
  has_many :answers, through: :interviews

  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :gender, presence: true
  validates :sector, presence: true

  scope :by_age_range, ->(min, max) { where(age: min..max) }
  scope :by_gender, ->(gender) { where(gender: gender) }
  scope :by_sector, ->(sector) { where(sector: sector) }

  SECTOR_OPTIONS = [
    ['Administrativo', 'administrativo'],
    ['Vendas', 'vendas'],
    ['Marketing', 'marketing'],
    ['Outro', 'outro']
  ]

  GENDER_OPTIONS = [
    ['Masculino', 'masculino'],
    ['Feminino', 'feminino'],
    ['Outro', 'outro']
  ]

  def last_interview_date
    interviews.order(interview_date: :desc).first&.interview_date
  end
end
