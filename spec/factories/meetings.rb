FactoryBot.define do
  factory :meeting do
    user 
    room 
    name { Faker::Name.name  }
    start_date { Faker::Time.between(from: "#{Date.current} 08:00:00", to: "#{Date.current} 18:00:00") }
    end_date { Faker::Time.between(from: start_date, to: "#{Date.current} 18:00:00") }
  end
end
