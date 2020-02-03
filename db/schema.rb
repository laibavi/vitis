# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_13_172129) do

  create_table "bills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date_delivery"
    t.boolean "status"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "collections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "color_id"
    t.bigint "product_id"
    t.index ["color_id"], name: "index_colors_products_on_color_id"
    t.index ["product_id"], name: "index_colors_products_on_product_id"
  end

  create_table "detail_bills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "bill_id"
    t.bigint "product_id"
    t.integer "count"
    t.integer "price_all"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_detail_bills_on_bill_id"
    t.index ["product_id"], name: "index_detail_bills_on_product_id"
  end

  create_table "pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_pictures_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.integer "price"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_products_on_type_id"
  end

  create_table "products_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "size_id"
    t.index ["product_id"], name: "index_products_sizes_on_product_id"
    t.index ["size_id"], name: "index_products_sizes_on_size_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_types_on_collection_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "age"
    t.boolean "admin", default: false
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "phone"
  end

  add_foreign_key "bills", "users"
  add_foreign_key "colors_products", "colors"
  add_foreign_key "colors_products", "products"
  add_foreign_key "detail_bills", "bills"
  add_foreign_key "detail_bills", "products"
  add_foreign_key "pictures", "products"
  add_foreign_key "products", "types"
  add_foreign_key "products_sizes", "products"
  add_foreign_key "products_sizes", "sizes"
  add_foreign_key "types", "collections"
end
