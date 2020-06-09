class AddPlaceToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :place, :string
  end
end
