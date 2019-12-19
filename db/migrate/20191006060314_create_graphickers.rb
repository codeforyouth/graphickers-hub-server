class CreateGraphickers < ActiveRecord::Migration[6.0]
  def change
    create_table :graphickers do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.text :introduction
      t.string :password_digest, null: false
      t.string :token_digest

      t.timestamps
    end
  end
end
