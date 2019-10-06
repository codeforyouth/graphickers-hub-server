FactoryBot.define do
    factory :session, :class => 'Graphicker' do
        name {'watson'}
        password {'hogehoge'}

        trait :invalid_password do
            password {'hogehoge2'}
        end

        trait :invalid_graphicker do
            name {'invalid_graphicker'}
        end
    end
end