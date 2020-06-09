class AddEventDateToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :event_date, :date
  end
end
