class HomeController < ApplicationController
  def index
    exchange = params[:exchange] || 'coinbase'
    @prices = CryptoPair.get_current_prices(exchange)
    respond_to do |format|
      format.html
      format.xml { render :xml => @people.to_xml }
    end
  end

end
