# frozen_string_literal: true

class AddAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :integer
  end
end
