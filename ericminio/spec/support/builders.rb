require File.dirname(__FILE__) + '/quotation_builder'
require File.dirname(__FILE__) + '/stock_builder'
require File.dirname(__FILE__) + '/seller_builder'

module Builders

  def stock
    StockBuilder.new
  end

  def quotation
    QuotationBuilder.new
  end

  def seller(seller)
    builder        = SellerBuilder.new
    builder.seller = seller
    builder
  end

  def a(builder)
    builder.build
  end

end
