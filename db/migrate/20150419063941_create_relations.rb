class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :url_i
      t.string :url_o
      t.integer :father
      t.integer :son
      t.float :amount
      t.string :state
      t.timestamps null: false
    end
  end
end
