# frozen_string_literal: true

class CreateDailyReports < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_reports do |t|
      t.string :title
      t.text :content
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
