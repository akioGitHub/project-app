class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title,        null: false
      t.text :item,           null: false
      t.date :deadline,       null: false
      t.references :project,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
