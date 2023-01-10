# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_110_021_838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'applications_jobs', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'job_id', null: false
    t.integer 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_id'], name: 'index_applications_jobs_on_job_id'
    t.index ['user_id'], name: 'index_applications_jobs_on_user_id'
  end

  create_table 'companies', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.string 'email'
    t.string 'website'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'followings', force: :cascade do |t|
    t.string 'followable_type', null: false
    t.bigint 'followable_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[followable_type followable_id], name: 'index_followings_on_followable'
    t.index ['user_id'], name: 'index_followings_on_user_id'
  end

  create_table 'jobs', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.string 'category'
    t.string 'type'
    t.float 'min_salary'
    t.float 'max_salary'
    t.text 'requirements'
    t.text 'optional_requirements'
    t.bigint 'company_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_jobs_on_company_id'
  end

  create_table 'users', force: :cascade do |t|
    t.integer 'phone'
    t.date 'birthdate'
    t.string 'linkedin'
    t.string 'title'
    t.text 'experience'
    t.text 'education'
    t.string 'email'
    t.string 'name'
    t.integer 'followings_count'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.boolean 'allow_password_change', default: false
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.json 'tokens'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true
  end

  add_foreign_key 'applications_jobs', 'jobs'
  add_foreign_key 'applications_jobs', 'users'
  add_foreign_key 'followings', 'users'
  add_foreign_key 'jobs', 'companies'
end
