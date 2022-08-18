class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title,                    null: false
      t.text :first_detail,               null: false
      t.text :second_detail
      t.integer :category_id,             null: false
      t.integer :select_donation_id,      null: false
      t.integer :donation_target_amount
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
