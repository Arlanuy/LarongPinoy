class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :quiz_score, default:0
      t.references :scoreable, polymorphic: true
      t.timestamps
    end
  end
end
