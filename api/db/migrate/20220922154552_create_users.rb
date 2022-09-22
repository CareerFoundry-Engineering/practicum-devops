# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :ocupation
      t.string :email
      t.string :bio
      t.string :avatar_url
      t.uuid :uuid, default: "gen_random_uuid()"

      t.timestamps
    end
  end
end
