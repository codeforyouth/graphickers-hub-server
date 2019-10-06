class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true
      t.string :tag
      t.binary :data

      t.timestamps
    end
  end
end
