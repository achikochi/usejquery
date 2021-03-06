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

ActiveRecord::Schema.define(:version => 20091229045504) do

  create_table "post_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_categorizations", :force => true do |t|
    t.integer  "post_id"
    t.integer  "post_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "url"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.boolean  "published"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "excerpt"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
