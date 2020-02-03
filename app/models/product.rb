class Product < ApplicationRecord
    has_many :pictures , dependent: :destroy
    belongs_to :type
    has_and_belongs_to_many :sizes, join_table: "products_sizes"
    has_and_belongs_to_many :colors, join_table: "colors_products"
    has_many :detail_bills
    has_many :bills, through: :detail_bills
    accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
    validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
end
