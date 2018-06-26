FactoryBot.define do
  factory :user do
    name 'Test'
    nickname { (0...10).map { ('a'..'z').to_a[rand(26)] }.join }
    email { "#{(0...10).map { ('a'..'z').to_a[rand(26)] }.join}@example.com" }
    password 'asdfasdf'

    factory :admin do
      admin true
    end
  end
end
