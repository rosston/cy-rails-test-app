class CreateCommittees < ActiveRecord::Migration[7.1]
  def change
    create_table :committees do |t|
      t.text :name
      t.belongs_to :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
