class Collection < ApplicationRecord
    has_many :types, dependent: :destroy
    has_many :products, through: :types, dependent: :destroy
    validates :name, uniqueness: {case_sensitive: false}, presence: true,  length: {maximum: 50}
end
