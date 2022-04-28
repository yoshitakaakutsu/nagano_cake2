class Public::HomesController < ApplicationController
  def top
    @product = Product.limit(4)
  end
end
