require 'rails_helper'

describe 'Portfolio' do
    let(:graphicker) { # テスト用アカウント
        FactoryBot.create :graphicker
    }
    let(:session) { # セッション保持用変数
        FactoryBot.attributes_for(:graphicker)
    }
    let(:portfolio) { # テスト用投稿
        FactoryBot.attributes_for(:portfolio)
    }

    describe 'Portfolio#create - ポートフォリオ登録' do
        context 'パラメータが妥当な場合' do
            example 'リクエストが成功すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:graphicker)
                session['token'] = JSON.parse(response.body)['token']
                portfolio['graphicker_id'] = JSON.parse(response.body)['id']
                session['portfolio'] = portfolio
                post '/portfolios', params: session
                expect(response.status).to eq(201)
            end
            
            example 'ポートフォリオが登録されること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:graphicker)
                session['token'] = JSON.parse(response.body)['token']
                portfolio['graphicker_id'] = JSON.parse(response.body)['id']
                session['portfolio'] = portfolio
                
                expect do
                    post '/portfolios', params: session
                end.to change(Portfolio, :count).by(1)
            end
        end
    end
end