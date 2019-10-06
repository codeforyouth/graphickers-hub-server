class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :show
      t.reference :image

      t.timestamps
    end
  end
end
