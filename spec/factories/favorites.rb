FactoryBot.define do
  factory :favorite do
    association :user
    neo_reference_id { 'Jesse Katsopolis' }
  end
end
