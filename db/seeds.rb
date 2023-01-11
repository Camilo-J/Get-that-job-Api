# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create_table 'users', force: :cascade do |t|
#     t.integer 'phone'
#     t.date 'birthdate'
#     t.string 'linkedin'
#     t.string 'title'
#     t.text 'experience'
#     t.text 'education'
#     t.string 'email'
#     t.string 'name'
#     t.integer 'followings_count'
#     t.datetime 'created_at', null: false
#     t.datetime 'updated_at', null: false
#   end
# user = User.create(phone: 987_654_321, linkedin: 'www.google.com', title: 'Backend Developer',
#                    experience: 'Working over 10 years', education: 'I have studied in Harvard',
#                    email: 'hola@mail.com', name: 'prueba 2')

# company = Company.create(name: 'THe company name SA',
#                          description: '  Etiam elementum, mi eget aliquam lobortis, elit libero tempus ex ',
#                          email: 'web.works@gmail.com',
#                          website: 'www.webworks.com')

# job = company.jobs.create(name: 'full-Stack Developer', category: 'Manufactoring',
#                           min_salary: 1500, max_salary: 2000, requirements: 'Que tengas 100 años de experiencia comprabada en rails')

# following_job = Following.new(user_id: user.id)
# following_job.followable = job

# following_company = Following.new(user_id: user.id)
# following_company.followable = company

require "json"

users_data = JSON.parse(File.read("db/data/users.json"))
companies_data = JSON.parse(File.read("db/data/companies.json"))
# jobs_data = JSON.parse(File.read("db/data/jobs.json"))

puts "Start seeding"
User.destroy_all
Company.destroy_all
Job.destroy_all

# User.find_or_create_by(username: "user_test") do |user|
#     user.email = "user@test.com"
#     user.birth_date = "1990-01-01"
#     user.first_name = "User"
#     user.last_name = "Test"
#     user.password = "qwerty"
#     user.password_confirmation = "qwerty"
#   end
  
	puts "Seeding users"
	users_data.each do |professional_data|
		new_professional = User.new(professional_data)
		puts "Professional not created. Errors: #{new_professional.errors.full_messages}" unless new_professional.save
	end

	puts "Seeding companies and jobs"
	# companies_data.each do |company_data|
	# 	new_company = Company.new(company_data)
	# 	puts "Company not created. Errors: #{new_company.errors.full_messages}" unless new_company.save
	# end
  
  main_companies_data = companies_data.select {|company| company["jobs"].nil? }
  
  main_companies_data.each do |company|
    company_data = company.slice("name", "description", "email", "website")
    new_company = Company.new(company_data)
    puts "Company not created. Errors: #{new_company.errors.full_messages}" unless new_company.save
  
    company["jobs"].each do |job_data|
      # job = Company.find_by(name: involved_company_data["name"])
  
      new_job = Job.new(company: new_company,
												name: job_data["name"], 
												description: job_data["description"], 
												category: job_data["category"],
												type_job: job_data["type_job"],
												min_salary: job_data["min_salary"],
												max_salary: job_data["max_salary"],
												requirements: job_data["requirements"],
												optional_requirements: job_data["optional_requirements"],
												state: job_data["state"],
											)
      puts "Job not created. Errors: #{new_job.errors.full_messages}" unless new_job.save
    end
  end

	puts "End seeding"
   