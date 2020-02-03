class Color < ApplicationRecord
    has_and_belongs_to_many :products, join_table: "colors_products"
end
