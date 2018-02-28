class AddExchangeToCryptoPairs < ActiveRecord::Migration[5.1]
  def change
    add_reference :crypto_pairs, :exchange, foreign_key: true
  end
end
