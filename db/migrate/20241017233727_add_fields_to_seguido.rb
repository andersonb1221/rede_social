class AddFieldsToSeguido < ActiveRecord::Migration[7.1]
  def change
    add_column :seguidos, :nome, :string
    add_column :seguidos, :avatar, :string
    add_column :seguidos, :bio, :string
  end
end
