class AddGuessToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :guess, :string
  end
end
