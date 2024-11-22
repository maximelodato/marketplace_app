class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association avec les propriétés
  has_many :properties, dependent: :destroy
end
