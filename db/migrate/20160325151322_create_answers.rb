class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :solved, default: false

      t.references :question, null: false, index: true
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
