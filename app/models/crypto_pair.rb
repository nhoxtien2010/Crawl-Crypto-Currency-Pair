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
    order('on_time asc').where("name='btc_usd' and exchange_id = #{exchange_id}").each do |cp|
      return_data << {
        date: cp.on_time.to_date,
        close: cp.value,
        open: cp.value-1,
        high: cp.value+2,
        low: cp.value-2
      }
    end
    return_data
  end

end

#
# absoluteChange
# :
#     undefined
# close
# :
#     25.718722
# date
# :
#     Tue Jan 05 2010 00:00:00 GMT+0700 (ICT) {}
# dividend
# :
#     ""
# high
# :
#     25.83502196495549
# low
# :
#     25.452895407434543
# open
# :
#     25.627344939513726
# percentChange
# :
#     undefined
# split
# :
#     ""
# volume
# :
#     49749600