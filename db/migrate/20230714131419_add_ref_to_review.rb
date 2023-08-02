# frozen_string_literal: true

class AddRefToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user, null: false, foreign_key: true
    add_reference :reviews, :movie, null: false, foreign_key: true
  end
end
