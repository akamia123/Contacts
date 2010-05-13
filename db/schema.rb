# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100502020548) do

  create_table "addresses", :force => true do |t|
    t.integer  "contact_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "address_type"
    t.boolean  "primary",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["city"], :name => "index_addresses_on_city"
  add_index "addresses", ["contact_id"], :name => "index_addresses_on_contact_id"
  add_index "addresses", ["state"], :name => "index_addresses_on_state"
  add_index "addresses", ["zip_code"], :name => "index_addresses_on_zip_code"

  create_table "business_cards", :force => true do |t|
    t.integer  "contact_id"
    t.string   "card_file_name"
    t.string   "card_content_type"
    t.integer  "card_file_size"
    t.datetime "card_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_cards", ["contact_id"], :name => "index_business_cards_on_contact_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.string   "stock_symbol"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["city"], :name => "index_companies_on_city"
  add_index "companies", ["name"], :name => "index_companies_on_name"
  add_index "companies", ["state"], :name => "index_companies_on_state"
  add_index "companies", ["stock_symbol"], :name => "index_companies_on_stock_symbol"

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mi"
    t.string   "nickname"
    t.string   "job_title"
    t.text     "notes"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "public",               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["company_id"], :name => "index_contacts_on_company_id"
  add_index "contacts", ["last_name", "first_name"], :name => "index_contacts_on_last_name_and_first_name"
  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "emails", :force => true do |t|
    t.integer  "contact_id"
    t.string   "email"
    t.string   "email_type"
    t.boolean  "primary",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["contact_id"], :name => "index_emails_on_contact_id"
  add_index "emails", ["email"], :name => "index_emails_on_email"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "telephones", :force => true do |t|
    t.integer  "contact_id"
    t.string   "number"
    t.string   "phone_type"
    t.boolean  "primary",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "telephones", ["contact_id"], :name => "index_telephones_on_contact_id"
  add_index "telephones", ["number"], :name => "index_telephones_on_number"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mi"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
