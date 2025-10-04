class Material < ApplicationRecord
  has_many :batch_materials, dependent: :destroy
  has_many :batches, through: :batch_materials
  has_many :answers, dependent: :destroy

  validates :name, presence: true
  validates :material_type, presence: true

  enum :material_type, { 
    base_fragrance: 'base_fragrance', 
    perfume: 'perfume', 
    fragrance_sample: 'fragrance_sample',
    other: 'other' 
  }
end
