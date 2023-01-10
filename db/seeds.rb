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
user = User.create(phone: 987_654_321, linkedin: 'www.google.com', title: 'Backend Developer',
                   experience: 'Working over 10 years', education: 'I have studied in Harvard',
                   email: 'hola@mail.com', name: 'prueba 2')

company = Company.create(name: 'THe company name SA',
                         description: '  Etiam elementum, mi eget aliquam lobortis, elit libero tempus ex ',
                         email: 'web.works@gmail.com',
                         website: 'www.webworks.com')

job = company.jobs.create(name: 'full-Stack Developer', category: 'Manufactoring',
                          min_salary: 1500, max_salary: 2000, requirements: 'Que tengas 100 años de experiencia comprabada en rails')

following_job = Following.new(user_id: user.id)
following_job.followable = job

following_company = Following.new(user_id: user.id)
following_company.followable = company
