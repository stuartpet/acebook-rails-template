# frozen_string_literal: true

class AddUserToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
