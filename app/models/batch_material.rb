class BatchMaterial < ApplicationRecord
  belongs_to :batch
  belongs_to :material

  validates :position, presence: true, uniqueness: { scope: :batch_id }

  scope :ordered, -> { order(:position) }
end
