FactoryBot.define do
    factory :graphicker do
        name {'watson'}
        email {'sensunowatson@myemail.com'}
        password {'hogehoge'}
        password_confirmation {'hogehoge'}

        trait :no_name do
            name {nil}
        end

        trait :no_email do
            email {nil}
        end

        trait :invalid_email do
            email {'sensunowatson-myemail.com'}
        end

        trait :password_too_short do
            password {'a'}
            password_confirmation {'a'}
        end

        trait :password_unmatch do
            password_confirmation {'hogehoge2'}
        end
    end
end