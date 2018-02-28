class CreateCryptoPairs < ActiveRecord::Migration[5.1]
  def change
    create_table :crypto_pairs do |t|
      t.text :name
      t.decimal :value # based on USDT value
      t.datetime :on_time
    end

    add_index :crypto_pairs, [:name, :on_time] # value of 2 columns will be distinct
  end
end