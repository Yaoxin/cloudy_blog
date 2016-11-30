class CreateWeibos < ActiveRecord::Migration[5.0]
  def change
    create_table :weibos do |t|
      t.text :cnt

      t.timestamps
    end
  end
end
