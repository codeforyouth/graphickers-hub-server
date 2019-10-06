FactoryBot.define do
    factory :graphicker do
        sequence(:name) { |n| "TEST_NAME#{n}"}
        sequence(:email) { |n| "testmail_#{n}@test.com"}
        sequence(:password) { |n| "hogehoge#{n}"}
        sequence(:password_confirmation) { |n| "hogehoge#{n}"}
    end
end