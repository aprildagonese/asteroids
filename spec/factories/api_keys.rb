FactoryBot.define do
  factory :api_key do
    association :user
    value { 'SAMPLE-API-KEY' }
  end
end
