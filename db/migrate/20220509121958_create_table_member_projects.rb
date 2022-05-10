# frozen_string_literal: true

class CreateTableMemberProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :member_projects do |t|
      t.references :member, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
