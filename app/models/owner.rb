class Owner < ApplicationRecord
  has_many :properties
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
