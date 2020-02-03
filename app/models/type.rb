class Type < ApplicationRecord
  belongs_to :collection
  has_many :products, dependent: :destroy
  validates :name, presence: true,  length: {maximum: 50}
end
