# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :username
      t.text :body
      t.references :post, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
