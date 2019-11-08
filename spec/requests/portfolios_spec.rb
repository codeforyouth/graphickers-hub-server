require 'rails_helper'

describe 'Portfolio' do
    let(:gen_graphicker) { # テスト用アカウント
        FactoryBot.create :graphicker
    }
    let(:gen_portfolio) { # テスト用ポートフォリオ
        FactoryBot.create :portfolio
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
                gen_graphicker
                post '/login', params: FactoryBot.attributes_for(:graphicker)
                session['token'] = JSON.parse(response.body)['token']
                portfolio['graphicker_id'] = JSON.parse(response.body)['id']
                session['portfolio'] = portfolio
                post '/portfolios', params: session
                expect(response.status).to eq(201)
            end
            
            example 'ポートフォリオが登録されること' do
                gen_graphicker
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
    
    describe 'Portfolio#update - ポートフォリオ更新' do
        context 'パラメータが妥当な場合' do
            example 'リクエストが成功すること' do
                gen_graphicker
                post '/login', params: FactoryBot.attributes_for(:graphicker)
                session['token'] = JSON.parse(response.body)['token']
                portfolio['graphicker_id'] = JSON.parse(response.body)['id']
                session['portfolio'] = portfolio
                post '/portfolios', params: session
                id = JSON.parse(response.body)['id']

                portfolio = FactoryBot.attributes_for(:portfolio, :for_update)
                session['portfolio'] = portfolio
                put "/portfolios/#{id}", params: session
                expect(response.status).to eq(200)
            end
            
            example 'ポートフォリオが更新されること' do
                gen_graphicker
                post '/login', params: FactoryBot.attributes_for(:graphicker)
                session['token'] = JSON.parse(response.body)['token']
                portfolio['graphicker_id'] = JSON.parse(response.body)['id']
                session['portfolio'] = portfolio
                post '/portfolios', params: session
                id = JSON.parse(response.body)['id']

                portfolio = FactoryBot.attributes_for(:portfolio, :for_update)
                session['portfolio'] = portfolio

                expect do
                    put "/portfolios/#{id}", params: session
                end.to change{Portfolio.find(id).show}
            end
        end
    end
end