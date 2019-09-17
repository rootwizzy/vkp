class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :discriminator
      t.string :avatar
      t.string :bot
      t.string :mfa_enabled
      t.string :locale
      t.string :verified
      t.string :flags
      t.string :premium_type

      t.timestamps
    end
  end
end
