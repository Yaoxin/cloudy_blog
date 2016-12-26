class AddColumnToWeibo < ActiveRecord::Migration[5.0]
  def change
    add_column :weibos, :img, :string
  end
end
