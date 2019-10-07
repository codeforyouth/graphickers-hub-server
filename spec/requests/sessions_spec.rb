require 'rails_helper'

describe 'Session' do
    let(:graphicker) { # テスト用アカウント
        FactoryBot.create :graphicker
    }

    describe 'Session#create - ログイン' do
        context 'パラメータが妥当な場合' do
            example 'リクエストが成功すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session)
                expect(response.status).to eq(200)
            end

            example 'グラフィッカーがログインに成功すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session)
                expect(JSON.parse(response.body)['token']).to be_truthy
            end

            example 'グラフィッカーのトークンが生成されていること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session)
                expect(Graphicker.find_by(name: 'watson').token_digest).to be_truthy
            end
        end

        context 'パスワードが違う場合' do
            example 'リクエストが失敗すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session, :invalid_password)
                expect(response.status).to eq(422)
            end

            example 'グラフィッカーがログインに失敗すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session, :invalid_password)
                expect(JSON.parse(response.body)['token']).to be_falsey
            end
            
            example 'グラフィッカーのトークンが生成されていないこと' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session, :invalid_password)
                expect(Graphicker.find_by(name: 'watson').token_digest).to be_falsey
            end
        end

        context '存在しないユーザを指定した場合' do
            example 'リクエストが失敗すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session, :invalid_graphicker)
                expect(response.status).to eq(422)
            end

            example 'グラフィッカーがログインに失敗すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session, :invalid_graphicker)
                expect(JSON.parse(response.body)['token']).to be_falsey
            end
        end
    end

    describe 'Session#delete - ログアウト' do
        let(:session) {
            FactoryBot.attributes_for(:session)
        }

        context 'パラメータが妥当な場合' do
            example 'リクエストが成功すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session)
                session['token'] = JSON.parse(response.body)['token']
                post '/logout', params: session
                expect(response.status).to eq(200)
            end

            example 'グラフィッカーがログアウトに成功すること(トークンが削除されていること)' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session)
                session['token'] = JSON.parse(response.body)['token']
                post '/logout', params: session
                expect(Graphicker.find_by(name: 'watson').token_digest).to be_falsey
            end
        end

        context 'ログインしていない場合' do
            example 'リクエストが失敗すること' do
                graphicker
                post '/logout', params: FactoryBot.attributes_for(:session)
                expect(response.status).to eq(422)
            end
        end

        context 'トークンが間違っている場合' do
            example 'リクエストが失敗すること' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session)
                session['token'] = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
                post '/logout', params: session
                expect(response.status).to eq(422)
            end

            example 'グラフィッカーがログアウトに失敗すること(トークンが削除されないこと)' do
                graphicker
                post '/login', params: FactoryBot.attributes_for(:session)
                session['token'] = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
                post '/logout', params: session
                expect(Graphicker.find_by(name: 'watson').token_digest).to be_truthy
            end
        end
    end
end