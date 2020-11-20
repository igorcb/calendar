FactoryBot.define do
  factory :room do
    sequence(:name) { |n| "Room #{n}" }
    status { 1 }
  end
end
