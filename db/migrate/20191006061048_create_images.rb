class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true, null: false
      t.string :tag, null: false, unique: true
      t.binary :data, null: false

      t.timestamps
    end
  end
end
