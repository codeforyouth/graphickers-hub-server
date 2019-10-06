require 'rails_helper'

RSpec.describe 'Login' do
    before do
        FactoryBot.create :graphicker
    end

    context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
            post '/login', params: {name:'watson', password:'hogehoge'}
            expect(response.status).to eq(200)
        end

        it 'グラフィッカーがログインに成功すること' do
            post '/login', params: {name:'watson', password:'hogehoge'}
            expect(JSON.parse(response.body)['token']).to be_truthy
        end
    end
end
