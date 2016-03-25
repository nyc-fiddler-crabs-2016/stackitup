class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false

      t.references :user, null: false, index: true
      t.references :voteable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
