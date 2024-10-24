class CreateSeguidors < ActiveRecord::Migration[7.1]
  def change
    create_table :seguidors do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :seguidor_id
      t.integer :seguido_id

      t.timestamps
    end
  end
end
