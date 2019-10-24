class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.references :graphicker, foreign_key: true, null: false
      t.string :title, null: false
      t.text :show, null: false
      t.references :image, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
