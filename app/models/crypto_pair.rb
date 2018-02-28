class CryptoPair < ApplicationRecord
  belongs_to :exchange

  def self.get_current_prices(exchange_key)
    current_exchange = Exchange.find_by_short_name(exchange_key)
    sql = <<-SQL
      SELECT name, max(value) as VALUE
      FROM crypto_pairs
      WHERE exchange_id = #{current_exchange.id}
      GROUP BY name
    SQL

    connection.exec_query(sql).to_a
  end

end
