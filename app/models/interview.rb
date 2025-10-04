class Interview < ApplicationRecord
  belongs_to :interviewee
  belongs_to :batch
  has_many :answers, dependent: :destroy

  validates :interview_date, presence: true
  validates :status, presence: true

  enum :status, { pending: 'pending', in_progress: 'in_progress', completed: 'completed', cancelled: 'cancelled' }

  scope :completed, -> { where(status: 'completed') }
  scope :by_interviewee, ->(interviewee) { where(interviewee: interviewee) }
  scope :by_batch, ->(batch) { where(batch: batch) }
end
