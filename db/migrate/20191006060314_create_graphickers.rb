class CreateGraphickers < ActiveRecord::Migration[6.0]
  def change
    create_table :graphickers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :token

      t.timestamps
    end
    add_index :graphickers, :token, unique: true
  end
end
