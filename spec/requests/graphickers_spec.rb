require 'rails_helper'

RSpec.describe 'Graphicker#new' do
    context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
            post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker)}
            expect(response.status).to eq(201)
        end
        it 'グラフィッカーが登録されること' do
            expect do
                post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker)}
            end.to change(Graphicker, :count).by(1)
        end 
    end

    context 'nameが与えられていない場合' do
        it 'リクエストが失敗すること' do
            post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :no_name)}
            expect(response.status).to eq(422)
        end

        it 'グラフィッカーが登録されないこと' do
            expect do
                post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :no_name)}
            end.to_not change(Graphicker, :count)
        end
    end

    context 'emailが与えられていない場合' do
        it 'リクエストが失敗すること' do
            post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :no_email)}
            expect(response.status).to eq(422)
        end

        it 'グラフィッカーが登録されないこと' do
            expect do
                post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :no_email)}
            end.to_not change(Graphicker, :count)
        end
    end

    context 'emailが不正な場合' do
        it 'リクエストが失敗すること' do
            post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :invalid_email)}
            expect(response.status).to eq(422)
        end

        it 'グラフィッカーが登録されないこと' do
            expect do
                post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :invalid_email)}
            end.to_not change(Graphicker, :count)
        end
    end

    context 'passwordが短すぎる場合' do
        it 'リクエストが失敗すること' do
            post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :password_too_short)}
            expect(response.status).to eq(422)
        end

        it 'グラフィッカーが登録されないこと' do
            expect do
                post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :password_too_short)}
            end.to_not change(Graphicker, :count)
        end
    end

    context 'passwordが不一致な場合' do
        it 'リクエストが失敗すること' do
            post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :password_unmatch)}
            expect(response.status).to eq(422)
        end

        it 'グラフィッカーが登録されないこと' do
            expect do
                post '/graphickers', params: {graphicker: FactoryBot.attributes_for(:graphicker, :password_unmatch)}
            end.to_not change(Graphicker, :count)
        end
    end
end
