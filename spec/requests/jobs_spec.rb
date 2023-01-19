require "rails_helper"

describe "Jobs", type: :request do
  it "-index path respond with http succes status code" do
		# llamada al endpoint
		get "/api/v1/jobs"
		# configuraciones
		# evaluacion
		expect(response.status).to eq(200)	
		# expect(response).to have_http_status(:ok)
	end

	it "returns a json with all jobs" do
	
  	# a nivel de prueba hay que decirle esto, ya que interactua con la bd de pruebas
		Job.create(name: "test", description: "Provide autonomous legal advice to the company on all aspects of the law with a focus on Data Protection Law, Provide legal advice and trainings to different stakeholders within Nintendo of Europe, Nintendo of Japan and European local markets on data protection within the European region, Draft and review letters, contracts and other data protection- or commercial law-related documents for the European region, Collaborate with and guide the Data Protection Administrator in the team, Representation of Nintendo in data protection working groups of European video games trade associations ", requirements: " German law degree or law degree of another European country, Several years of post-qualification experience in a law firm or as an in-house lawyer, Excellent knowledge of European data protection law, civil law, and IT laws, Strong academics, excellent negotiation and drafting skills German law degree or law degree of another European country, Several years of post-qualification experience in a law firm or as an in-house lawyer, Excellent knowledge of European data protection law, civil law, and IT laws, Strong academics, excellent negotiation and drafting skills excellent negotiation and drafting skills excellent negotiation and drafting skills excellent negotiation and drafting skills ", optional_requirements: "English language, German law degree or law degree of another European country, Several years of post-qualification experience in a law firm or as an in-house lawyer, Excellent knowledge of European data protection law, civil law, and IT laws, Strong academics, excellent negotiation and drafting skills", company_id: 1 )
		Job.create(name: "test")

		get "/api/v1/jobs/"

		jobs = JSON.parse(response.body)
		expect(jobs.size).to eq 0
	end
end