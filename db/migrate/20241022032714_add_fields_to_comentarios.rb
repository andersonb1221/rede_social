class AddFieldsToComentarios < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :comentarios, :posts, on_delete: :cascade
    add_foreign_key :comentarios, :users, on_delete: :cascade
  end
end
