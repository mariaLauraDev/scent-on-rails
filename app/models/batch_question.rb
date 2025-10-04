class BatchQuestion < ApplicationRecord
  belongs_to :batch
  belongs_to :question

  validates :position, presence: true, uniqueness: { scope: :batch_id }

  scope :ordered, -> { order(:position) }
end
