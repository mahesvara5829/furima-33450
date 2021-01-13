class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_cord,null: false
      t.integer :send_area_id,null: false
      t.string :city,null: false
      t.string :address_detail,null: false
      t.string :apart_name_num
      t.string :phone_number,null: false
      t.references :order,null: false, foreign_key: true

      t.timestamps
    end
  end
end
