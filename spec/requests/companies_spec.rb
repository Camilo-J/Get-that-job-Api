require "rails_helper"

describe "Companies", type: :request do

	# Para el index ------------------ nota: no definieron index

  # it "-index path respond with http succes status code" do
	# 	# llamada al endpoint
	# 	get "/api/v1/companies/2"
	# 	# configuraciones
	# 	# evaluacion
	# 	expect(response.status).to eq(200)	
	# 	# expect(response).to have_http_status(:ok)
	# end

	# it "returns a json with all companies" do
	# 	Company.create(name: "test")

	# 	get "/api/v1/companies/"

	# 	companies = JSON.parse(response.body)
	# 	expect(companies.size).to eq 1
	# end
end

describe 'show path' do
  it 'respond with http success status code' do
    company = Company.create(name: 'Test', email: 'test@gmail.com', password: '123456')
		# puts company.id
    get api_v1_company_path(company)
    expect(response).to have_http_status(:ok)
  end

  it 'respond with the correct company' do
    company = Company.create(name: 'Test', email: 'test@gmail.com', password: '123456')
    get api_v1_company_path(company)
    actual_company = JSON.parse(response.body)
    expect(actual_company['id']).to eql(company.id)
  end
end