class HomeController < ApplicationController
  def index
    exchange = params[:exchange] || 'coinbase'
    @exchange= Exchange.find_by_short_name(exchange)
    @prices = CryptoPair.get_current_prices(exchange)
    respond_to do |format|
      format.html
      format.xml { render :xml => @people.to_xml }
    end
  end

  def candle_stick_chart
    exchange = params[:exchange] || 'coinbase'
    @exchange= Exchange.find_by_short_name(exchange)
    @candle_data = CryptoPair.candle_chart_data(@exchange.id)
  end

end
