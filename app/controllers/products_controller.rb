class ProductsController < ApplicationController
  #before_filter :require_log_in, :only => [:show, :index]

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end
end