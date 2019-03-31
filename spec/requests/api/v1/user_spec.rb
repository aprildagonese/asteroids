require "rails_helper"

describe "GET /user" do
  it "returns a user with a valid API key" do
    user = create(:user, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")
    api_key = create(:api_key)

    get "/api/v1/user?api_key=#{api_key.value}"

    expect(response.status).to eq 200

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key :id
    expect(user).to_not have_key :password_digest

    expect(user[:email]).to eq "uncle.jesse@example.com"
    expect(user[:name]).to  eq "Jesse Katsopolis"
  end

  it "prevents access without a valid API key" do
    api_key = create(:api_key)

    get "/api/v1/user?api_key=NOT_LEGIT"

    expect(response.status).to eq 401
  end

  it "prevents access without an API key" do
    get "/api/v1/user"

    expect(response.status).to eq 401
  end
end

describe "GET /user/favorites" do
  it "returns a list of favorites" do
    april = create(:user, email: "adag@email.com", name: "April D")
    api_key = create(:api_key, value: "abc123", user: april)
    fave = create(:favorite, user: april, neo_reference_id: "2153306")

    get "/api/v1/user/favorites?api_key=#{api_key.value}"

    expect(response).to be_successful

    favorite = JSON.parse(response.body, symbolize_names: true)

    expect(favorite[0]["id"]).to eq("1")
    expect(favorite[0]["neo_reference_id"]).to eq("2153306")
    expect(favorite[0]["user_id"]).to eq("1")
    expect(favorite[0]["asteroid"]).to be_a(Hash)
    expect(favorite[0]["asteroid"]["name"]).to eq("153306 (2001 JL1)")
    expect(favorite[0]["asteroid"]["is_potentially_hazardous_asteroid"]).to eq(false)
  end
end
