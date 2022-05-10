# frozen_string_literal: true

class AddForeignKeysToTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :team, foreign_key: true
  end
end
