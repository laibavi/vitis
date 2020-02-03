class Bill < ApplicationRecord
  belongs_to :user
  has_many :detail_bills, dependent: :destroy
  has_many :products, through: :detail_bills
end
