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

  def self.candle_chart_data(exchange_id)
    return_data = []
    order('on_time asc').where("name='btc_usd' and exchange_id = #{exchange_id}").each_slice(10).each do |cp|
      return_data << {
        date: cp.first.on_time,
        open: cp.first.value,
        close: cp.last.value,
        high: cp.max_by(&:value).value,
        low: cp.min_by(&:value).value,
      }
    end
    return_data
  end
end