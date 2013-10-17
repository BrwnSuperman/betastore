class ProductsController < ApplicationController
  skip_before_filter :require_log_in

  def index
    respond_to do |format|
      format.html { @products = Product.all}
      format.any(:rss) { @products = Product.all }
    end
  end

end