class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.text :title
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :committee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
