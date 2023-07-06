class CreateMyGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :my_groups do |t|
      t.string :name
      t.string :icon
      t.integer :author_id

      t.timestamps
    end
    add_foreign_key :my_groups, :users, column: :author_id
    add_index :my_groups, :author_id
  end
end
