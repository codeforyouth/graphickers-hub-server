class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.reference :user
      t.string :tag
      t.binary :data

      t.timestamps
    end
  end
end
