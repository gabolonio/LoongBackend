class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :father
      t.integer :son
      t.float :amount
      t.string :state, default: "wait"
      t.timestamps null: false
    end
  end
end
