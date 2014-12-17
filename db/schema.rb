# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141216024512) do

  create_table "addresses", force: true do |t|
    t.string   "line_1",     default: "", null: false
    t.string   "zip_code",   default: "", null: false
    t.string   "city",       default: "", null: false
    t.string   "state",      default: "", null: false
    t.string   "country",    default: "", null: false
    t.integer  "user_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "name"
    t.text     "type"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "allergies", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "allergies_family_members", id: false, force: true do |t|
    t.integer "allergy_id",       null: false
    t.integer "family_member_id", null: false
  end

  add_index "allergies_family_members", ["allergy_id", "family_member_id"], name: "index_allergies_family_members_allergy_id_and_family_member_id"

  create_table "coupon_allocations", force: true do |t|
    t.integer "coupon_id"
    t.integer "partner_id"
  end

  create_table "coupon_uses", force: true do |t|
    t.integer  "coupon_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.text     "description"
    t.string   "shareable_tag"
    t.string   "shareable_link"
    t.string   "stripe_coupon_name"
    t.datetime "expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag_signed"
    t.text     "welcome_message"
  end

  create_table "dietary_categories", force: true do |t|
    t.string   "name",              default: "", null: false
    t.string   "icon_file_name",                 null: false
    t.string   "icon_content_type",              null: false
    t.integer  "icon_file_size",                 null: false
    t.string   "icon_fingerprint",               null: false
    t.datetime "icon_updated_at",                null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "dietary_categories_recipes", id: false, force: true do |t|
    t.integer "dietary_category_id", null: false
    t.integer "recipe_id",           null: false
  end

  add_index "dietary_categories_recipes", ["dietary_category_id", "recipe_id"], name: "index_dietary_categories_recipes_on_category_and_recipe"

  create_table "family_members", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "other_allergies"
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "family_members", ["user_id"], name: "index_family_members_on_user_id"

  create_table "foods", force: true do |t|
    t.string   "name",       default: "", null: false
    t.string   "slug",       default: "", null: false
    t.integer  "sort_order", default: 0,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "season_id"
    t.text     "tips"
    t.boolean  "published"
  end

  add_index "foods", ["season_id"], name: "index_foods_on_season_id"
  add_index "foods", ["slug"], name: "index_foods_on_slug", unique: true

  create_table "foods_video_links", id: false, force: true do |t|
    t.integer "food_id",       null: false
    t.integer "video_link_id", null: false
  end

  add_index "foods_video_links", ["food_id", "video_link_id"], name: "index_foods_video_links_on_food_id_and_video_link_id"

  create_table "forms", force: true do |t|
    t.string   "user_name"
    t.string   "response_type"
    t.string   "browser_type"
    t.text     "message"
    t.string   "course_useful"
    t.string   "course_useful_explanation"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "photo_fingerprint"
    t.datetime "photo_updated_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "approved_for_marketing"
    t.boolean  "testimonial_approval"
    t.boolean  "testimonial"
  end

  create_table "home_page_features", force: true do |t|
    t.string   "key"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "name",              default: "", null: false
    t.integer  "sort_order",        default: 0,  null: false
    t.string   "file_file_name",                 null: false
    t.string   "file_content_type",              null: false
    t.integer  "file_file_size",                 null: false
    t.string   "file_fingerprint",               null: false
    t.datetime "file_updated_at",                null: false
    t.integer  "imageable_id",                   null: false
    t.string   "imageable_type",                 null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"

  create_table "ingredient_list_items", force: true do |t|
    t.string   "quantity",      default: "", null: false
    t.integer  "sort_order",    default: 0,  null: false
    t.integer  "ingredient_id",              null: false
    t.integer  "recipe_id",                  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "ingredient_list_items", ["ingredient_id", "recipe_id"], name: "index_ingredient_list_items_on_ingredient_id_and_recipe_id"

  create_table "ingredients", force: true do |t|
    t.string   "name",       default: "", null: false
    t.string   "category",   default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "media", force: true do |t|
    t.string   "file_file_name",    null: false
    t.string   "file_content_type", null: false
    t.integer  "file_file_size",    null: false
    t.string   "file_fingerprint",  null: false
    t.datetime "file_updated_at",   null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "pages", force: true do |t|
    t.string   "slug",       default: "", null: false
    t.text     "body",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true

  create_table "partners", force: true do |t|
    t.string   "name"
    t.string   "email_domain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "welcome_message"
  end

  create_table "payments", force: true do |t|
    t.integer  "amount",      default: 0,  null: false
    t.string   "card_token",  default: "", null: false
    t.string   "product_id",  default: "", null: false
    t.string   "customer_id", default: "", null: false
    t.string   "charge_id",   default: "", null: false
    t.integer  "user_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "pdfs", force: true do |t|
    t.string   "file_file_name",    null: false
    t.string   "file_content_type", null: false
    t.integer  "file_file_size",    null: false
    t.string   "file_fingerprint",  null: false
    t.datetime "file_updated_at",   null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "recipes", force: true do |t|
    t.string   "title",        default: "",    null: false
    t.string   "subtitle",     default: ""
    t.string   "prep_time",    default: "",    null: false
    t.string   "cook_time",    default: "",    null: false
    t.string   "serving_size", default: "",    null: false
    t.string   "difficulty",   default: "",    null: false
    t.text     "instructions", default: "",    null: false
    t.integer  "sort_order",   default: 0,     null: false
    t.integer  "food_id",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "tips"
    t.boolean  "optional",     default: false, null: false
  end

  add_index "recipes", ["food_id"], name: "index_recipes_on_food_id"

  create_table "recipes_shopping_lists", id: false, force: true do |t|
    t.integer "recipe_id",        null: false
    t.integer "shopping_list_id", null: false
  end

  add_index "recipes_shopping_lists", ["recipe_id", "shopping_list_id"], name: "index_recipes_shopping_lists_on_recipe_id_and_shopping_list_id"

  create_table "seasons", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "published"
  end

  create_table "seasons_users", id: false, force: true do |t|
    t.integer "user_id",   null: false
    t.integer "season_id", null: false
  end

  add_index "seasons_users", ["user_id", "season_id"], name: "index_seasons_users_on_user_id_and_season_id"

  create_table "shopping_lists", force: true do |t|
    t.string   "name"
    t.datetime "completed_at"
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "extra_list_items"
    t.text     "notes"
  end

  add_index "shopping_lists", ["user_id"], name: "index_shopping_lists_on_user_id"

  create_table "sub_recipes", force: true do |t|
    t.integer  "recipe_id",       null: false
    t.integer  "child_recipe_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "sub_recipes", ["recipe_id", "child_recipe_id"], name: "index_sub_recipes_on_recipe_id_and_child_recipe_id"

  create_table "subscriptions", force: true do |t|
    t.string   "card_token", default: "", null: false
    t.string   "plan_id",    default: "", null: false
    t.integer  "user_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                                   default: "",    null: false
    t.string   "encrypted_password",                      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name",                              default: "",    null: false
    t.string   "last_name",                               default: "",    null: false
    t.text     "family_description"
    t.text     "family_struggles"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "season_id"
    t.string   "username",                                default: "",    null: false
    t.string   "payment_gateway_customer_id"
    t.boolean  "onboarded",                               default: false, null: false
    t.boolean  "forum_onboarded",                         default: false, null: false
    t.string   "gift_giver_name"
    t.text     "gift_message",                limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["season_id"], name: "index_users_on_season_id"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "video_links", force: true do |t|
    t.string   "name",        default: "", null: false
    t.integer  "height",      default: 0,  null: false
    t.integer  "width",       default: 0,  null: false
    t.string   "provider_id", default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "sort_order",  default: 0,  null: false
    t.string   "category"
  end

  create_table "wait_lists", force: true do |t|
    t.string   "first_name", default: "",   null: false
    t.string   "last_name",  default: "",   null: false
    t.string   "email",      default: "",   null: false
    t.boolean  "newsletter", default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
