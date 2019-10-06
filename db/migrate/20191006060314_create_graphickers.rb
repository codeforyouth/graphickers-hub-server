class CreateGraphickers < ActiveRecord::Migration[6.0]
  def change
    create_table :graphickers do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :token, unique: true
      t.references :image, foreign_key: true, unique: true

      t.timestamps
    end
    add_index :graphickers, :token, unique: true
  end
end
