require 'rails_helper'

RSpec.describe 'Graphicker' do
    it '新しいグラフィッカーが新規登録する' do
        valid_params = {
            name: 'watson',
            email: 'sensunowatson@myemail.com',
            password: 'hogehoge',
            password_confirmation: 'hogehoge'
        }

        expect {
            post '/graphickers',
            params: { graphicker: valid_params }
        }.to change(Graphicker, :count).by(+1)

        expect(response.status).to eq(201)
    end 
end
