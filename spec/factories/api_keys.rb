FactoryBot.define do
  factory :api_key do
    user
    value { 'SAMPLE-API-KEY' }
  end
end
