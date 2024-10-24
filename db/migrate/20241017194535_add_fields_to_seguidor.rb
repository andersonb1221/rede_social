class AddFieldsToSeguidor < ActiveRecord::Migration[7.1]
  def change
    add_column :seguidors, :nome, :string
    add_column :seguidors, :avatar, :string
    add_column :seguidors, :bio, :string
  end
end
