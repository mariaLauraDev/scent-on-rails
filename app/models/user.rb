class User < ApplicationRecord
  # Futuro: sistema de login para admins/pesquisadores
  # has_secure_password
  # validates :email, presence: true, uniqueness: true
  
  # Por enquanto, manter campos existentes para não quebrar
  validates :name, presence: true
  
  # Futuros relacionamentos:
  # has_many :batches, foreign_key: :created_by_id (quem criou o lote)
end
