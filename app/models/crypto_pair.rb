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