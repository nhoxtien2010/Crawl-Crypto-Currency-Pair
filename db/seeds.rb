# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }  { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CryptoPair.delete_all
Exchange.delete_all
# seed database for exchanges
{
    coinbase: 'https://www.coinbase.com',
    bitfinex: 'https://www.bitfinex.com',
    bittrex: 'https://bittrex.com/',
    poloniex: 'https://poloniex.com/',
    gdax: 'https://www.gdax.com/'
}.each do |short_name, name|
  Exchange.create(
      name: name,
      short_name: short_name
  )

end

# create fake data for crypto_pairs
stock_time = Time.current

Exchange.all.each do |exc|
  time = stock_time

  %w[btc_usd eth_usd etc_usd].each do |name|
    1000.times do
      time += 1.minute
      CryptoPair.create(
        exchange_id: exc.id,
        name: name,
        value: rand(1..100),
        on_time: time
      )
    end
  end
end

