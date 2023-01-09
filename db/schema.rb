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

ActiveRecord::Schema[7.0].define(version: 20_230_109_212_532) do
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
  end

  add_foreign_key 'applications_jobs', 'jobs'
  add_foreign_key 'applications_jobs', 'users'
  add_foreign_key 'followings', 'users'
  add_foreign_key 'jobs', 'companies'
end
