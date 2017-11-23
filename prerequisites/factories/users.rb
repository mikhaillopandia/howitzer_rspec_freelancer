FactoryBot.define do
  factory :user do
    email { "u#{Gen.serial}@#{Howitzer.mailgun_domain}" }
    name { "u#{Gen.serial}" }
    password { Howitzer.app_test_pass }
    looking_for { Howitzer.app_test_user_looking_for }
  end
end
