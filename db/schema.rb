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

ActiveRecord::Schema.define(version: 20160414073922) do

  create_table "activity_loggers", force: :cascade do |t|
    t.date     "activity_date"
    t.integer  "user_id"
    t.string   "activity_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "hours"
    t.integer  "min"
    t.string   "activity_measures"
    t.integer  "quantities"
  end

  add_index "activity_loggers", ["activity_date", "user_id"], name: "index_activity_loggers_on_activity_date_and_user_id"
  add_index "activity_loggers", ["user_id", "activity_type"], name: "index_activity_loggers_on_user_id_and_activity_type"
  add_index "activity_loggers", ["user_id"], name: "index_activity_loggers_on_user_id"

  create_table "comm_memberships", force: :cascade do |t|
    t.integer  "comm_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comm_memberships", ["comm_id", "member_id"], name: "index_comm_memberships_on_comm_id_and_member_id"
  add_index "comm_memberships", ["comm_id"], name: "index_comm_memberships_on_comm_id"
  add_index "comm_memberships", ["member_id"], name: "index_comm_memberships_on_member_id"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string   "c_name"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "communities", ["user_id"], name: "index_communities_on_user_id"

  create_table "d_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "discussion_id"
    t.integer  "community_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "d_comments", ["community_id"], name: "index_d_comments_on_community_id"
  add_index "d_comments", ["discussion_id"], name: "index_d_comments_on_discussion_id"
  add_index "d_comments", ["user_id"], name: "index_d_comments_on_user_id"

  create_table "discussions", force: :cascade do |t|
    t.text     "content"
    t.integer  "community_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "discussions", ["community_id"], name: "index_discussions_on_community_id"
  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id"

  create_table "educational_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "school"
    t.string   "degree"
    t.string   "field_of_study"
    t.string   "grade"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "educational_details", ["user_id"], name: "index_educational_details_on_user_id"

  create_table "employment_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "organisation"
    t.string   "position_held"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "employment_details", ["user_id"], name: "index_employment_details_on_user_id"

  create_table "other_activities", force: :cascade do |t|
    t.date     "activity_date"
    t.integer  "user_id"
    t.string   "activity_type"
    t.string   "activity_measures"
    t.integer  "quantity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "other_activities", ["activity_date", "user_id"], name: "index_other_activities_on_activity_date_and_user_id"
  add_index "other_activities", ["user_id", "activity_type"], name: "index_other_activities_on_user_id_and_activity_type"
  add_index "other_activities", ["user_id"], name: "index_other_activities_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_type"
    t.string   "first_name"
    t.string   "last_name"
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
    t.date     "dob"
    t.string   "gender"
    t.string   "education_status"
    t.string   "work_status"
    t.string   "smoking"
    t.string   "drinking"
    t.string   "diabetes_status"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
