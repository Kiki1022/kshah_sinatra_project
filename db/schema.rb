
ActiveRecord::Schema.define(version: 20201016224213) do

  create_table "clients", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "event"
    t.float   "rate"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end

#schema.rb is what current shape of database tables are