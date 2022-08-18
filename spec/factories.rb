FactoryBot.define do
  factory :user do
    id { rand(1..100) }
    name { 'okorojiebube' }
    email { 'okorojiebube333@gmail.com' }
    password { '123456789' }
  end
end

FactoryBot.define do
  factory :doctor do
    name { 'okorojiebube' }
    description { 'hello' }
    specialization { 'coder' }
    charges { 20 }
    photo { 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2' }
  end
end

FactoryBot.define do
  factory :appointment do
    name { 'faith' }
    city { 'Canada' }
    date { '22-02-2022' }
    doctor { FactoryBot.create(:doctor) }
    user { FactoryBot.create(:user) }
  end
end
