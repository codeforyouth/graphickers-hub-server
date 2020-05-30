class AddEquipmentToGraphickers < ActiveRecord::Migration[6.0]
  def change
    add_column :graphickers, :equipment, :string
  end
end
