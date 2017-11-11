FactoryGirl.define do
  factory :user do
    email { "u#{Gen.serial}@#{Howitzer.mailgun_domain}" }
    name { "u#{Gen.serial}" }
    password { Howitzer.app_test_pass }
    looking_for_work_radio { Howitzer.app_test_user_looking_for_work_radio }

    trait :default do
      initialize_with { User.default || User.new }
    end

    trait :admin do
      is_admin true
    end
  end
end
