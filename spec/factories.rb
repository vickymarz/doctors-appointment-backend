FactoryBot.define do
  factory :user do
    name { 'okorojiebube' }
    email { 'okorojiebubee3@gmail.com' }
    password { '123456789' }
  end
end

FactoryBot.define do
  factory :doctor do
    name { 'okorojiebube' }
    specialization { 'coder' }
    charges { 20 }
  end
end
