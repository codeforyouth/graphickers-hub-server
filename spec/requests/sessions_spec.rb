require 'rails_helper'

RSpec.describe 'Session' do
    before do
        FactoryBot.create :graphicker
    end

    context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
            post '/login', params: {name: 'watson', password: 'hogehoge'}
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
