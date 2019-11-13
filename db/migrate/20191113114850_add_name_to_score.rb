class AddNameToScore < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :name, :string
  end
end
