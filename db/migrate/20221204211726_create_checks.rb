# frozen_string_literal: true

# useless migrate
class CreateChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :checks, &:timestamps
  end
end
