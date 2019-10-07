require 'rails_helper'

RSpec.describe 'Session#new - ログイン' do
    before do
        FactoryBot.create :graphicker
    end

    context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
            post '/login', params: FactoryBot.attributes_for(:session)
            expect(response.status).to eq(200)
        end

        it 'グラフィッカーがログインに成功すること' do
            post '/login', params: FactoryBot.attributes_for(:session)
            expect(JSON.parse(response.body)['token']).to be_truthy
        end
    end

    context 'パスワードが違う場合' do
        it 'リクエストが失敗すること' do
            post '/login', params: FactoryBot.attributes_for(:session, :invalid_password)
            expect(response.status).to eq(422)
        end

        it 'グラフィッカーがログインに失敗すること' do
            post '/login', params: FactoryBot.attributes_for(:session, :invalid_password)
            expect(JSON.parse(response.body)['token']).to be_falsey
        end
    end

    context '存在しないユーザを指定した場合' do
        it 'リクエストが失敗すること' do
            post '/login', params: FactoryBot.attributes_for(:session, :invalid_graphicker)
            expect(response.status).to eq(422)
        end

        it 'グラフィッカーがログインに失敗すること' do
            post '/login', params: FactoryBot.attributes_for(:session, :invalid_graphicker)
            expect(JSON.parse(response.body)['token']).to be_falsey
        end
    end
end

RSpec.describe 'Session#delete - ログアウト' do
    before do
        FactoryBot.create :graphicker
    end
    let(:token) {
        post '/login', params: FactoryBot.attributes_for(:session)
        JSON.parse(response.body)['token']
    }
    let(:user) {
        FactoryBot.attributes_for(:session)
    }

    context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
            user['token'] = token
            post '/logout', params: user
            expect(response.status).to eq(200)
        end

        it 'グラフィッカーがログアウトに成功すること' do
            user['token'] = token
            post '/logout', params: user
            expect(User.find_by(name: 'watson').token).to be_falsey
        end
    end
end