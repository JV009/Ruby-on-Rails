# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      t.string   :type, default: 'User', null: false
      t.string   :first_name
      t.string   :last_name
      t.index    :type
    end

    remove_column(:users, :password_digest)
    change_column_default(:users, :email, '')
    remove_column(:users, :name, :string)
  end

  def self.down
    def self.down
      remove_columns(:users, :encrypted_password, :reset_password_token, :reset_password_sent_at,
      :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
      :last_sign_in_ip, :confirmation_tolken, :confirmed_at, :confirmation_sent_at, :unconfirmed_email)

      add_column :users, :password_digest, :string
    end
  end
end
